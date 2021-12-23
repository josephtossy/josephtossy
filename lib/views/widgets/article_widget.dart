import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technology_assessment/models/article_model.dart';
import 'package:technology_assessment/views/pages/article_page.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleModel articleModel;

  const ArticleWidget({Key? key, required this.articleModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(articleModel: articleModel))),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            color: Color(0xffefefcf),
            boxShadow: [
              BoxShadow(
                  color: Color(0xA515ca15),
                  spreadRadius: .25,
                  blurRadius: 12.0,
                  offset: Offset.zero)
            ]),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  child: Image.network(
                    articleModel.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(left: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(child: Text(articleModel.section.toUpperCase())),
                      Text(articleModel.title),
                      Text(articleModel.publishedDate)
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
