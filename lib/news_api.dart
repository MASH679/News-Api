import 'dart:convert';
import 'package:http/http.dart' as http;
import 'news_model.dart';

class NewsApi {
  static Future<List<NewsArticle>> fetchArticles() async {
    final apiKey = 'fce64fb7068c4fa7b215d47b68ed1915';
    final response = await http.get(Uri.parse('/v2/everything'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData
          .map((article) => NewsArticle(
                title: article['title'],
                description: article['description'],
                imageUrl: article['imageUrl'],
              ))
          .toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
