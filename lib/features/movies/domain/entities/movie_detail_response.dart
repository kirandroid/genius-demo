import 'package:json_annotation/json_annotation.dart';
part 'movie_detail_response.g.dart';

@JsonSerializable()
class MovieDetailResponse {
  bool adult;
  String backdrop_path;
  int budget;
  List<Genres> genres;
  String homepage;
  int id;
  String imdb_id;
  String original_language;
  String original_title;
  String overview;
  double popularity;
  String poster_path;
  List<ProductionCompanies> production_companies;
  List<ProductionCountries> production_countries;
  String release_date;
  int revenue;
  int runtime;
  List<SpokenLanguages> spoken_languages;
  String status;
  String tagline;
  String title;
  bool video;
  double vote_average;
  int vote_count;

  MovieDetailResponse(
      {this.adult,
      this.backdrop_path,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdb_id,
      this.original_language,
      this.original_title,
      this.overview,
      this.popularity,
      this.poster_path,
      this.production_companies,
      this.production_countries,
      this.release_date,
      this.revenue,
      this.runtime,
      this.spoken_languages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.vote_average,
      this.vote_count});

  static const fromJson = _$MovieDetailResponseFromJson;

  Map<String, dynamic> toJson() => _$MovieDetailResponseToJson(this);
}

@JsonSerializable()
class Genres {
  int id;
  String name;

  Genres({this.id, this.name});

  static const fromJson = _$GenresFromJson;

  Map<String, dynamic> toJson() => _$GenresToJson(this);
}

@JsonSerializable()
class ProductionCompanies {
  int id;
  String logo_path;
  String name;
  String origin_country;

  ProductionCompanies(
      {this.id, this.logo_path, this.name, this.origin_country});

  static const fromJson = _$ProductionCompaniesFromJson;

  Map<String, dynamic> toJson() => _$ProductionCompaniesToJson(this);
}

@JsonSerializable()
class ProductionCountries {
  String iso31661;
  String name;

  ProductionCountries({this.iso31661, this.name});

  static const fromJson = _$ProductionCountriesFromJson;

  Map<String, dynamic> toJson() => _$ProductionCountriesToJson(this);
}

@JsonSerializable()
class SpokenLanguages {
  String iso6391;
  String name;

  SpokenLanguages({this.iso6391, this.name});

  static const fromJson = _$SpokenLanguagesFromJson;

  Map<String, dynamic> toJson() => _$SpokenLanguagesToJson(this);
}
