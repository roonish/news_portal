import 'dart:convert';

class NewsArticles {
  // final List<Sources> source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  NewsArticles(
      //this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content);

  factory NewsArticles.fromMap(Map<String, dynamic> map) {
    return NewsArticles(
      map['author'],
      map['title'],
      map['description'],
      map['url'],
      map['urlToImage'],
      map['publishedAt'],
      map['content'],
    );
  }

  factory NewsArticles.fromJson(String source) =>
      NewsArticles.fromMap(json.decode(source));
}

// class Sources {
//   final String id;
//   final String name;

//   Sources(this.id, this.name);

//   factory Sources.fromMap(Map<String, dynamic> map) {
//     return Sources(
//       map['id'],
//       map['name'],
//     );
//   }

//   factory Sources.fromJson(String source) =>
//       Sources.fromMap(json.decode(source));
// }
