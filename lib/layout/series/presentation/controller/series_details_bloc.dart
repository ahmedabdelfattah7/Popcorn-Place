import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/layout/series/domain/entities/series_recommendations.dart';
import 'package:movie/layout/series/domain/entities/serise_details.dart';
import 'package:movie/layout/series/domain/usecases/get_series_details_usecase.dart';
import 'package:movie/layout/series/domain/usecases/get_series_recommandations_usecase.dart';

part 'series_details_event.dart';
part 'series_details_state.dart';

class SeriesDetailsBloc extends Bloc<SeriesDetailsEvent, SeriesDetailsState> {
  final GetSeriesDetailsUseCse getSeriesDetailsUseCse;
  final GetSeriesRecommendationsUseCse getSeriesRecommendationsUseCse;
  SeriesDetailsBloc(this.getSeriesDetailsUseCse,this.getSeriesRecommendationsUseCse) : super(const SeriesDetailsState()) {
    on<GetSeriesDetailsEvent>(_getSeriesDetails);
    on<GetSeriesRecommendationEvent>(_getSeriesRecommendation);
  }
    FutureOr<void> _getSeriesDetails(
        GetSeriesDetailsEvent event, Emitter<SeriesDetailsState> emit) async {
      final result = await getSeriesDetailsUseCse(
        SeriesDetailsParameters(seriesId: event.id),
      );

      result.fold(
              (l) => emit(state.copyWith(
              seriesDetailsState: RequestState.error,
              seriesDetailsMessage: l.message)),
              (r) => emit(state.copyWith(
              seriesDetailsState: RequestState.loaded, seriesDetails: r)));
    }

  FutureOr<void> _getSeriesRecommendation(
      GetSeriesRecommendationEvent event, Emitter<SeriesDetailsState> emit) async {
    final result = await getSeriesRecommendationsUseCse(
        SeriesRecommendationParameters(seriesId: event.id)
    );
    result.fold(
            (l) => emit(state.copyWith(
            seriesRecommendationState: RequestState.error,
            seriesRecommendationMessage: l.message)),
            (r) => emit(state.copyWith(
                seriesRecommendationState: RequestState.loaded, recommendation: r )));
  }


}
