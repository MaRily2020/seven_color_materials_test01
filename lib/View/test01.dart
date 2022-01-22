import 'package:flutter/material.dart';
import 'package:seven_color_materials_test01/Model/progress_timeline.dart';
import 'package:seven_color_materials_test01/View/bundle_palette_view.dart';
import 'package:seven_color_materials_test01/View/abstract_timeline.dart';
import 'dart:js' as js;

class TransportTimeline extends Timeline{
  const TransportTimeline({Key? key}) : super(key: key);

  @override
  State<TransportTimeline> createState() => _TransportTimelineState();
}


class _TransportTimelineState extends State<TransportTimeline> {
  @override
  Widget build(BuildContext context) {
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

class ProgressionView extends StatefulWidget{
  const ProgressionView({Key? key}) : super(key: key);

  @override
  State<ProgressionView> createState() => _ProgressionViewState();
}
class _ProgressionViewState extends State<ProgressionView> {
  bool chckSwitch=false;
  final ProgressTimeline _timeline = ProgressTimeline(beats:4,bars:16);

  void _handlePressed() {
    setState(() {
      chckSwitch= !chckSwitch;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showBottom(){

    var jsMap = js.JsObject.jsify(  [
      'C3', 'D3', 'E3', 'F3',
      'G3', 'A3', 'B3', 'C4'
    ]);

    var melodyList = [
      'C3', 'D3', 'E3', 'F3',
      'G3', 'A3', 'B3', 'C4'
    ];

    //js.context.callMethod("playNote", ["C5", "8n"]);
    //js.context.callMethod("playMelody", melodyList);

    var C_chord = ['C4', 'E4', 'G4', 'B4'];
    var D_chord = ['D4', 'F4', 'A4', 'C5'];
    var G_chord = ['B3', 'D4', 'E4', 'A4'];
    var chordMelody = [
      ['0:0:2', C_chord],
      ['0:1:0', C_chord],
      ['0:1:3', D_chord],
      ['0:2:2', C_chord],
      ['0:3:0', C_chord],
      ['0:3:2', G_chord]
    ];
    js.context.callMethod("playChordMelody", chordMelody);

    //js.context.callMethod("playNote", ["C5", "8n"]);
    /*
    var object = JsObject(context['Object']);
    object['greeting'] = 'Hello';
    object['greet'] = (name) => "${object['greeting']} $name";
    var message = object.callMethod('greet', ['JavaScript']);
    context['console'].callMethod('log', [message]);


    js.context.callMethod("playNote", ["C5", "8n"]);
    */


    _scaffoldKey.currentState!
        .showBottomSheet<Null>((BuildContext context) {
      return BundlePaletteView();
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          color: Colors.green,
          //width: 410,
          child: Column(
            children: [
              Container(
                //width: 300,
                  height:300,
                  color: Colors.deepPurple,
                  child: Row(
                    children: [
                      Container(
                        //width: 52.0,
                        //height: 300.0,
                        //child:Center(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color.fromARGB(120, 30, 30, 30)),
                            color: Colors.white,
                          ),
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
                                Container(width:50, height:50, color:Color.fromARGB(255, 159, 197, 232)),
                                Container(width:50, height:50, color:Color.fromARGB(255, 255, 229, 153)),
                                Container(width:50, height:50, color:Color.fromARGB(255, 182, 215, 168)),
                                Container(width:50, height:50, color:Color.fromARGB(255, 234, 153, 153)),
                                Container(width:50, height:50, color:Color.fromARGB(255, 180, 167, 214)),
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
                              _timeline.add(index+1, beatCount: 4);
                              //_timeline.add(index+1);
                              return _barsBlock(index+1);
                            }
                        ),
                      )
                    ],
                  )
              ),

              ElevatedButton(
                //onPressed: _handlePressed,
                onPressed: _showBottom,
                child: Text(
                  '更新',
                  style: TextStyle(
                      color:Colors.white,
                      fontSize: 20.0
                  ),
                ),
              ),


              //BundlePaletteView()
            ],
          ),
        )
    );
  }


  Container _beatBlock(String head,{String center1="",String center2="", bool even=false}){
    return Container(
        width: 50.0,
//        height: 300.0,
        decoration: even?BoxDecoration(
          border: const Border(
              right: const BorderSide(
                  color: Color.fromARGB(127, 30, 30, 30),
                  width: 0.5
              )
          ),
          color: Colors.white,
        ):BoxDecoration(
          border: const Border(
              right: const BorderSide(
                  color: Color.fromARGB(20, 30, 30, 30),
                  width: 0.01
              )
          ),
        ),
        //child:Center(
        child:Column(
            children: <Widget>[
              Container(
                child:Text(head,textAlign: TextAlign.start,),
                margin: const EdgeInsets.only(left:0),
              ),
              Container(
                child:Text(center1,textAlign: TextAlign.start),
              ),
              Container(
                child:Text(center2,textAlign: TextAlign.start),
              ),
              Container(width:even?49.5:50, height:50, color:Color.fromARGB(255, 207, 226, 243)),
              Container(width:even?49.5:50, height:50, color:Color.fromARGB(255, 255, 242, 204)),
              Container(width:even?49.5:50, height:50, color:Color.fromARGB(255, 217, 234, 211)),
              Container(width:even?49.5:50, height:50, color:Color.fromARGB(255, 244, 204, 204)),
              Container(

                child: GestureDetector(
                  //onTap: _showBottom,
                  onTapUp: (details){
                    details;
                    _showBottom();
                  },
                ),
                width:even?49.5:50,
                height:50,
                color:Color.fromARGB(255, 217, 210, 233),
                /*
                  child:RaisedButton(

                    onPressed: _handlePressed,
                    color: Colors.blue,
                    child: const Text(
                      '更新',
                      style: TextStyle(
                          color:Colors.white,
                          fontSize: 20.0
                      ),),
                  )

                   */
              ),
            ]
        )
      //)
    );
  }

  Widget _barsBlock(int index){
    final ctnList = <Container>[];
    final bar = _timeline[index];
    if(bar == null)throw ArgumentError("指定された小節がありません：${index}");
    double w = bar.length*50;
    for(int i = 1; i <= bar.length; i++){
      String str = "${index}:${i}";
      Container c = _beatBlock(str,even:(i%2==0));
      ctnList.add(c);
    }
    return Container(
      width: w+1,
      //height: 301.0,
      //child:Center(
      child:Row(
          children: ctnList
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(120, 30, 30, 30),width: 0.5),
        color: Colors.white,
      ),
    );
  }
}