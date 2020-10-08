import 'package:flutter/material.dart';
import 'package:genius_demo/core/hive/hive_type_id.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movies_response.g.dart';

@HiveType(typeId: MOVIES_TID)
@JsonSerializable()
class MoviesResponse {
  @HiveField(0)
  final int page;
  @HiveField(1)
  final int totalResults;
  @HiveField(2)
  final int totalPages;
  @HiveField(3)
  final List<Results> results;

  const MoviesResponse(
      {this.page, this.totalResults, this.totalPages, this.results});

  static const fromJson = _$MoviesResponseFromJson;

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}

@HiveType(typeId: MOVIE_ITEM_TID)
@JsonSerializable()
class Results extends HiveObject {
  @HiveField(0)
  double popularity;
  @HiveField(1)
  int vote_count;
  @HiveField(2)
  bool video;
  @HiveField(3)
  String poster_path;
  @HiveField(4)
  int id;
  @HiveField(5)
  bool adult;
  @HiveField(6)
  String backdrop_path;
  @HiveField(7)
  String original_language;
  @HiveField(8)
  String original_title;
  @HiveField(9)
  List<int> genre_ids;
  @HiveField(10)
  String title;
  @HiveField(11)
  double vote_average;
  @HiveField(12)
  String overview;
  @HiveField(13)
  String release_date;

  Results({
    @required this.popularity,
    @required this.adult,
    @required this.title,
    @required this.backdrop_path,
    @required this.genre_ids,
    @required this.id,
    @required this.original_language,
    @required this.original_title,
    @required this.overview,
    @required this.poster_path,
    @required this.release_date,
    @required this.video,
    @required this.vote_average,
    @required this.vote_count,
  });

  static const fromJson = _$ResultsFromJson;

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
