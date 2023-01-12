import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/core/usecase/base_use_case.dart';
import 'package:movie/layout/movies/domain/entities/movies.dart';
import 'package:movie/layout/movies/domain/repository/base_movies_repositry.dart';


class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters> {
  BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either< Failure ,List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
