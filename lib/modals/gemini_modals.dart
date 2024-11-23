class Model {
  String text;
  String ai;

  Model({
    required this.text,
    required this.ai,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        text: json["text"].toString(),
        ai: json["ai"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "ai": ai,
      };
}
