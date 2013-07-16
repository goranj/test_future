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

  Future loadData(int delay) {

    var completer = new Completer();

    new Timer(new Duration(seconds: delay), () {
      futureResults.add(new FutureResult('res 1'));
      futureResults.add(new FutureResult('res 2'));
      futureResults.add(new FutureResult('res 3'));
      futureResults.add(new FutureResult('res 4'));
      print('timer fired after $delay seconds');
      return completer.complete('results added by store');
    });
    return completer.future;
  }
}