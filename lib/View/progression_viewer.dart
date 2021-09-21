import 'package:flutter/material.dart';

class ProgressionViewer2 extends StatefulWidget{
  const ProgressionViewer2({Key? key}) : super(key: key);

  @override
  State<ProgressionViewer2> createState() => _ProgressionViewerState2();
}


class _ProgressionViewerState2 extends State<ProgressionViewer2> {
  @override
  Widget build(BuildContext context) {
    int bar = 0;
    var bars =[];
    var items = [
      _DLSTBlocks(),
      _DLSTBlocks(),
      _DLSTBlocks(),
      _DLSTBlocks(),
      _DLSTBlocks(),
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text("Viewer"),
        ),

        body:
            Container(
              child: Row(
                children: [
                  Container(
                    child:Column(
                      children:<Widget>[
                        Container(width:50, height:30, color:Colors.orange),
                        Container(width:50, height:50, color:Colors.yellow),
                        Container(width:50, height:50, color:Colors.lightBlueAccent),
                        Container(width:50, height:50, color:Colors.grey),
                      ]
                    )
                  ),
                  Container(
                    child:GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          if (index >= bars.length) {
                            bars.addAll(["pic0", "pic1", "pic2", "pic3", "pic4", "pic5",]);
                          }
                          return _DLSTBlocks();
                        }
                    )
                  )
                ],
              )
            )
    );
  }
  Widget _DLSTBlocks() {
    return Container(
        color: Colors.deepPurpleAccent,
        width: 100.0,
        height: 100.0,
        //child:Center(
        child:Column(
            children: <Widget>[
              Container(width:50, height:50, color:Colors.orange),
              Container(width:50, height:50, color:Colors.yellow),
              Container(width:50, height:50, color:Colors.lightBlueAccent),
              Container(width:50, height:50, color:Colors.grey),
            ]
        )
      //)
    );
  }
}

class ProgressionViewer extends StatefulWidget{
  const ProgressionViewer({Key? key}) : super(key: key);

  @override
  State<ProgressionViewer> createState() => _ProgressionViewerState();
}
class _ProgressionViewerState extends State<ProgressionViewer> {
  var _countD=0;
  var _countL=0;
  var _countS=0;
  var _countT=0;
  @override
  Widget build(BuildContext context) {
    int bar = 0;
    var bars =[];
    var items = [
      _DLSTBlocks(),
      _DLSTBlocks(),
      _DLSTBlocks(),
      _DLSTBlocks(),
      _DLSTBlocks(),
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text("Viewer"),
        ),
        /*
        body: GridView.count(
            crossAxisCount: 8,
            scrollDirection: Axis.horizontal,
            children: items
        )
        */

        body:
        GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.25,
            //scrollDirection: Axis.horizontal,
            children: [
              _DLSTBlocks(),
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    if (index >= bars.length) {
                      bars.addAll(["pic0", "pic1", "pic2", "pic3", "pic4", "pic5",]);
                    }
                    return _DLSTBlocks();
                  }
              )
            ]
        )

    );
  }
  Widget _DLSTBlocks() {
    return Container(
        color: Colors.deepPurpleAccent,
        width: 100.0,
        height: 100.0,
        //child:Center(
        child:Column(
            children: <Widget>[
              Container(width:20, height:20, color:Colors.orange),
              Container(width:20, height:20, color:Colors.yellow),
              Container(width:20, height:20, color:Colors.lightBlueAccent),
              Container(width:20, height:20, color:Colors.grey),
            ]
        )
      //)
    );
  }
}