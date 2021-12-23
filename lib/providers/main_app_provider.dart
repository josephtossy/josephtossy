import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:technology_assessment/models/article_model.dart';
import 'package:technology_assessment/services/nyt_service.dart';

class MainAppProvider with ChangeNotifier {
  /// Service Classes Instances ///
  NytService nytService = NytService();

  /// List of articles ///
  List<ArticleModel> articles = [];

  /// Get NYC news ///
  getArticles() async {
    Response resp = await nytService.getNYTNews();
    if (resp.statusCode == 200) {
      Map map = Map.of(json.decode(resp.body));
      for (var article in List.of(map['results'])) {
        articles.add(ArticleModel(
            abstract: article['abstract'],
            imageUrl: List.of(article?['media']).isNotEmpty
                ? article?['media']?[0]['media-metadata'][0]['url']
                : 'https://cdn.pixabay.com/photo/2015/12/12/22/35/snowman-1090261__340.jpg',
            publishedDate: article['published_date'],
            title: article['title'],
            section: article['section']));
      }
    } else {
      /// Show Error ///
    }
    notifyListeners();
  }
}
