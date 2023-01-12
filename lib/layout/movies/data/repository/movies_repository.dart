import 'package:dartz/dartz.dart';
import 'package:movie/core/error/exceptions.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/layout/movies/data/data_source/remote_data_source/movie_remote_data_source.dart';
import 'package:movie/layout/movies/domain/entities/movie_details.dart';
import 'package:movie/layout/movies/domain/entities/movies.dart';
import 'package:movie/layout/movies/domain/entities/recommendation.dart';
import 'package:movie/layout/movies/domain/repository/base_movies_repositry.dart';
import 'package:movie/layout/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie/layout/movies/domain/usecases/get_recommendation_usecase.dart';


class MovieRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataResource baseMovieRemoteDataResource;

  MovieRepository(this.baseMovieRemoteDataResource);
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataResource.getNowPlayingMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMassage));
    }

  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataResource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMassage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataResource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMassage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters)  async{
    final result = await baseMovieRemoteDataResource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMassage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters)async {
    final result = await baseMovieRemoteDataResource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMassage));
    }
  }
}
