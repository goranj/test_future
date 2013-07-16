part of test_future;

class FuturesStore {

  final List<FutureResult> futureResults = toObservable(new List());

  Future addFutureResult(String result, int delay) {

    var completer = new Completer();

    new Timer(new Duration(seconds: delay), () {
      futureResults.add(new FutureResult(result));
      print('timer fired for $result');
      return completer.complete('$result added by store');
    });
    return completer.future;
  }
}