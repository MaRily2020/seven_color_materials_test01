import 'package:flutter/material.dart';
import 'package:seven_color_materials_test01/Model/progress_timeline.dart';
import 'package:seven_color_materials_test01/View/bundle_palette_view.dart';
import 'dart:js' as js;

class Timeline extends StatefulWidget{
  const Timeline({Key? key}) : super(key: key);

  @override
  State<Timeline> createState() => _TimelineState();
}


class _TimelineState extends State<Timeline> {
  bool chckSwitch = false;

  Widget build(BuildContext context) {
    return TransportHeader("test", Color.fromARGB(127,30,30,30));
  }
  /// ヘッダタイトル汎用
  Container CreateHeaderTitle(String _title, Color _color) {
    return Container(
      child: Text(_title, textAlign: TextAlign.start,),
      color: _color,
      margin: const EdgeInsets.only(left: 0),
    );
  }

  /// ヘッダーボディ汎用
  Container CreateHeaderBody(String _title, Color _color) {
    return Container(
      child: Text(_title, textAlign: TextAlign.start,),
      color: _color,
      margin: const EdgeInsets.only(left: 5),
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

  Container TransportHeader(String _title, Color _color) {
    return
      Container(
          child: Column(
              children: [
                CreateHeaderTitle(_title, _color),
                Container(
                    padding: EdgeInsets.only(
                        top: 0, right: 0, bottom: 0, left: 5),
                    child: Column(
                        children: [
                          CreateHeaderBody(
                              "拍子", Color.fromARGB(127, 30, 30, 30)),
                          CreateHeaderBody(
                              "BPM", Color.fromARGB(127, 30, 30, 30)),
                          CreateHeaderBody(
                              "小節", Color.fromARGB(127, 30, 30, 30)),
                          CreateHeaderBody(
                              "拍", Color.fromARGB(127, 30, 30, 30)),
                        ]
                    )
                )
              ]
          )
      );
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