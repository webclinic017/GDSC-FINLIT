import 'dart:convert';

import 'package:FinLit/models/newsmodel.dart';
import 'package:http/http.dart' as http;

class News {
  List<NewsModel> news = [];

  // News();

  Future getNews({String country = "ph", String type = "Relevant"}) async {
    
    String url;
    if (type == "Relevant") 
      url = "https://newsapi.org/v2/top-headlines?country=us&country=ph&category=business&apiKey=c4425206940a4aa398fc0bde0713f644";
    else if (type == "Local")
      url = "https://newsapi.org/v2/top-headlines?country=$country&category=business&apiKey=c4425206940a4aa398fc0bde0713f644";
    else
      url = "https://newsapi.org/v2/everything?q=economics&apiKey=c4425206940a4aa398fc0bde0713f644";
    
  
    var res = await http.get(url);

    var data = jsonDecode(res.body);
    if (data['status'] == 'ok') {
      data['articles'].forEach((e) {
        if (e['urlToImage'] != null && e['description'] != null) {
          NewsModel model = NewsModel(
            author: e['author'] ?? "Anonymous",
            title: e['title'],
            url: e['url'],
            urlToImage: e['urlToImage'],
            publishedAt: e['publishedAt'],
            content: e['content'],
            description: e['description'],
          );

          news.add(model);
        }
      });
      return news;
    }

    return news;
  }
}
