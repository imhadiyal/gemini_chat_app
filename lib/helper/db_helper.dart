import 'package:gemini_ai/modals/history_modal.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

enum data { id, ans }

class DbHelper {
  DbHelper._();
  static final DbHelper dbHelper = DbHelper._();
  Logger logger = Logger();
  Database? database;
  final String DB_NAME = "data.db";
  String tableName = "history";

  Future<void> initDb() async {
    String dbPath = await getDatabasesPath();
    database = await openDatabase(
      '$tableName/$dbPath',
      version: 1,
      onCreate: (db, version) {
        String query =
            """CREATE TABLE IF NOT EXISTS $tableName (${data.id.name} INTEGER PRIMARY KEY AUTOINCREMENT, ${data.ans.name} TEXT """;

        db.execute(query).then((val) => logger.i("table create")).onError(
              (error, stackTrace) => (logger.e('ERROR:$error')),
            );
      },
      onUpgrade: (db, v1, v2) {},
      onDowngrade: (db, v1, v2) {},
    );
  }

  Future<void> insertData({required HistoryModel model}) async {
    // String sql =
    //     "INSERT INTO $tableName(${data.id.name},${data.ans.name}) VALUES (?,?);";

    // await database
    //     ?.rawInsert(
    //       sql,
    //       [
    //         model.id,
    //         model.answer,
    //       ],
    //     )
    //     .then(
    //       (value) => logger.i("user${model.answer}"),
    //     )
    //     .onError(
    //       (error, stackTrace) => logger.e("error$error"),
    //     );
    // database?.insert(tableName, {'answer': model.answer});
    Map<String, dynamic> history = model.toMap;
    history.remove('id');
    await database
        ?.insert(tableName, history)
        .then(
          (value) => logger.i("user${model.answer}"),
        )
        .onError(
          (error, stackTrace) => logger.e("error$error"),
        );
  }

  Future<List<HistoryModel>> readData() async {
    String query = "SELECT * FROM $tableName";
    List<Map> data = await database!.rawQuery(query);
    List<HistoryModel> list =
        data.map((e) => HistoryModel.mapToModel(e)).toList();
    return list;
  }

  Future<void> deleteAiData({required String id}) async {
    database!.delete("ai", where: "id=?", whereArgs: [data.id.name]);
  }
}
