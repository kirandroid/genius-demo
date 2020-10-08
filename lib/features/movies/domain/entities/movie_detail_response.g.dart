// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailResponse _$MovieDetailResponseFromJson(Map<String, dynamic> json) {
  return MovieDetailResponse(
    adult: json['adult'] as bool,
    backdrop_path: json['backdrop_path'] as String,
    budget: json['budget'] as int,
    genres: (json['genres'] as List)
        ?.map((e) =>
            e == null ? null : Genres.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    homepage: json['homepage'] as String,
    id: json['id'] as int,
    imdb_id: json['imdb_id'] as String,
    original_language: json['original_language'] as String,
    original_title: json['original_title'] as String,
    overview: json['overview'] as String,
    popularity: (json['popularity'] as num)?.toDouble(),
    poster_path: json['poster_path'] as String,
    production_companies: (json['production_companies'] as List)
        ?.map((e) => e == null
            ? null
            : ProductionCompanies.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    production_countries: (json['production_countries'] as List)
        ?.map((e) => e == null
            ? null
            : ProductionCountries.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    release_date: json['release_date'] as String,
    revenue: json['revenue'] as int,
    runtime: json['runtime'] as int,
    spoken_languages: (json['spoken_languages'] as List)
        ?.map((e) => e == null
            ? null
            : SpokenLanguages.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['status'] as String,
    tagline: json['tagline'] as String,
    title: json['title'] as String,
    video: json['video'] as bool,
    vote_average: (json['vote_average'] as num)?.toDouble(),
    vote_count: json['vote_count'] as int,
  );
}

Map<String, dynamic> _$MovieDetailResponseToJson(
        MovieDetailResponse instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdrop_path,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdb_id': instance.imdb_id,
      'original_language': instance.original_language,
      'original_title': instance.original_title,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.poster_path,
      'production_companies': instance.production_companies,
      'production_countries': instance.production_countries,
      'release_date': instance.release_date,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spoken_languages': instance.spoken_languages,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.vote_average,
      'vote_count': instance.vote_count,
    };

Genres _$GenresFromJson(Map<String, dynamic> json) {
  return Genres(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$GenresToJson(Genres instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ProductionCompanies _$ProductionCompaniesFromJson(Map<String, dynamic> json) {
  return ProductionCompanies(
    id: json['id'] as int,
    logo_path: json['logo_path'] as String,
    name: json['name'] as String,
    origin_country: json['origin_country'] as String,
  );
}

Map<String, dynamic> _$ProductionCompaniesToJson(
        ProductionCompanies instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logo_path,
      'name': instance.name,
      'origin_country': instance.origin_country,
    };

ProductionCountries _$ProductionCountriesFromJson(Map<String, dynamic> json) {
  return ProductionCountries(
    iso31661: json['iso31661'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$ProductionCountriesToJson(
        ProductionCountries instance) =>
    <String, dynamic>{
      'iso31661': instance.iso31661,
      'name': instance.name,
    };

SpokenLanguages _$SpokenLanguagesFromJson(Map<String, dynamic> json) {
  return SpokenLanguages(
    iso6391: json['iso6391'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$SpokenLanguagesToJson(SpokenLanguages instance) =>
    <String, dynamic>{
      'iso6391': instance.iso6391,
      'name': instance.name,
    };
