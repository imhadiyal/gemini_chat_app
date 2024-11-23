import 'package:flutter/material.dart';
import 'package:gemini_ai/controller/db_controller.dart';
import 'package:gemini_ai/modals/history_modal.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    HistoryController historyController =
        Provider.of<HistoryController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Page"),
      ),
      body: ListView.builder(
        itemCount: historyController.history.length,
        itemBuilder: (context, index) {
          HistoryModel data = historyController.history[index];
          ListTile(
            title: Text(data.answer.toString()),
          );
        },
      ),
    );
  }
}
