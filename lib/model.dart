import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class Model extends HiveObject{
  @HiveField(0)
  late String text;
  @HiveField(1)
  late int number;
  @HiveField(2)
  late bool color;
}

