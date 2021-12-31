import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var txtcntrl = TextEditingController();

  Future save() async {
    var ad = await getApplicationDocumentsDirectory();

    var filePath = ad.path;

    var file = File("$filePath/file.txt");

    file.writeAsString(txtcntrl.text);

    txtcntrl.text="";
  }

  Future read() async {
    try {
      var ad = await getApplicationDocumentsDirectory();

      var filePath = ad.path;

      var file = File("$filePath/file.txt");

      String text;

      text = await file.readAsString();

      txtcntrl.text = text;
    } catch (e) {
      e.toString();
    }
  }

  Future delete() async {
    var ad = await getApplicationDocumentsDirectory();

    var filePath = ad.path;

    var file = File("$filePath/file.txt");

    file.delete();

    txtcntrl.text="";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Path Provider Tutorial',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Path Provider Tutorial"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: txtcntrl,
                  decoration: InputDecoration(hintText: "Enter Something"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          save();
                        },
                        child: Text("Save")),
                    ElevatedButton(
                        onPressed: () {
                          read();
                        },
                        child: Text("Read")),
                    ElevatedButton(
                        onPressed: () {
                          delete();
                        },
                        child: Text("Delete")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
