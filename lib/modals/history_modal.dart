class HistoryModel {
  int? id;
  String? answer;

  HistoryModel({this.id, this.answer});

  // HistoryModel.copy({this.id=1, this.answer});

  factory HistoryModel.mapToModel(Map map) {
    return HistoryModel(id: map['id'], answer: map['answer']);
  }
  Map<String, dynamic> get toMap => {
        'id': id,
        'answer': answer,
      };
}
