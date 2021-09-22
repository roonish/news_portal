import 'dart:convert';
import 'package:news_portal/Model/articles_model.dart';

class NewsModel {
  final String status;
  final int totalResults;
  final List<NewsArticles> articles;

  NewsModel(this.status, this.totalResults, this.articles);

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      map['status'],
      map['totalResults'],
      List<NewsArticles>.from(
          map['articles']?.map((x) => NewsArticles.fromMap(x))),
    );
  }

  factory NewsModel.fromJson(String source) =>
      NewsModel.fromMap(json.decode(source));
}
