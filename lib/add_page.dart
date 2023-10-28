import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_lesson/main_page.dart';
import 'package:hive_lesson/provider.dart';
import 'package:provider/provider.dart';

import 'boxes.dart';
import 'model.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
        builder: (context, data, _){
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        data.textController.clear();
                        data.numberController.clear();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) =>
                            const MainPage()));
                      },
                      child: const Text('Back')
                  ),
                  TextField(
                    controller: data.textController,
                  ),
                  TextField(
                    controller: data.numberController,
                  ),
                  Container(
                    width: 200,
                    height: 100,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.red,
                              Colors.blue
                            ]
                        )
                    ),
                    child: CupertinoSwitch(
                      value: data.switchValue,
                      onChanged: (value) => data.switchColor(value),
                    ),
                  ),
                  ValueListenableBuilder(
                      valueListenable: Boxes.addToBase().listenable(),
                      builder: (context, box, _){
                        final value = box.values.toList().cast<Model>();
                        return ElevatedButton(
                            onPressed: () => !data.isEdit
                                ? data.addToBase()
                                : data.editToBase(
                                data.editIndex,
                                data.textController.text,
                                int.parse(data.numberController.text),
                                data.switchValue,
                                box),
                            child: Text(!data.isEdit
                                ? 'Add to base'
                                : 'Edit to Base'));
                      }),
                ],
              ),
            ),
          );
        });
  }
}
