//import 'dart:html';

import 'package:flutter/material.dart';

class BundlePaletteView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BundlePaletteViewState();

}
class _BundlePaletteViewState extends State<BundlePaletteView>{
  String? _centerNote = "";
  int? _regardNoteIndex = 1;
  String _current7CM = "";
  String _parent7CM = "";
  String _closure7CM = "";
  bool _flag1st = true;
  bool _flag2nd = false;
  bool _flag3rd = false;
  bool _flag4th = false;
  bool _flag5th = false;
  bool _flag6th = false;
  bool _flag7th = false;
  Map<int, String> _notes = {};
  List<DropdownMenuItem<int>> _itemsCenterNote = [];
  List<DropdownMenuItem<int>> _itemsRegardNote = [];
  @override void initState() {
    super.initState();
    setItems();
    _regardNoteIndex = _itemsRegardNote[0].value;
  }
  void setItems(){
    _notes.addAll({0:"C♭"});
    _notes.addAll({1:"C"});
    _notes.addAll({2:"C♯"});
    _notes.addAll({10:"D♭"});
    _notes.addAll({11:"D"});
    _notes.addAll({12:"D♯"});
    _notes.addAll({20:"E♭"});
    _notes.addAll({21:"E"});
    _notes.addAll({22:"E♯"});
    _notes.addAll({30:"F♭"});
    _notes.addAll({31:"F"});
    _notes.addAll({32:"F♯"});
    _notes.addAll({41:"G♭"});
    _notes.addAll({41:"G"});
    _notes.addAll({42:"G♯"});
    _notes.addAll({50:"A♭"});
    _notes.addAll({51:"A"});
    _notes.addAll({52:"A♯"});
    _notes.addAll({60:"B♭"});
    _notes.addAll({61:"B"});
    _notes.addAll({62:"B♯"});
    _notes.forEach((key, value) {
      _itemsCenterNote.add(DropdownMenuItem(child: Text(value),value: key,));
      _itemsRegardNote.add(DropdownMenuItem(child: Text(value),value: key,));
    });

    /*
    _itemsCenterNote.add(DropdownMenuItem(child: Text('C♭'),value: "C♭",));
    _itemsCenterNote.add(DropdownMenuItem(child: Text('C'),  value: "C",));
    _itemsCenterNote.add(DropdownMenuItem(child: Text('C♯'),value: "C♯",));
    _itemsCenterNote.add(DropdownMenuItem(child: Text('D♭'),value: "D♭",));
    _itemsCenterNote.add(DropdownMenuItem(child: Text('D'),  value: "D",));
    _itemsCenterNote.add(DropdownMenuItem(child: Text('D♯'),value: "D♯",));
    _itemsCenterNote.add(DropdownMenuItem(child: Text('E♭'),value: "E♭",));
    _itemsCenterNote.add(DropdownMenuItem(child: Text('E'),  value: "E",));
    _itemsCenterNote.add(DropdownMenuItem(child: Text('E♯'),value: "E♯",));
    _itemsCenterNote.add(DropdownMenuItem(child: Text('F♭'),value: "F♭",));
    _itemsCenterNote.add(DropdownMenuItem(child: Text('F'),  value: "F",));
    _itemsCenterNote.add(DropdownMenuItem(child: Text('F♯'),value: "F♯",));
    _itemsCenterNote.add(DropdownMenuItem(child: Text('G♭'),value: "G♭",));
    _itemsCenterNote.add(DropdownMenuItem(child: Text('G'),  value: "G",));
    _itemsCenterNote.add(DropdownMenuItem(child: Text('G♯'),value: "G♯",));
    _itemsCenterNote.add(DropdownMenuItem(child: Text('A♭'),value: "A♭",));
    _itemsCenterNote.add(DropdownMenuItem(child: Text('A'),  value: "A",));
    _itemsCenterNote.add(DropdownMenuItem(child: Text('A♯'),value: "A♯",));
    _itemsCenterNote.add(DropdownMenuItem(child: Text('B♭'),value: "B♭",));
    _itemsCenterNote.add(DropdownMenuItem(child: Text('B'),  value: "B",));
    _itemsCenterNote.add(DropdownMenuItem(child: Text('B♯'),value: "B♯",));


    _itemsRegardNote.add(DropdownMenuItem(child: Text('C♭'),value: "C♭",));
    _itemsRegardNote.add(DropdownMenuItem(child: Text('C'),  value: "C",));
    _itemsRegardNote.add(DropdownMenuItem(child: Text('C♯'),value: "C♯",));
    _itemsRegardNote.add(DropdownMenuItem(child: Text('D♭'),value: "D♭",));
    _itemsRegardNote.add(DropdownMenuItem(child: Text('D'),  value: "D",));
    _itemsRegardNote.add(DropdownMenuItem(child: Text('D♯'),value: "D♯",));
    _itemsRegardNote.add(DropdownMenuItem(child: Text('E♭'),value: "E♭",));
    _itemsRegardNote.add(DropdownMenuItem(child: Text('E'),  value: "E",));
    _itemsRegardNote.add(DropdownMenuItem(child: Text('E♯'),value: "E♯",));
    _itemsRegardNote.add(DropdownMenuItem(child: Text('F♭'),value: "F♭",));
    _itemsRegardNote.add(DropdownMenuItem(child: Text('F'),  value: "F",));
    _itemsRegardNote.add(DropdownMenuItem(child: Text('F♯'),value: "F♯",));
    _itemsRegardNote.add(DropdownMenuItem(child: Text('G♭'),value: "G♭",));
    _itemsRegardNote.add(DropdownMenuItem(child: Text('G'),  value: "G",));
    _itemsRegardNote.add(DropdownMenuItem(child: Text('G♯'),value: "G♯",));
    _itemsRegardNote.add(DropdownMenuItem(child: Text('A♭'),value: "A♭",));
    _itemsRegardNote.add(DropdownMenuItem(child: Text('A'),  value: "A",));
    _itemsRegardNote.add(DropdownMenuItem(child: Text('A♯'),value: "A♯",));
    _itemsRegardNote.add(DropdownMenuItem(child: Text('B♭'),value: "B♭",));
    _itemsRegardNote.add(DropdownMenuItem(child: Text('B'),  value: "B",));
    _itemsRegardNote.add(DropdownMenuItem(child: Text('B♯'),value: "B♯",));

     */
  }

