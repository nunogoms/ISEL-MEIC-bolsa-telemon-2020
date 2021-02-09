import 'dart:async';
import 'dart:collection';

import 'dart:math';

class MockDevice {
  final Random rnd = Random();
  final HashMap<String,Function (int)> listeners  = HashMap();
  final maxInt = 1024;
  Timer timer ;

  setup(){
    //Timer.periodic(Duration(milliseconds: 100),(Timer t) =>listeners.values.forEach((list) => list(rnd.nextInt(maxInt)) ));
    Timer.periodic(Duration(milliseconds: 1),(Timer t) =>listeners.values.forEach((cb) => cb(rnd.nextInt(maxInt)) ));
  }

  addListener(String hashcode,Function (int) cb)  async {
    this.listeners.putIfAbsent (hashcode, () => cb);
    return Future.value(this.listeners.containsKey(hashCode));
  }

  Future<bool> removeListener(String hashcode)  {
    bool ans = this.listeners.containsKey(hashCode);
    this.listeners.clear();
    return Future.value(ans);
  }

}