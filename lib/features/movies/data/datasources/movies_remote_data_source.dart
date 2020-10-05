import 'dart:convert';

import 'package:genius_demo/core/error/exceptions.dart';
import 'package:genius_demo/core/utils/keys.dart';
import 'package:genius_demo/features/movies/domain/entities/cast_crew_response.dart';
import 'package:genius_demo/features/movies/domain/entities/genre_response.dart';
import 'package:genius_demo/features/movies/domain/entities/movie_detail_response.dart';
import 'package:genius_demo/features/movies/domain/entities/movie_review_response.dart';
import 'package:genius_demo/features/movies/domain/entities/movie_video_response.dart';
import 'package:genius_demo/features/movies/domain/entities/movies_response.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class MoviesRemoteDataSource {
  Future<MovieDetailResponse> getMovieDetail({@required String movie_id});

  Future<CastCrewResponse> getMovieCastCrew({@required String movie_id});

  Future<MovieVideoResponse> getMovieVideo({@required String movie_id});

  Future<GenreResponse> getGenreList();

  Future<MoviesResponse> getMovieRecommendation({@required String movie_id});

  Future<MovieReviewResponse> getMovieReview({@required String movie_id});

  Future<MoviesResponse> getMovieListByGenre({@required String genre_id});

  Future<MoviesResponse> getMovieList({@required String endpoint});
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final http.Client client;
  final String movieAPIUrl = "https://api.themoviedb.org/3";

  MoviesRemoteDataSourceImpl({@required this.client});

  @override
  Future<GenreResponse> getGenreList() async {
    final response = await client.get(
      '$movieAPIUrl/genre/movie/list?api_key=$movieApiKey&language=en-US',
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return GenreResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MoviesResponse> getMovieListByGenre({String genre_id}) async {
    final response = await client.get(
      '$movieAPIUrl/discover/movie?api_key=$movieApiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres=$genre_id',
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return MoviesResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CastCrewResponse> getMovieCastCrew({String movie_id}) async {
    final response = await client.get(
      '$movieAPIUrl/movie/$movie_id/credits?api_key=$movieApiKey',
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return CastCrewResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieDetailResponse> getMovieDetail({String movie_id}) async {
    final response = await client.get(
      '$movieAPIUrl/movie/$movie_id?api_key=$movieApiKey&language=en-US',
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return MovieDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MoviesResponse> getMovieList({String endpoint}) async {
    final response = await client.get(
      '$movieAPIUrl/movie/$endpoint?api_key=$movieApiKey&language=en-US&page=1',
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return MoviesResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MoviesResponse> getMovieRecommendation({String movie_id}) async {
    final response = await client.get(
      '$movieAPIUrl/movie/$movie_id/recommendations?api_key=$movieApiKey&language=en-US&page=1',
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return MoviesResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieReviewResponse> getMovieReview({String movie_id}) async {
    final response = await client.get(
      '$movieAPIUrl/movie/$movie_id/reviews?api_key=$movieApiKey&language=en-US&page=1',
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return MovieReviewResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieVideoResponse> getMovieVideo({String movie_id}) async {
    final response = await client.get(
      '$movieAPIUrl/movie/$movie_id/videos?api_key=$movieApiKey&language=en-US',
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return MovieVideoResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
