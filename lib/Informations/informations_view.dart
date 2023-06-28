import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Themes/unseen_icons.dart';
import 'package:projet_b3/Species/species_view_model.dart';
import 'package:projet_b3/Themes/app_bar.dart';
import 'package:projet_b3/Themes/colors.dart';

import '../Themes/components.dart';

class InformationsView extends StatefulWidget {
  @override
  _InformationsViewState createState() => _InformationsViewState();
}

class _InformationsViewState extends State<InformationsView> {
  List<Map<String, dynamic>> uniqueAlerts = [];

  @override
  void initState() {
    super.initState();
    fetchUniqueAlerts();
  }

  Future<void> fetchUniqueAlerts() async {
    try {
      List<Map<String, dynamic>> fetchedAlerts = await SpeciesViewModel().getUniqueAlertsByDate();
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
    final double statusBarHeight = MediaQueryData.fromWindow(window).padding.top;
    return Container(
      margin: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
        backgroundColor: white,
        appBar: const CustomLocationAppBar(),
        body: ListView.builder(
          itemCount: uniqueAlerts.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> alert = uniqueAlerts[index];
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
                        padding: const EdgeInsets.only(top: 25, bottom: 25),
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
                  padding: const EdgeInsets.only(left: 28, right: 28, bottom: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      recentTitle,
                      iconBlock(alert["title"], alert["description"], white, CustomIcons.bellShadow )
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
                        padding: const EdgeInsets.only(top: 25, bottom: 25),
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
                    margin: const EdgeInsets.only(bottom: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        oldTitle,
                        iconBlock(alert["title"], alert["description"], darkBeige, CustomIcons.bellShadow)
                      ],
                    )
                );
              }
            }
          },
        ),
      )
    );
  }



}