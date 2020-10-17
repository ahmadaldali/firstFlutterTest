import 'package:flutter/material.dart';

class ProviderTest extends ChangeNotifier {
  Color menColor = Colors.red;
  Color femaleColor = Colors.white;
  String s = 'init';

  ProviderTest({this.name, this.age});

  final String name;
  int age;

  void increaseAge() {
    this.age++;
    notifyListeners();
  }

  void changeString(String n) {
    this.s = n;
    notifyListeners();
  }

  String get ss {
    return s;
  }

  Color get men {
    return menColor;
  }

  void changeMenColor() {
    menColor == Colors.white ? menColor = Colors.red : menColor = Colors.white;

    notifyListeners();
  }

  void changeFemaleColor() {
    femaleColor == Colors.white
        ? femaleColor = Colors.red
        : femaleColor = Colors.white;

    notifyListeners();
  }
}
