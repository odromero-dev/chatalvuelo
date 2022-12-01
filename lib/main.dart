import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:misiontic_todo/ui/controllers/database.dart';
import 'package:flutter/material.dart';
import 'package:misiontic_todo/ui/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Get.put(DatabaseController());
  runApp(const ToDoApp());
}
