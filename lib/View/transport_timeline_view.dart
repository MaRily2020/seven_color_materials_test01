import 'package:flutter/material.dart';
import 'package:seven_color_materials_test01/Model/progress_timeline.dart';
import 'package:seven_color_materials_test01/View/bundle_palette_view.dart';
import 'package:seven_color_materials_test01/View/timeline_view.dart';
import 'dart:js' as js;

class TransportTimelineView extends TimelineView{
  const TransportTimelineView({Key? key}) : super(key: key);

  @override
  TimelineViewState createState() => _TransportTimelineViewState();
}


class _TransportTimelineViewState extends TimelineViewState {
  @override
  Widget build(BuildContext context) {
    return TransportHeader2("中心", Color.fromARGB(127,30,30,30));
  }
  Container TransportHeader(String _title, Color _color) {
    return
      Container(
          child: Column(
              children: [
                CreateHeaderTitle(_title, _color),
                Container(
                    padding: EdgeInsets.only(
                        top: 0, right: 0, bottom: 0, left: 0),
                    child: Column(
                        children: [
                          CreateHeaderBody(
                              "拍子", Colors.white),
                          CreateHeaderBody(
                              "BPM", Colors.white),
                          CreateHeaderBody(
                              "小節", Colors.white),
                          CreateHeaderBody(
                              "拍", Colors.white),
                        ]
                    )
                )
              ]
          )
      );
  }
  Container TransportHeader2(String _title, Color _color) {
    return
      Container(
        width:100,
        /*
        height:50,

         */
        //color:_color,
        color:Colors.red,
            child:
            ExpansionTile(
              title:CreateHeaderTitle2(_title, _color),
              children: <Widget> [
                CreateHeaderBody2(
                    "拍子", Colors.white),
                CreateHeaderBody2(
                    "BPM", Colors.white),
                CreateHeaderBody2(
                    "小節", Colors.white),
                CreateHeaderBody2(
                    "拍", Colors.white),
              ],
            ),

      );
  }
}