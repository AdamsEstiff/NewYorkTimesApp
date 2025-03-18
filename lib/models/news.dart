class News {
  String id;
  String title;
  String abstract;
  List media;

  News(
      {required this.id,
      required this.title,
      required this.abstract,
      required this.media});

  factory News.fromJson(json) {
    return News(
        id: json["id"].toString(),
        title: json['title'],
        abstract: json['abstract'],
        media: json["media"]);
  }
}
