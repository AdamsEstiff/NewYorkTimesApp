import 'package:flutter/material.dart';
import 'package:newyorktimesapp/models/news.dart';

import 'ImageNews.dart';

class CardNews extends StatelessWidget {
  const CardNews({super.key, required this.notice});

  final News notice;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF252728),
      child: Column(
        children: [
          ImageNews(
            url: notice.media.last["media-metadata"].last["url"],
          ),
          Text(
            notice.title,
            style: TextStyle(
                color: Color(0xffe2e5e9),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
