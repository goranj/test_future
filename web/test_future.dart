library test_future;

import 'package:web_ui/web_ui.dart';
import 'package:web_ui/watcher.dart' as watchers;
import 'dart:async';

part 'futureresult.dart';
part 'futures_store.dart';

FuturesApp appObject = new FuturesApp();

//
// TODO: check out quiver http://pub.dartlang.org/packages/quiver
//

void main() {
  // Enable this to use Shadow DOM in the browser.
  //useShadowDom = true;
}

class FuturesApp {

  FuturesStore _store = new FuturesStore();

  List<FutureResult> get futureResults => _store.futureResults;

  void buttonClicked() {

    List<Future> jobList = new List();

    jobList.add(_store.addFutureResult('res 2', 2));
    jobList.add(_store.addFutureResult('res 1', 1));
    jobList.add(_store.addFutureResult('res 3', 3));
    jobList.add(_store.addFutureResult('res 4', 4));

    Future.wait(jobList).then((List values) {
      values.forEach((value) => print(value));
      watchers.dispatch();
    });
    print('appObject click');
  }

  void loadData() {
    _store.loadData(4).then((value) {
      print(value);
      watchers.dispatch();
    });
    print('appObject loadData');
  }
}
