import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_lesson/provider.dart';
import 'package:provider/provider.dart';
import 'main_page.dart';
import 'model.dart';
import 'package:provider/provider.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ModelAdapter());
  await Hive.openBox<Model>('hive');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Data(),
      builder: (context, child){
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainPage(),
        );
      },
    );
  }
}

