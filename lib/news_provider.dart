import 'package:flutter/material.dart';
import 'news_model.dart';
import 'news_api.dart'; // You'll create this file to handle API requests

class NewsProvider with ChangeNotifier {
  List<NewsArticle> _articles = [];

  List<NewsArticle> get articles => [..._articles];

  Future<void> fetchArticles() async {
    // Call the news API and populate _articles
    _articles = await NewsApi.fetchArticles();
    notifyListeners();
  }
}
