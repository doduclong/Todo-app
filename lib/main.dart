import 'package:flutter/material.dart';
import 'package:todo/core/database/database.dart';

import 'app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // Khởi tạo database
  final db = DBProvider();
  final database = await db.database;
  runApp(const MyApp());
}


