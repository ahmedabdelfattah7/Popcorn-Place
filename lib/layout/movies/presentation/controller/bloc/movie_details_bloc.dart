import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/layout/movies/domain/entities/movie_details.dart';
import 'package:movie/layout/movies/domain/entities/recommendation.dart';
import 'package:movie/layout/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie/layout/movies/domain/usecases/get_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {

  MovieDetailsBloc(this.getMovieDetailsUseCse,this.getRecommendationUseCase) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendation>(_getRecommendation);
  }

  final GetMovieDetailsUseCse getMovieDetailsUseCse;
  final GetRecommendationUseCase getRecommendationUseCase;
  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCse(
      MovieDetailsParameters(movieId: event.id),
    );
    result.fold(
        (l) => emit(state.copyWith(
            movieDetailsState: RequestState.error,
            movieDetailsMessage: l.message)),
        (r) => emit(state.copyWith(
            movieDetailsState: RequestState.loaded, movieDetails: r)));
  }

  FutureOr<void> _getRecommendation(
      GetMovieRecommendation event, Emitter<MovieDetailsState> emit)async {
    final result = await getRecommendationUseCase(
     RecommendationParameters(event.id)
    );
    result.fold(
            (l) => emit(state.copyWith(
            movieRecommendationState: RequestState.error,
            movieRecommendationMessage: l.message)),
            (r) => emit(state.copyWith(
                movieRecommendationState: RequestState.loaded, recommendation: r)));
  }

  }

