import 'dart:io';
import 'dart:typed_data';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projet_b3/main.dart';
import 'package:image/image.dart' as img;


class TfliteModel extends StatefulWidget {
  const TfliteModel({Key? key}) : super(key: key);

  @override
  State<TfliteModel> createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {


  late File _image;
  late List _results;
  bool imageSelect = false;

  @override
  void initState(){
    super.initState();
    loadModel();
  }

  Uint8List imageToByteListUint8(img.Image image, int inputSize) {
    var convertedBytes = Uint8List(1 * inputSize * inputSize * 3);
    var buffer = Uint8List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = img.getRed(pixel);
        buffer[pixelIndex++] = img.getGreen(pixel);
        buffer[pixelIndex++] = img.getBlue(pixel);
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

  Uint8List imageToByteListFloat32(img.Image image, int inputSize, double mean, double std) {
    var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = (img.getRed(pixel) - mean) / std;
        buffer[pixelIndex++] = (img.getGreen(pixel) - mean) / std;
        buffer[pixelIndex++] = (img.getBlue(pixel) - mean) / std;
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

  /*
  Uint8List imageToByteListFloat32(img.Image image, int inputSize) {
    var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = img.getRed(pixel).toDouble();
        buffer[pixelIndex++] = img.getGreen(pixel).toDouble();
        buffer[pixelIndex++] = img.getBlue(pixel).toDouble();
      }
    }
    return convertedBytes.buffer.asUint8List();
  }*/

  Future imageClassification(File image)
  async {


    List<int> bytes = await image.readAsBytes();
    img.Image? imageInput = img.decodeImage(bytes);
    img.Image resizedImage = img.copyResize(imageInput!, width: 224, height: 224);

    print("*** width: "+resizedImage.width.toString() + " height : "+ resizedImage.height.toString());
    Uint8List imageInputUint8 = resizedImage.getBytes(format: img.Format.rgb);
    img.Image? theResizedImage = img.decodeImage(imageInputUint8);


    Uint8List theImage = imageToByteListFloat32(theResizedImage!, 224, 127.5, 127.5);
    print("*** "+theImage.toString());
    //img.Image? imagetoJpg = img.decodeJpg(imageInputUint8);
    //img.Image? imageToTest = img.decodeImage(imageInputUint8);

    var recognition = await Tflite.runModelOnBinary(
        binary: theImage,
        numResults: 2, // get this value to be the number of classes you have
        threshold: 0.05, // defaults to 0.1, or put whatever you want here
        asynch: true // defaults to true
    );

    setState(() {
      _results = recognition!;
      _image = image;
      imageSelect = true;
    });
  }

  Future loadModel()
  async {
    Tflite.close();
    String? res;
    res = await Tflite.loadModel(
      model: 'assets/lite-model_aiy_vision_classifier_insects_V1_3.tflite',
      labels: 'assets/aiy_insects_V1_labelmap.csv');

    print("Models loading status : $res");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Classification Image"),
      ),
      body: ListView(
        children: [
          (imageSelect)?Container(
            margin: EdgeInsets.all(10),
            child: Image.file(_image),
          ):Container(
            margin: const EdgeInsets.all(10),
              child: const Opacity(
                opacity: 0.8,
                child: Center(
                  child: Text('Aucune image séléctionnée'),
              ),
            ),
      ),
          SingleChildScrollView(
            child: Column(
              children: (imageSelect)?_results.map((result){
                return Card(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "${result['label']} - ${result['confidence'].toStringAsFixed(2)}",
                      style: const TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                );
              }).toList():[],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        tooltip: "Choisir une image",
        child: const Icon(Icons.image),
      ),
    );
  }

  Future pickImage()
  async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File image= File(pickedFile!.path);
    imageClassification(image);
  }
}
