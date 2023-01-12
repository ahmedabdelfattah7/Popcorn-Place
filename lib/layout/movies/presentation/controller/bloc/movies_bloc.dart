import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/usecase/base_use_case.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/layout/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie/layout/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie/layout/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie/layout/movies/presentation/controller/bloc/movies_events.dart';
import 'package:movie/layout/movies/presentation/controller/bloc/movies_states.dart';


class MoviesBloc extends Bloc<MoviesEvents, MoviesState> {
  final NowPlayingMoviesUseCase nowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.nowPlayingMoviesUseCase, this.getTopRatedMoviesUseCase,
      this.getPopularMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await nowPlayingMoviesUseCase(const NoParameters());
      result.fold(
        (l) => state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message,
        ),
        (r) => emit(
          state.copyWith(
            nowPlayingState: RequestState.loaded,
            nowPlayingMovies: r,
          ),
        ),
      );
    });
    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase(const NoParameters());

      result.fold(
            (l) => state.copyWith(
          popularState: RequestState.error,
          popularMessage: l.message,
        ),
            (r) => emit(
          state.copyWith(
            popularState: RequestState.loaded,
            popularMovies: r,
          ),
        ),
      );
    });
    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUseCase(const NoParameters());

      result.fold(
            (l) => state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: l.message,
        ),
            (r) => emit(
          state.copyWith(
            topRatedState: RequestState.loaded,
            topRatedMovies: r,
          ),
        ),
      );
    });
  }
}
