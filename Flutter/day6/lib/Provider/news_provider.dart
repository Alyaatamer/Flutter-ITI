import 'package:day6/Models/articles_response_model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';



class NewsProvider extends ChangeNotifier {
  List<ArticleModel> articles = [];
  bool isLoading = false;
  void getHeadlines() async {
    isLoading = true;
    notifyListeners();
    final dio = Dio();
    final response = await dio.get(
      'https://newsapi.org/v2/top-headlines',
      queryParameters: {
        'country': 'us',
        'apiKey': '6eca56fbfb4545cf98623887b18db051',
      },
    );
    final articlesResponseModel = ArticlesResponseModel.fromMap(response.data);
    articles = articlesResponseModel.articles;
    isLoading = false;
    notifyListeners();
  }
}