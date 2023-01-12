import 'package:movie/layout/series/domain/entities/series.dart';

class SeriesModel extends Series {
  const SeriesModel(
      {
      required super.id,
      required super.title,
      required super.backdropPath,
      required super.genderId,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate
      });

  factory SeriesModel.fromJson(Map<String, dynamic> json) => SeriesModel(
        id: json['id'],
        title: json['name'],
        backdropPath: json['backdrop_path'] ?? '/3ayWL13P1HeRnyVL9lU9flOdZjq.jpg',
        genderId: List<int>.from(json['genre_ids'].map((e) => e)),
        overview: json['overview'],
        voteAverage: json['vote_average'],
    releaseDate: json['first_air_date'],
      );
}
