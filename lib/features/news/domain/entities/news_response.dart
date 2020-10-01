import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:genius_demo/core/hive/hive_type_id.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'news_response.g.dart';

@HiveType(typeId: NEWS_TID)
@JsonSerializable()
class NewsResponse {
  @HiveField(0)
  final List<Articles> articles;

  const NewsResponse({this.articles});

  static const fromJson = _$NewsResponseFromJson;

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}

@HiveType(typeId: NEWS_ARTICLE_TID)
@JsonSerializable()
class Articles extends HiveObject {
  @HiveField(0)
  final Source source;
  @HiveField(1)
  final String author;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String url;
  @HiveField(5)
  final String urlToImage;
  @HiveField(6)
  final String publishedAt;
  @HiveField(7)
  final String content;

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

  static const fromJson = _$ArticlesFromJson;

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}

@HiveType(typeId: NEWS_SOURCE_TID)
@JsonSerializable()
class Source extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;

  Source({
    this.id,
    this.name,
  });

  static const fromJson = _$SourceFromJson;

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
