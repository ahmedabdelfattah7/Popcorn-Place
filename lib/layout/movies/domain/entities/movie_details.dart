import 'package:equatable/equatable.dart';
import 'package:movie/layout/movies/domain/entities/genres.dart';


class MovieDetails extends Equatable {
  
  final String backDropPath;
  final List<Genres> genres;
  final int id;
  final String overView;
  final String releaseDate;
  final dynamic runTime;
  final String title;
  final double voteAverage;

  const MovieDetails(
      {required this.backDropPath,
      required this.genres,
      required this.id,
      required this.overView,
      required this.releaseDate,
      required this.runTime,
      required this.title,
      required this.voteAverage});

  @override
  List<Object> get props => [
        backDropPath,
        genres,
        id,
        overView,
        releaseDate,
        runTime,
        title,
        voteAverage
      ];
}
