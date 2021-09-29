import 'package:flutter/material.dart';
import 'package:seven_color_materials_test01/Model/progress_timeline.dart';
import 'package:seven_color_materials_test01/View/bundle_palette_view.dart';

class ProgressionViewer2 extends StatefulWidget{
  const ProgressionViewer2({Key? key}) : super(key: key);

  @override
  State<ProgressionViewer2> createState() => _ProgressionViewerState2();
}


class _ProgressionViewerState2 extends State<ProgressionViewer2> {
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
  /*

  Widget _Blocks2(String head,{String head1="",String head2=""}){
    return Container(
        color: Colors.white,
        width: 52.0,
        height: 300.0,
        //child:Center(
        child:Column(
            children: <Widget>[
              Container(
                child:Text(head),
              ),
              Container(
                child:Text(head1),
              ),
              Container(
                child:Text(head2),
              ),
              Container(width:50, height:50, color:Color.fromARGB(255, 207, 226, 243)),
              Container(width:50, height:50, color:Color.fromARGB(255, 255, 242, 204)),
              Container(width:50, height:50, color:Color.fromARGB(255, 217, 234, 211)),
              Container(width:50, height:50, color:Color.fromARGB(255, 244, 204, 204)),
              Container(width:50, height:50, color:Color.fromARGB(255, 217, 210, 233)),
            ]
        )
      //)
    );
  }
  Widget _DLSTBlocks(int index, Bar currentBar) {
    return Container(
        color: Colors.white,
        width: 50.0,
        height: 300.0,
        //child:Center(
        child:Column(
            children: <Widget>[
              Container(
                child:Text("${index}:a", textAlign: TextAlign.left),
                margin: const EdgeInsets.only(left:0),
              ),
              Container(
                child:Text("C", textAlign: TextAlign.left),
                margin: const EdgeInsets.only(left:0),
              ),
              Container(
                child:Text("F", textAlign: TextAlign.left),
                margin: const EdgeInsets.only(left:0),
              ),
              Container(width:50, height:50, color:Color.fromARGB(255, 207, 226, 243)),
              Container(width:50, height:50, color:Color.fromARGB(255, 255, 242, 204)),
              Container(width:50, height:50, color:Color.fromARGB(255, 217, 234, 211)),
              Container(width:50, height:50, color:Color.fromARGB(255, 244, 204, 204)),
              Container(width:50, height:50, color:Color.fromARGB(255, 217, 210, 233)),
            ]
        )
      //)
    );
  }
*/
}