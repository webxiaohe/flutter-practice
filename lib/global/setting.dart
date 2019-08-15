import 'package:scoped_model/scoped_model.dart';

class Settings extends Model {
  int _counter = 1;
  String _name = "zhangsan";
  String get name => _name;
  int get counter => _counter;
  void increment() {
    // First, increment the counter
    _counter++;

    // Then notify all the listeners.
    notifyListeners();
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }
}
