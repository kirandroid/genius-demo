import 'package:json_annotation/json_annotation.dart';
part 'movie_video_response.g.dart';

@JsonSerializable()
class MovieVideoResponse {
  int id;
  List<Results> results;

  MovieVideoResponse({this.id, this.results});
  static const fromJson = _$MovieVideoResponseFromJson;

  Map<String, dynamic> toJson() => _$MovieVideoResponseToJson(this);
}

@JsonSerializable()
class Results {
  String id;
  String iso6391;
  String iso31661;
  String key;
  String name;
  String site;
  int size;
  String type;

  Results(
      {this.id,
      this.iso6391,
      this.iso31661,
      this.key,
      this.name,
      this.site,
      this.size,
      this.type});

  static const fromJson = _$ResultsFromJson;

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
