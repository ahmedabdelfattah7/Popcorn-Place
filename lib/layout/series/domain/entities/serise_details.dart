import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/layout/movies/domain/entities/genres.dart';

class SeriesDetails extends Equatable {
  final String backDropPath;
  final List<Genres> genres;
  final int id;
  final String overView;
  final double voteAverage;
  final String name;
  final int numberOfSeasons;
  final int numberOfEpisodes;
  final String firstAirDate;

  const SeriesDetails(
      {required this.backDropPath,
      required this.genres,
      required this.id,
      required this.overView,
      required this.name,
        required this.voteAverage,
      required this.numberOfSeasons,
      required this.numberOfEpisodes,
      required this.firstAirDate});

  @override
  List<Object> get props => [
        backDropPath,
        genres,
        id,
        overView,
        name,
        numberOfSeasons,
        numberOfEpisodes,
        firstAirDate,
    voteAverage
      ];
}
