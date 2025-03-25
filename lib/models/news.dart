import 'package:dio/dio.dart';
import 'package:newyorktimesapp/models/media.dart';

class News {
  String? id;
  String? title;
  String? abstract;
  Media? media;

  News({this.id, this.title, this.abstract, this.media});

  factory News.fromJson(json) {
    return News(
        id: json["id"].toString(),
        title: json['title'],
        abstract: json['abstract'],
        media: Media().getMedia(json["media"]));
  }

  Future<List<News>> getNews() async {
    try {
      List<News> news = [];
      final response = await Dio().get(
          'https://api.nytimes.com/svc/mostpopular/v2/shared/1/facebook.json?api-key=Lqo0YKENCZ9CxQJa9djDu0tJM0g4nulQ');
      final results = response.data["results"];
      for (var result in results) {
        news.add(News.fromJson(result));
      }

      return news.where((notice) => notice.media != null).toList();
    } catch (e) {
      return [];
    }
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "title": abstract, "media": media};
  }
}
