import 'package:flutter/material.dart';
import 'package:newsapp/news_screen.dart';
import 'package:provider/provider.dart';
import 'news_provider.dart'; // Import your NewsProvider

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: MaterialApp(
        title: 'News App',
        home: NewsScreen(),
      ),
    );
  }
}
