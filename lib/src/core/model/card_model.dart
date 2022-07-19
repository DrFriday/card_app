class CardModel {
  String? id;
  String? title;
  String? subtitle;

  CardModel({this.id, this.title, this.subtitle});

  factory CardModel.fromJSON(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
    };
  }
}
