class ProgressTimeline {
  ///
  static const constBeatCount=4;
  /// 小節の集合
  final Map<int, Bar> _bars = {};
  /// 小節の集合
  Map<int, Bar> get bars => _bars;
  /// コンストラクタ
  ProgressTimeline({int beats=4, int bars=16}){
    for(int i = 1; i <= bars; i++){
      add(i, beatCount: beats);
    }
  }
  /// 拍数
  int beatCount(int index){
    int rtn = 0;
    for(int i = 1; i <= index; i++){
      if(_bars[i] == null) throw Exception("小節数は${_bars.length}の${index}小節までの拍数をカウント中に${i}小節でnullを検知しました。");
      rtn += _bars[i]!.length;
    }
    return rtn;
  }
  int get barCount =>_bars.length;
  int get lengthAll{
    return beatCount(_bars.keys.length);
  }
  /// 小節を加える
  Bar add(int index, {int beatCount=constBeatCount}){
    /// 指定拍数の小節を用意
    Bar rtn = Bar(beatCount);
    /// 追加したい先のインデックス
    int _appendLastCount = index-_bars.length;
    /// 現状の小節数より大きい場合は、そこまで空を追加
    if(_appendLastCount > 0) {
      for (int i = 1; i < _appendLastCount; i++) {
        _bars.addAll({_bars.length + 1: Bar(beatCount)});
      }
      _bars.addAll({index: rtn});
    }else {
      Map<int, Bar> _temp = {};

      /// 挿入する小節よりあとのものは一個ずらして避けておく
      _bars.forEach((key, value) {
        if (index <= key) {
          _temp.addAll({key + 1: value});
        }
      });

      /// 小節挿入
      _bars[index] = rtn;

      /// 避けておいた小節たちを戻す
      _temp.forEach((key, value) {
        if (index < key) {
          _bars[key] = value;
        }
      });
    }
    return rtn;
  }
  /// 小節を消す
  Bar? remove(int index){
    Bar? rtn = _bars[index];
    if(rtn == null)return null;

    Map<int, Bar> _temp ={};

    /// 消す小節よりあとのものは一個ずらして避けておく
    _bars.forEach((key, value) {
      if(index < key){
        _temp.addAll({key-1:value});
      }
    });
    /// 小節削除
    _bars.remove(index);
    /// 避けておいた小節たちを戻す
    _temp.forEach((key, value) {
      if(index <= key){
        _bars[key]=value;
      }
    });
    return rtn;
  }
  Bar? operator[](int index){return _bars[index];}
}
/// 小節クラス
class Bar{
  /// 小説内の拍たち
  final Map<int, Beat> _beats = {};
  /// 小説内の拍たち
  get beats => _beats;
  /// 拍の数
  int get length => _beats.length;
  /// 拍の数
  set length(int value){
    final int count = value-length;
    final int l = length;
    if(count>0){
      for(int i = 0; i < count; i++){
        add(l+i, Beat());
      }
    }else if(count<0){
      for(int i = 0; i < -1*count; i++){
        _beats.remove(l-i);
      }
    }
  }

  /// 指定拍数の小節を作成する
  Bar(int beatCount){
    for(int i = 1; i <= beatCount; i++){
      _beats.addAll({(i):Beat()});
    }
  }
  /// 指定した拍箇所に、拍を挿入する。基本的に小節には拍を敷き詰めているので置き換わる
  Bar add(int index, Beat p){
    if(_beats.containsKey(index)) {
      _beats[index] = p;
    }else{
      _beats.addAll({index:p});
    }
    return this;
  }
  /// 配列アクセス
  Beat? operator[](int index){return _beats[index];}
}

/// 拍クラス。拍の中のTicsをインデックスとしてオブジェクトを持つ
class Beat{
  /// ティックス(定数：480)
  static const tics=480;
  /// 拍内のイベントたち
  final Map<int, MusicalEvent> _events = {};
  /// 分解能。非負。分解の２の場合、イベントは0と240にのみセットできる。保持自体は120とかにも可能だが、セットする前に分解能を4の倍数に変更してからセットする必要がある。
  int _resolution=-1;
  get resolution => _resolution;
  set resolution(value){
    if(value < 1 || value > tics){
      throw Exception("Beatの分解能は1～${tics}である必要があります：value=${value}");
    }
    _resolution=value;
  }
  /// 配列アクセス
  MusicalEvent? operator[](int index){return _events[index];}

  Beat({int res=2}){
    resolution = res;
  }
  /// 拍内の任意のTicへMusicalEventを登録する。ただしクォンタイズされるため、細かくする場合は分解能の変更が必要
  MusicalEvent add(int index, MusicalEvent p) {
    int idx = quantize(index);
    if(_events.containsKey(idx)) {
      _events[idx] = p;
    }else{
      _events.addAll({idx:p});
    }
    return p;
  }
  /// 拍内のMusicalEventを削除する
  void remove(int index) {
    _events.remove(index);
  }
  /// 分解能(resolution)の最小へクォンタイズする
  int quantize(int num){
    final int width= tics ~/ _resolution;
    for(int i = 0; i < _resolution; i++){
      if(i*width <= num && num < (i+1)*width) return i*width;
    }
    return -1;
  }
}
class MusicalEvent{}