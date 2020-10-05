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
  int voteCount;
  @HiveField(2)
  bool video;
  @HiveField(3)
  String posterPath;
  @HiveField(4)
  int id;
  @HiveField(5)
  bool adult;
  @HiveField(6)
  String backdropPath;
  @HiveField(7)
  String originalLanguage;
  @HiveField(8)
  String originalTitle;
  @HiveField(9)
  List<int> genreIds;
  @HiveField(10)
  String title;
  @HiveField(11)
  double voteAverage;
  @HiveField(12)
  String overview;
  @HiveField(13)
  String releaseDate;

  Results({
    @required this.popularity,
    @required this.adult,
    @required this.title,
    @required this.backdropPath,
    @required this.genreIds,
    @required this.id,
    @required this.originalLanguage,
    @required this.originalTitle,
    @required this.overview,
    @required this.posterPath,
    @required this.releaseDate,
    @required this.video,
    @required this.voteAverage,
    @required this.voteCount,
  });

  static const fromJson = _$ResultsFromJson;

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
