import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technology_assessment/models/article_model.dart';

class ArticlePage extends StatelessWidget {
  final ArticleModel articleModel;

  const ArticlePage({Key? key, required this.articleModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xffefefcf),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.black,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0.0,
                        bottom: 0.0,
                        right: -50.0,
                        left: -50.0,
                        child: Image.network(
                          articleModel.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    child: ListView(
                      children: [
                        Center(child: Text(articleModel.section.toUpperCase())),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(articleModel.title),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(articleModel.abstract),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
