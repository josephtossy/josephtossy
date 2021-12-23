import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_assessment/providers/main_app_provider.dart';
import 'package:technology_assessment/views/widgets/article_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      MainAppProvider mainAppProvider =
          Provider.of<MainAppProvider>(context, listen: false);
      mainAppProvider.getArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    MainAppProvider mainAppProvider = Provider.of<MainAppProvider>(context);
    return MediaQuery(
      data: const MediaQueryData(),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          color: Colors.white,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return mainAppProvider.articles.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.only(top: constraints.maxWidth * .12),
                      color: Colors.transparent,
                      child: ListView(
                        children: mainAppProvider.articles.map((article) {
                          return Container(
                            margin: EdgeInsets.all(constraints.maxWidth * .075),
                            height: constraints.maxHeight * .2,
                            child: ArticleWidget(
                              articleModel: article,
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(
                          right: constraints.maxWidth * .3,
                          left: constraints.maxWidth * .3,
                          bottom: constraints.maxHeight * .4,
                          top: constraints.maxHeight * .4),
                      child: const CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
