import 'package:flutter/material.dart';
import 'package:gemini_ai/controller/controller.dart';
import 'package:gemini_ai/helper/db_helper.dart';
import 'package:gemini_ai/modals/gemini_modals.dart';
import 'package:gemini_ai/modals/history_modal.dart';
import 'package:gemini_ai/routes.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    ApiController controller = Provider.of<ApiController>(context);
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.routes.historypage);
            },
            icon: const Icon(Icons.history)),
        title: const Text('HomePage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: ListView.builder(
                itemCount: controller.list.length,
                itemBuilder: (context, index) {
                  Model data = controller.list[index];
                  return ListTile(
                    title: Text(data.text),
                    subtitle: Text(data.ai),
                  );
                  // return Container(
                  //   margin: const EdgeInsets.symmetric(vertical: 10),
                  //   padding: const EdgeInsets.all(10),
                  //   height: size.height * 50,
                  //   child: Column(
                  //     children: [
                  //       Row(
                  //         crossAxisAlignment: CrossAxisAlignment.end,
                  //         mainAxisAlignment: MainAxisAlignment.end,
                  //         children: [
                  //           Text(data.text),
                  //         ],
                  //       ),
                  //       Row(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         children: [
                  //           Text(data.ai),
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: TextFormField(
                decoration: const InputDecoration(
                  // suffixIcon: IconButton(
                  //   onPressed: () async {
                  //     await controller.initData(text: controller.toString());
                  //   },
                  //   icon: const Icon(
                  //     Icons.send,
                  //     size: 40,
                  //   ),
                  // ),
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                controller: textController,
                onFieldSubmitted: (val) async {
                  if (val.isNotEmpty) {
                    await controller.initData(text: val);
                    HistoryModel model =
                        HistoryModel(answer: textController.text);
                    DbHelper.dbHelper.insertData(model: model);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
