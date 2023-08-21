import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'news_provider.dart'; // Import your NewsProvider

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final articles = newsProvider.articles;

    return Scaffold(
      appBar: AppBar(title: Text('News App')),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(articles[index].title),
          subtitle: Text(articles[index].description),
          leading: Image.network(articles[index].imageUrl),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          newsProvider.fetchArticles();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
