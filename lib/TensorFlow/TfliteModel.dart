import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projet_b3/main.dart';
import 'package:tflite/tflite.dart';

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


  Future imageClassification(File image)
  async {
    var recognition = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 6,
        threshold: 0.05,
        imageMean: 127.5,
        imageStd: 127.5,
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
    String res;
    res = (await Tflite.loadModel(model: 'assets/lite-model_aiy_vision_classifier_insects_V1_3.tflite'))!;
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
