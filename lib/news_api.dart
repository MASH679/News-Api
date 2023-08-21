import 'dart:convert';
import 'package:http/http.dart' as http;
import 'news_model.dart';

class NewsApi {
  static Future<List<NewsArticle>> fetchArticles() async {
    final apiKey = 'fce64fb7068c4fa7b215d47b68ed1915';
    final endpoint = '/v2/everything?q=bitcoin&apiKey=$apiKey';
    final baseUrl = 'https://newsapi.org';

    final response = await http.get(Uri.parse('$baseUrl$endpoint'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> articlesData = jsonData['articles'];

      return articlesData
          .map((article) => NewsArticle(
                title: article['title'],
                description: article['description'],
                imageUrl: article['urlToImage'],
              ))
          .toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
