import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/core/usecase/base_use_case.dart';
import 'package:movie/layout/movies/domain/entities/movie_details.dart';
import 'package:movie/layout/movies/domain/repository/base_movies_repositry.dart';

class GetMovieDetailsUseCse extends BaseUseCase<MovieDetails,MovieDetailsParameters>{
final BaseMoviesRepository baseMoviesRepository;


GetMovieDetailsUseCse(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters parameters,) async{
    return await baseMoviesRepository.getMovieDetails(parameters);
  }

}
class MovieDetailsParameters extends Equatable{
  final int movieId;

 const MovieDetailsParameters({required this.movieId});

  @override
  List<Object?> get props => [
    movieId
  ];

}