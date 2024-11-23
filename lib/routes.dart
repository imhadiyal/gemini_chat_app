import 'package:flutter/cupertino.dart';
import 'package:gemini_ai/Screen/history_page.dart';
import 'package:gemini_ai/Screen/home_page.dart';

class Routes {
  Routes._();
  static final Routes routes = Routes._();
  String homepage = '/';
  String historypage = 'history_page';
  Map<String, Widget Function(BuildContext)> route = {
    '/': (context) => const HomePage(),
    'history_page': (context) => const HistoryPage(),
  };
}
