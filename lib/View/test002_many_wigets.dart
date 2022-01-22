import 'package:flutter/material.dart';
import 'package:seven_color_materials_test01/Model/progress_timeline.dart';
import 'package:seven_color_materials_test01/View/bundle_palette_view.dart';
import 'package:seven_color_materials_test01/View/timeline_view.dart';

import 'package:seven_color_materials_test01/View/transport_timeline_view.dart';
import 'dart:js' as js;

class ManyWigets extends StatefulWidget{
  const ManyWigets({Key? key}) : super(key: key);

  @override
  State<ManyWigets> createState() => _ManyWigetsState();
}


class _ManyWigetsState extends State<ManyWigets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TransportTimelineView()
    );
  }
}