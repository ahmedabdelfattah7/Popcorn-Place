import 'package:get_it/get_it.dart';
import 'package:movie/layout/movies/data/data_source/remote_data_source/movie_remote_data_source.dart';
import 'package:movie/layout/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie/layout/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie/layout/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie/layout/movies/presentation/controller/bloc/movie_details_bloc.dart';
import 'package:movie/layout/movies/presentation/controller/bloc/movies_bloc.dart';
import 'package:movie/layout/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie/layout/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:movie/layout/movies/domain/repository/base_movies_repositry.dart';
import 'package:movie/layout/movies/data/repository/movies_repository.dart';
import 'package:movie/layout/series/data/data_source/series_remote_data_source.dart';
import 'package:movie/layout/series/data/repository/series_repository.dart';
import 'package:movie/layout/series/domain/repository/base_tv_repositry.dart';
import 'package:movie/layout/series/domain/usecases/get_on_air_series_usecaase.dart';
import 'package:movie/layout/series/domain/usecases/get_popular_series_usecase.dart';
import 'package:movie/layout/series/domain/usecases/get_series_details_usecase.dart';
import 'package:movie/layout/series/domain/usecases/get_series_recommandations_usecase.dart';
import 'package:movie/layout/series/domain/usecases/get_top_rated_series_usecase.dart';
import 'package:movie/layout/series/presentation/controller/series_bloc.dart';
import 'package:movie/layout/series/presentation/controller/series_details_bloc.dart';
final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///Bloc state management
    sl.registerFactory(
      () => MoviesBloc(sl(), sl(), sl()),
    );
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));
    sl.registerFactory(() => SeriesBloc(sl(),sl(),sl()));
    sl.registerFactory(() => SeriesDetailsBloc(sl(),sl()));
    ///UseCases
    sl.registerLazySingleton(() => NowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCse(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
    sl.registerLazySingleton(() => OnAirSeriesUseCase(sl()));
    sl.registerLazySingleton(() => PopularSeriesUseCase(sl()));
    sl.registerLazySingleton(() => TopRatedSeriesUseCase(sl()));
    sl.registerLazySingleton(() => GetSeriesDetailsUseCse(sl()));
   sl.registerLazySingleton(() => GetSeriesRecommendationsUseCse(sl()));
    ///Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(sl()));
    sl.registerLazySingleton<BaseSeriesRepository>(() => SeriesRepository(sl()));

    ///DataSource
    sl.registerLazySingleton<BaseMovieRemoteDataResource>(
        () => MovieRemoteDataSource());
    sl.registerLazySingleton<BaseSeriesRemoteDataResource>(
            () => SeriesRemoteDataSource());
  }
}
