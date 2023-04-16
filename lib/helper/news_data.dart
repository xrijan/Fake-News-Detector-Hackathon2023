import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../model/news_model.dart';
import 'package:http/http.dart';


const API_KEY = '810dca7667b543e19007e6ee3b78b665';
class NewsData {
  List<NewsModel> newsFromRestApi = [];


  Future<void> getNews() async {

    const newsUrl =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=810dca7667b543e19007e6ee3b78b665';

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
              publishedAt: elements['publishedAt'],
              

          );
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
  List<NewsModel> newsFromRestApiCat = [];

  Future<void> getNews(String category) async {
    var apiKeyCat =
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=810dca7667b543e19007e6ee3b78b665';
    try {
      var response = await get(Uri.parse(apiKeyCat));
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
            newsFromRestApiCat.add(newsModel);
          }
        });
      }

    } catch (e) {
      if (kDebugMode) {
        print('Error $e');
      }
    }
}}

class TopHeadlineBBC {
  List<NewsModel> newsFromRestApiBBC = [];

  Future<void> getNews() async {
    var apiKeyCat =
        'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=$API_KEY';
    try {
      var response = await get(Uri.parse(apiKeyCat));
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
            newsFromRestApiBBC.add(newsModel);
          }
        });
      }

    } catch (e) {
      if (kDebugMode) {
        print('Error $e');
      }
    }
  }}