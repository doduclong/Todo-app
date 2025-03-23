class LabelModel {
  String id;
  String name;
  String color;

  LabelModel(
      {required this.id,
      required this.name,
      required this.color});

  factory LabelModel.fromJson(Map<String, dynamic> json) {
    return LabelModel(
        id: json['id'],
        name: json['name'],
        color: json['color']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }
}