  @override
  Widget build(BuildContext context) {
    //return _createCheckNote(3);
    return Container(
      height: 300,
      child:Column(
        children: <Widget>[
          Row(
            children: [
              /// 音束指定
              DropdownButton(
                items: _itemsRegardNote,
                value: _regardNoteIndex,
                onChanged: (value) => {
                  setState(() {
                    _regardNoteIndex = value as int;
                  }),
                },
              ),

              /// 度数指定
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Wrap(
                    children: <Widget>[
                      /*
                      CheckboxListTile(
                          activeColor: Colors.blue,
                          title: Text('1st'),
                          subtitle: Text(''),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: _flag1st,
                          onChanged: _check1st
                      ),
                      CheckboxListTile(
                          activeColor: Colors.blue,
                          title: Text('2nd'),
                          subtitle: Text(''),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: _flag2nd,
                          onChanged: _check2nd
                      ),
                      CheckboxListTile(
                          activeColor: Colors.blue,
                          title: Text('3rd'),
                          subtitle: Text(''),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: _flag3rd,
                          onChanged: _check3rd
                      ),
                      CheckboxListTile(
                          activeColor: Colors.blue,
                          title: Text('4th'),
                          subtitle: Text(''),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: _flag3rd,
                          onChanged: _check4th
                      ),
                      */
                      _createCheckNote(1),
                      _createCheckNote(3),
                      _createCheckNote(5),
                      _createCheckNote(7),
                      _createCheckNote(2),
                      _createCheckNote(4),
                      _createCheckNote(6),
                      //_createCheckNote(1),
                    ],
                  )
                  /*
                   */
                ],

              ),
            ],
          ),
          Row(
            children: <Widget>[

            ],
          )
        ],
      )
    );
  }
  Widget _createCheckNote(int flag){
    String t="";
    void Function(bool?)? method;
    bool f=false;
    switch(flag){
      case 1: t="1st"; method = _check1st; f = _flag1st; break;
      case 2: t="9th"; method = _check2nd; f = _flag2nd; break;
      case 3: t="3rd"; method = _check3rd; f = _flag3rd; break;
      case 4: t="11th"; method = _check4th; f = _flag4th; break;
      case 5: t="5th"; method = _check5th; f = _flag5th; break;
      case 6: t="13th"; method = _check6th; f = _flag6th; break;
      case 7: t="7th"; method = _check7th; f = _flag7th; break;
      default: break;
    }
    return
      Container(
          width: 89,
          height: 70,
          padding: EdgeInsets.only(top:0, bottom: 0, left: 0, right: 0),
          margin: EdgeInsets.only(top:0, bottom: 0, left: 0, right: 0),
          color: Colors.white,
          child:CheckboxListTile(
              contentPadding: EdgeInsets.all(0),
              activeColor: Colors.blue,
              title: Text(t),
              subtitle: Text(''),
              controlAffinity: ListTileControlAffinity.leading,
              value: f,
              onChanged: method
          )
      );
  }
  void _check1st(bool? value){setState((){_flag1st=value!;});}
  void _check2nd(bool? value){setState((){_flag2nd=value!;});}
  void _check3rd(bool? value){setState((){_flag3rd=value!;});}
  void _check4th(bool? value){setState((){_flag4th=value!;});}
  void _check5th(bool? value){setState((){_flag5th=value!;});}
  void _check6th(bool? value){setState((){_flag6th=value!;});}
  void _check7th(bool? value){setState((){_flag7th=value!;});}
}