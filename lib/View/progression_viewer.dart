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
    /*
    var items = [
      _DLSTBlocks(),
      _DLSTBlocks(),
      _DLSTBlocks(),
      _DLSTBlocks(),
      _DLSTBlocks(),
    ];

     */
    return Scaffold(
        appBar: AppBar(
          title: Text("Viewer"),
        ),
        body:
            Container(
              child: Row(
                children: [
                  /*
                  Container(
                    child:Column(
                      children:<Widget>[
                        Container(width:50, height:50, color:Colors.orange),
                        Container(width:50, height:50, color:Colors.yellow),
                        Container(width:50, height:50, color:Colors.lightBlueAccent),
                        Container(width:50, height:50, color:Colors.grey),
                      ]
                    )
                  ),
                   */
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
                          /*
                           */
                          return _DLSTBlocks(context);
                        }
                    )
                  )
                ],
              )
            )
    );
  }
  Widget _DLSTBlocks(BuildContext context) {
    return Container(
        color: Colors.deepPurpleAccent,
        /*
        width: 100.0,
        height: 100.0,
         */
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
  bool chckSwitch=true;

  void _handlePressed() {
    setState(() {
      chckSwitch= !chckSwitch;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        Container(
          child: Column(
            children: [
              Container(
                //width: 300,
                  height:300,
                  color: Colors.deepPurple,
                  child: Row(
                    children: [
                      Container(
                          color: Colors.deepPurpleAccent,
                          //width: 52.0,
                          //height: 300.0,
                          //child:Center(
                          child:Column(
                              children: <Widget>[
                                Container(
                                  child:Text("Bar"),
                                ),
                                Container(
                                  child:Text("Centor1"),
                                ),
                                Container(
                                  child:Text("Centor2"),
                                ),
                                Container(width:50, height:50, color:Colors.white70),
                                Container(width:50, height:50, color:Colors.orange),
                                Container(width:50, height:50, color:Colors.yellow),
                                Container(width:50, height:50, color:Colors.lightBlueAccent),
                                Container(width:50, height:50, color:Colors.grey),
                              ]
                          )
                        //)
                      ),
                      Flexible(    //Flexibleでラップ
                        child: ListView.builder(
                            physics: chckSwitch ? const  NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
                            //shrinkWrap: true, // use this
                            scrollDirection: Axis.horizontal,
                            itemCount: 600,
                            itemBuilder: (BuildContext context, int index) {
                              return _DLSTBlocks();
                            }
                        ),
                      )
                    ],
                  )
              ),

              ElevatedButton(
                onPressed: _handlePressed,
                child: Text(
                  '更新',
                  style: TextStyle(
                      color:Colors.white,
                      fontSize: 20.0
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
  Widget _DLSTBlocks() {
    return Container(
        color: Colors.deepPurpleAccent,
        width: 52.0,
        height: 300.0,
        //child:Center(
        child:Column(
            children: <Widget>[
              Container(
                child:Text("Bar"),
              ),
              Container(
                child:Text("Centor1"),
              ),
              Container(
                child:Text("Centor2"),
              ),
              Container(width:50, height:50, color:Color.fromARGB(255, 240, 250, 255)),
              Container(width:50, height:50, color:Color.fromARGB(255, 255, 240, 220)),
              Container(width:50, height:50, color:Color.fromARGB(255, 240, 240, 210)),
              Container(width:50, height:50, color:Color.fromARGB(255, 240, 240, 255)),
              Container(width:50, height:50, color:Color.fromARGB(255, 210, 210, 210)),
            ]
        )
      //)
    );
  }
}