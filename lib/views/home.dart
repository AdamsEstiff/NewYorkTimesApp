import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newyorktimesapp/components/card_news.dart';

import '../models/news.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<News> news = [];

  @override
  void initState() {
    getNews();
    super.initState();
  }

  Future<void> getNews() async {
    final response = await Dio().get(
        'https://api.nytimes.com/svc/mostpopular/v2/shared/1/facebook.json?api-key=Lqo0YKENCZ9CxQJa9djDu0tJM0g4nulQ');
    final results = response.data["results"];
    for (var result in results) {
      print(result);
      news.add(News.fromJson(result));
    }
    setState(() {
      news;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1C1C1D),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: SizedBox(
            width: double.infinity,
            child: Image.network(
                'https://cdn.freebiesupply.com/images/large/2x/new-york-times-logo-black-and-white.png'),
          ),
        ),
        body: ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, idx) {
              return CardNews(notice: news[idx]);
            }));
  }
}
