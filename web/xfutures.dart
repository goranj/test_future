import 'package:web_ui/web_ui.dart';
import 'dart:async';
import 'test_future.dart';

class FuturesComponent extends WebComponent {

  void buttonClicked() {
    appObject.buttonClicked();
    print('xfutures click');
  }
}