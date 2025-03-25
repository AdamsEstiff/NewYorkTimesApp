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
    news = await News().getNews();
    setState(() {
      news;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (news.isEmpty) {
      return Material(
        child: Container(
          color: Color(0xFF1C1C1D),
          height: MediaQuery.of(context).size.height,
          child: Center(child: Text("Cargando...")),
        ),
      );
    }
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
