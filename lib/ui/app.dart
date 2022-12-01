import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:misiontic_todo/ui/pages/content_page.dart';
import 'package:misiontic_todo/ui/pages/firestore_content_page.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Al Vuelo+',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      // home: const ContentPage(),
      home: const FirestoreContentPage(),
    );
  }
}
