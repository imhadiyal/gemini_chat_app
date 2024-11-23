import 'package:flutter/material.dart';
import 'package:gemini_ai/controller/controller.dart';
import 'package:gemini_ai/controller/db_controller.dart';
import 'package:gemini_ai/helper/db_helper.dart';
import 'package:provider/provider.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDb();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ApiController(),
        ),
        ChangeNotifierProvider(
          create: (_) => HistoryController(),
        )
      ],
      child: const MyApp(),
    ),
  );
}
