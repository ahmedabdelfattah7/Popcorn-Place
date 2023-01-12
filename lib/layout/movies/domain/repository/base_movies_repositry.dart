import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/layout/movies/domain/entities/movie_details.dart';
import 'package:movie/layout/movies/domain/entities/movies.dart';
import 'package:movie/layout/movies/domain/entities/recommendation.dart';
import 'package:movie/layout/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie/layout/movies/domain/usecases/get_recommendation_usecase.dart';


abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters);
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters
      );

}
