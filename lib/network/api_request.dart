import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_some/model/articles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;


final mainUrl = 'https://newsapi.org/v2';
final topHeadLines = 'top-headlines';
final apiKey = 'e526a219312a40a88b575f8738537e06';




final newsProvider = FutureProvider.family(
        (ref, String category) => NewsProvider().fetchNewsByCategory(category));

final dataProvider = ChangeNotifierProvider((ref) => NewsProvider());


class NewsProvider with ChangeNotifier{

  Future<List<Articles>> fetchNewsByCategory(String category) async{
    final response = await http.get(
        Uri.parse('$mainUrl/$topHeadLines?language=en&category=$category&apikey=$apiKey'));

    final data = json.decode(response.body);
    if(response.statusCode == 200){
      List<Articles> articles = (data['articles'] as List).map((e) => Articles.fromJson(e)).toList();
     return articles;
    }
    else if(response.statusCode == 404)
      throw Exception('Not found 404');
    else throw Exception('cant get news');
  }









}


