import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../model/news_model.dart';
import 'package:http/http.dart';


const API_KEY = '810dca7667b543e19007e6ee3b78b665';
class NewsData {
  List<NewsModel> newsFromRestApi = [];

  static const newsUrl =
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=810dca7667b543e19007e6ee3b78b665';
  Future<void> getNews() async {

    try {
    var response = await get(Uri.parse(newsUrl));
    var jsonData = json.decode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((elements) {
        if (elements['urlToImage'] != null && elements['description'] != null) {
          //saving data to model class
          NewsModel newsModel = NewsModel(
              author: elements['author'],
              title: elements['title'],
              description: elements['description'],
              url: elements['url'],
              urlToImage: elements['urlToImage'],
              publishedAt: elements['publishedAt']);
          newsFromRestApi.add(newsModel);
        }
      });
    }

  } catch (e) {
      if (kDebugMode) {
        print('Error $e');
      }
    }
  }
}

class NewsCategories {
  List<NewsModel> newsFromRestApi = [];
  var apiKey =
      'https://newsapi.org/v2/everything?q=tesla&from=2023-03-04&sortBy=publishedAt&apiKey=810dca7667b543e19007e6ee3b78b665';

  Future<void> getNews(String category) async {
    var response = await get(Uri.parse(apiKey));
    var jsonData = json.decode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((elements) {
        if (elements['urlToImage'] != null && elements['description'] != null) {
          //saving data to model class
          NewsModel newsModel = NewsModel(
              author: elements['author'],
              title: elements['title'],
              description: elements['description'],
              url: elements['url'],
              urlToImage: elements['urlToImage'],
              publishedAt: elements['publishedAt']);
          newsFromRestApi.add(newsModel);
          print(newsFromRestApi);
        }
      });
    }

  }
}
