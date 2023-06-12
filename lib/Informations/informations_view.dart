import 'package:app_usage/app_usage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Themes/custom_icons.dart';
import 'package:projet_b3/Species/species_view_model.dart';
import 'package:projet_b3/Themes/app_bar.dart';
import 'package:projet_b3/Themes/colors.dart';

class InformationsView extends StatefulWidget {
  @override
  _InformationsViewState createState() => _InformationsViewState();
}

class _InformationsViewState extends State<InformationsView> {
  Map<String, Map<String, dynamic>> uniqueAlerts = {};

  @override
  void initState() {
    super.initState();
    fetchUniqueAlerts();
  }

  Future<void> fetchUniqueAlerts() async {
    try {
      Map<String, Map<String, dynamic>> fetchedAlerts = await SpeciesViewModel().getUniqueAlertsByDate();
      setState(() {
        uniqueAlerts = fetchedAlerts;
      });
    } catch (error, stackTrace) {
      print('Error retrieving unique alerts: $error');
      print(stackTrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool displayRecentNewsTitle = true;
    bool displayOldNewsTitle = true;

    return Scaffold(
      backgroundColor: white,
      appBar: const CustomLocationAppBar(),
      body: ListView.builder(
        itemCount: uniqueAlerts.length,
        itemBuilder: (context, index) {
          String key = uniqueAlerts.keys.elementAt(index);
          Map<String, dynamic> alert = uniqueAlerts[key]!;
          int countNew = 0;
          int countOld = 0;
          Widget recentTitle;
          Widget oldTitle;

          if((alert['date'] as Timestamp).toDate().isAfter(DateTime.now().subtract(const Duration(days: 30)))){
            countNew++;
            if(!displayRecentNewsTitle){
              recentTitle = const SizedBox.shrink();
            }
            else{
              recentTitle = Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child:Text("Il y a du nouveau !   ",
                    style: textItalicStyle,
                    )
                  ),
                  Expanded(child:
                    Container(
                      color: black,
                      height: 1.5,
                    ),
                  )
                ],
              );
              displayRecentNewsTitle = false;
            }

            if (countNew > 0){
              return Container(
                color: greenBrown,
                padding: const EdgeInsets.only(left: 28, right: 28, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    recentTitle,
                    generateAlert(alert, white)
                  ],
                ),
              );
            }
          }
          else{
            countOld++;
            if(!displayOldNewsTitle){
              oldTitle = const SizedBox.shrink();
            }
            else{
              oldTitle = Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child:Text("Précédemment   ",
                      style: textItalicStyle,
                    )
                  ),
                  Expanded(child:
                    Container(
                      color: black,
                      height: 1.5,
                    ),
                  )
                ],
              );
              displayOldNewsTitle = false;
            }

            if(countOld > 0){
              return Container(
                  color: white,
                  padding: horizontalPadding,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      oldTitle,
                      generateAlert(alert, darkBeige)
                    ],
                  )
              );
            }
          }
        },
      ),
    );
  }


  Widget generateAlert(Map<String, dynamic> alert, Color cardBgColor){
    return
      Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: cardBgColor
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child:Row(
                        children:[
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: CustomIcons.bellShadow,
                          ),
                          if(alert['title'] != null)
                            Expanded(child: Text("${alert['title']}", style: smallTitle,),)
                        ]
                    ),
                  ),
                  if(alert['description'] != null)
                    Text(alert['description'], style: textStyle,),
                ],
              )
            ),
          ],
        ),
    );
  }
}