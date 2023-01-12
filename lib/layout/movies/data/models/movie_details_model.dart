

import 'package:movie/layout/movies/data/models/genres_model.dart';
import 'package:movie/layout/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backDropPath,
      required super.genres,
      required super.id,
      required super.overView,
      required super.releaseDate,
      required super.runTime,
      required super.title,
      required super.voteAverage});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        backDropPath: json['backdrop_path'] ??  '/3ayWL13P1HeRnyVL9lU9flOdZjq.jpg',
        genres: List<GenresModel>.from(
          json['genres'].map(
            (x) => GenresModel.fromJson(x),
          ),
        ),
        id: json['id'],
        overView: json['overview'],
        releaseDate: json['release_date'],
        runTime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'],
      );
}
