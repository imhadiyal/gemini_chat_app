import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:gemini_ai/modals/gemini_modals.dart';
import 'package:gemini_ai/services/api_services.dart';

class ApiController extends ChangeNotifier {
  List<Model> list = <Model>[];

  bool isLoading = false;

  Future<void> initData({required text}) async {
    isLoading = true;
    String data = await ApiHelper.apiHelper.init(text: text);
    list.add(
      Model(
        text: text,
        ai: data,
      ),
    );
    notifyListeners();
  }
}
