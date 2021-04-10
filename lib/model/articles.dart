import 'package:flutter_app_some/model/source.dart';

class Articles {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
  Source source;

  Articles(
      {
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content,
      this.source
      });

 factory Articles.fromJson(Map<String, dynamic> json) {
   return Articles(
     author: json['author'] ?? '',
     title: json['title'] ?? '',
     description: json['description'] ?? '',
     publishedAt: json['publishAt'] ?? '',
     content: json['content'] ?? '',
     url: json['url'] ?? '',
     urlToImage: json['urlToImage'] ?? '',
     source: json['source'] != null ? new Source.fromJson(json['source']) : null
   );

  }


}