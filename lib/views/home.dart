import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  @override
  void initState() {
    getNews();
    super.initState();
  }

  Future<void> getNews() async {
    final response = await Dio().get('https://api.nytimes.com/svc/mostpopular/v2/shared/1/facebook.json?api-key=Lqo0YKENCZ9CxQJa9djDu0tJM0g4nulQ');
    final results= response.data["results"];
    for(var result in results){
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("New York Times"),),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/The_New_York_Times_Logo.svg/2560px-The_New_York_Times_Logo.svg.png'),
          ),
        ],
      ),
    );
  }
}
