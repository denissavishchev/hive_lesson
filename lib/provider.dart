import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'boxes.dart';
import 'model.dart';

class Data with ChangeNotifier {

  int editIndex = 0;
  bool isEdit = true;

  void editTask(int index, String name, int number, bool color, Box<Model> box){
    textController.text = name;
    numberController.text = number.toString();
    switchValue = color;
    editIndex = index;
    notifyListeners();
  }

  void editToBase(int index, String name, int number, bool color, Box<Model> box){
    box.putAt(index, Model()
      ..text = name
      ..number = number
      ..color = color
    );
  }

  void deleteTask(Box<Model> box, int index){
    box.deleteAt(index);
  }

  Future addToBase() async{
    final something = Model()
      ..text = textController.text.trim()
      ..number = int.parse(numberController.text)
      ..color = switchValue;
    final box = Boxes.addToBase();
    box.add(something);
  }

  bool switchValue = true;
  TextEditingController textController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  void switchColor(bool value){
    switchValue = !switchValue;
    switchValue = value;
    notifyListeners();
  }

}