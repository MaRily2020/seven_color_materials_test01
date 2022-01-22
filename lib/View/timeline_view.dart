import 'package:flutter/material.dart';
import 'package:seven_color_materials_test01/Model/progress_timeline.dart';
import 'package:seven_color_materials_test01/View/bundle_palette_view.dart';
import 'dart:js' as js;

class TimelineView extends StatefulWidget{
  const TimelineView({Key? key}) : super(key: key);

  @override
  State<TimelineView> createState() => TimelineViewState();
}


class TimelineViewState extends State<TimelineView> {
  bool chckSwitch = false;

  Widget build(BuildContext context) {
    return CreateHeaderTitle("test", Color.fromARGB(127,30,30,30));
  }

  Container CreateHeaderTitle(String _title, Color _color) {
    return Container(
        child: CreateHeaderTitle2(_title, _color),
        color: _color,
        margin: const EdgeInsets.only(left: 0),
        height:50,
        width:50,
    );
  }
  /// ヘッダタイトル汎用
  Text CreateHeaderTitle2(String _title, Color _color) {
    return Text(_title, textAlign: TextAlign.start,
        style: TextStyle(
          backgroundColor: Colors.white,
          color: Colors.blue,
          fontSize: 20,
          //fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          letterSpacing: 0,
        ));
  }

  /// ヘッダーボディ汎用
  Container CreateHeaderBody(String _title, Color _color) {
    return Container(
      child: Text(_title, textAlign: TextAlign.start,
        style: TextStyle(
          backgroundColor: Colors.red,
          color: Colors.white,
          fontSize: 15,
          //fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          letterSpacing: 00,
        ),),
      color: _color,
      margin: const EdgeInsets.only(left: 0),
      padding: const EdgeInsets.only(left: 15),
      height:50,
      width:50,
    );
  }

  /// ヘッダーボディ汎用
  ListTile CreateHeaderBody2(String _title, Color _color) {
    return ListTile(
      title:Text(_title),
      /*
      trailing: Container(
        height: 48,
        width: 48,
        //color:Colors.green,
      ),

       */
    );
  }
  /// タイムラインタイトル汎用
  Container CreateTimelineTitle(String _title, Color _color) {
    return CreateHeaderTitle(_title, _color);
  }

  /// タイムラインボディ汎用
  Container CreateTimelineBody(String _title, Color _color) {
    return CreateHeaderBody(_title, _color);
  }


/*

  Container TransportBody() {
    return
      Flexible( //Flexibleでラップ
        child: ListView.builder(
            physics: chckSwitch
                ? const NeverScrollableScrollPhysics()
                : const AlwaysScrollableScrollPhysics(),
            //shrinkWrap: true, // use this
            scrollDirection: Axis.horizontal,
            itemCount: 600,
            itemBuilder: (BuildContext context, int index) {
              //_timeline.add(index + 1, beatCount: 4);
              //_timeline.add(index+1);
              return _barsBlock(index + 1);
            }
        ),
      );
  }

   */
}