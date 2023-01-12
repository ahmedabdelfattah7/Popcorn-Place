import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genderId;
  final String overview;
  final dynamic voteAverage;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genderId,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object> get props => [
        id,
        title,
        backdropPath,
        genderId,
        overview,
        voteAverage,
        releaseDate,
      ];
}
