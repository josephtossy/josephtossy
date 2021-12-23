import 'dart:io';

class ArticleModel {
  String title;
  String publishedDate;
  String section;
  String abstract;
  String imageUrl;

  /// Constructor ///
  ArticleModel({
    this.title = "",
    this.publishedDate = "",
    this.section = "",
    this.abstract = "",
    this.imageUrl = "",
  });

  /// Getter ///
  Map getArticle() {
    return {
      "title": title,
      "published_date": publishedDate,
      "section": section,
      "abstract": abstract,
      "image_url": imageUrl,
    };
  }
}
