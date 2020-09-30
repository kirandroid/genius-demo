import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

@HiveType()
class News extends HiveObject {
  @HiveField(0)
  List<Articles> articles;

  News({@required this.articles});
}

@HiveType()
class Articles extends HiveObject {
  @HiveField(0)
  Source source;
  @HiveField(1)
  String author;
  @HiveField(2)
  String title;
  @HiveField(3)
  String description;
  @HiveField(4)
  String url;
  @HiveField(5)
  String urlToImage;
  @HiveField(6)
  String publishedAt;
  @HiveField(7)
  String content;

  Articles({
    @required this.source,
    @required this.author,
    @required this.title,
    @required this.description,
    @required this.url,
    @required this.urlToImage,
    @required this.publishedAt,
    @required this.content,
  });
}

@HiveType()
class Source extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;

  Source({
    @required this.id,
    @required this.name,
  });
}
