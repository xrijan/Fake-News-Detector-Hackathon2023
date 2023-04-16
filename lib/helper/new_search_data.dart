
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../model/news_search_model.dart';

const apiKey = 'c81f335d5c7f67e322b781f9011943f3';

class NewsSearch {
  List<NewsSearchModel> newsFromRestApi = [];
  Future<void> getSearchNews(String query)async {
           var searchUrl = 'https://gnews.io/api/v4/search?q=book&apikey=c81f335d5c7f67e322b781f9011943f3';

           try {
             var response = await get(Uri.parse(searchUrl));
             var jsonData = json.decode(response.body);

             if (jsonData['status'] == 'ok') {
               jsonData['articles'].forEach((elements) {
                 if (elements['urlToImage'] != null && elements['description'] != null) {
                   //saving data to model class
                   NewsSearchModel newsSearchModel = NewsSearchModel (
                       title: elements['title'],
                       description: elements['description'],
                       url: elements['url'],
                       publishedAt: elements['publishedAt'],
                       content: elements['context'],
                       image: elements['image']);
                   newsFromRestApi.add(newsSearchModel);
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

