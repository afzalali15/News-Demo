import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:news_demo/models/news.dart';

import '../constants.dart';

class API_Manager {
  Future<NewsModel> getBreakingNews() async {
    NewsModel newsModel = null;
    try {
      var response = await http.get(Uri.parse(Strings.newsAPI));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var parsedJson = json.decode(jsonString);
        newsModel = NewsModel.fromJson(parsedJson);
        return newsModel;
      }
    } catch (Exception) {
      return newsModel;
    }
    return newsModel;
  }
}
