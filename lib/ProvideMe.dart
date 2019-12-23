import 'package:flutter/material.dart';

import 'Article View.dart';

class ProvideMyArticle extends ChangeNotifier {
  List<Article> myArticles = List<Article>();

  add(Article article) {
    myArticles.add(article);

    notifyListeners();
  }

  String pfp = 'images/mo3.jpg';

  myPfp(String pfp) {
    this.pfp = pfp;
    notifyListeners();
  }
}
