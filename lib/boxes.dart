import 'package:hive/hive.dart';
import 'model.dart';

class Boxes {
  static Box<Model> addToBase() =>
      Hive.box<Model>('hive');
}

