import 'package:flutter/widgets.dart';
import 'package:gemini_ai/helper/db_helper.dart';
import 'package:gemini_ai/modals/history_modal.dart';

class HistoryController extends ChangeNotifier {
  HistoryController() {
    getData();
  }

  Future<void> initData() async {
    await DbHelper.dbHelper.initDb();
    notifyListeners();
  }

  List<HistoryModel> history = [];
  Future<void> getData() async {
    history = await DbHelper.dbHelper.readData();
    notifyListeners();
  }

  Future<void> insertData({required HistoryModel model}) async {
    await DbHelper.dbHelper.insertData(model: model);
    getData();
    notifyListeners();
  }
}
