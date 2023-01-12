import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/usecase/base_use_case.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/layout/series/domain/usecases/get_on_air_series_usecaase.dart';
import 'package:movie/layout/series/domain/usecases/get_popular_series_usecase.dart';
import 'package:movie/layout/series/domain/usecases/get_top_rated_series_usecase.dart';
import 'package:movie/layout/series/presentation/controller/series_events.dart';
import 'package:movie/layout/series/presentation/controller/series_states.dart';

class SeriesBloc extends Bloc<SeriesEvents, SeriesStates> {
  OnAirSeriesUseCase onAirSeriesUseCase;
  PopularSeriesUseCase popularSeriesUseCase;
  TopRatedSeriesUseCase topRatedSeriesUseCase;
  SeriesBloc(this.onAirSeriesUseCase,this.popularSeriesUseCase,this.topRatedSeriesUseCase)   : super(const SeriesStates()) {
    on<GetOnAirSeriesEvent>((event, emit) async {
      final result = await onAirSeriesUseCase(const NoParameters());

      result.fold(
            (l) => state.copyWith(
          onAirSeriesState: RequestState.error,
          onAirSeriesMessage: l.message,
        ),
            (r) => emit(
          state.copyWith(
            onAirSeriesState: RequestState.loaded,
            onAirSeries: r,
          ),
        ),
      );
    });
    on<GetPopularSeriesEvent>((event, emit) async {
      final result = await popularSeriesUseCase(const NoParameters());

      result.fold(
            (l) => state.copyWith(
          popularSeriesState: RequestState.error,
          popularSeriesMessage: l.message,
        ),
            (r) => emit(
          state.copyWith(
            popularSeriesState: RequestState.loaded,
            popularSeries: r,
          ),
        ),
      );
    });

    on<GetTopRatedSeriesEvent>((event, emit) async {
      final result = await topRatedSeriesUseCase(const NoParameters());

      result.fold(
            (l) => state.copyWith(
          topRatedSeriesState: RequestState.error,
          topRatedSeriesMessage: l.message,
        ),
            (r) => emit(
          state.copyWith(
            topRatedSeriesState: RequestState.loaded,
            topRatedSeries: r,
          ),
        ),
      );
    });

  }

}