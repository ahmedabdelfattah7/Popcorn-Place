import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/layout/series/domain/entities/series.dart';

class SeriesStates extends Equatable {
  final List<Series> onAirSeries;
  final RequestState onAirSeriesState;
  final String onAirSeriesMessage;

  final List<Series> popularSeries;
  final RequestState popularSeriesState;
  final String popularSeriesMessage;

  final List<Series> topRatedSeries;
  final RequestState topRatedSeriesState;
  final String topRatedSeriesMessage;

  const SeriesStates({
    this.onAirSeries = const [],
    this.onAirSeriesState = RequestState.loading,
    this.onAirSeriesMessage = '',

    this.popularSeries = const [],
    this.popularSeriesState = RequestState.loading,
    this.popularSeriesMessage = '',

    this.topRatedSeries = const [],
    this.topRatedSeriesState = RequestState.loading,
    this.topRatedSeriesMessage = '',

  });

  SeriesStates copyWith({
    final List<Series>? onAirSeries,
    final RequestState? onAirSeriesState,
    final String? onAirSeriesMessage,

    final List<Series>? popularSeries,
    final RequestState? popularSeriesState,
    final String? popularSeriesMessage,

    final List<Series>? topRatedSeries,
    final RequestState? topRatedSeriesState,
    final String? topRatedSeriesMessage,
  }) {
    return SeriesStates(
      onAirSeries: onAirSeries ?? this.onAirSeries,
      onAirSeriesState: onAirSeriesState ?? this.onAirSeriesState,
      onAirSeriesMessage: onAirSeriesMessage ?? this.onAirSeriesMessage,

      popularSeries:  popularSeries ?? this.popularSeries,
      popularSeriesState: popularSeriesState ?? this.popularSeriesState,
      popularSeriesMessage: popularSeriesMessage ?? this.popularSeriesMessage,

      topRatedSeries: topRatedSeries ?? this.topRatedSeries,
      topRatedSeriesState: topRatedSeriesState ?? this.topRatedSeriesState,
      topRatedSeriesMessage: topRatedSeriesMessage?? this.topRatedSeriesMessage,

    );
  }
  @override
  List<Object> get props =>
      [
        onAirSeries,
        onAirSeriesState,
        onAirSeriesMessage,
        popularSeries,
        popularSeriesState,
        popularSeriesMessage,
        topRatedSeries,
        topRatedSeriesState,
        topRatedSeriesMessage,
      ];
}