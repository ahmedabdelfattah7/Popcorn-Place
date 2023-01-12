part of 'series_details_bloc.dart';

abstract class SeriesDetailsEvent extends Equatable {
  const SeriesDetailsEvent();
}
class GetSeriesDetailsEvent extends SeriesDetailsEvent {
  final int id;

  const GetSeriesDetailsEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class GetSeriesRecommendationEvent extends SeriesDetailsEvent {
  final int id;

  const GetSeriesRecommendationEvent(this.id);

  @override
  List<Object?> get props => [id];
}