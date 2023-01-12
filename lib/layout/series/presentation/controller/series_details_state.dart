part of 'series_details_bloc.dart';

class SeriesDetailsState extends Equatable {
  final SeriesDetails? seriesDetails;
  final RequestState seriesDetailsState;
  final String seriesDetailsMessage;

  final List<SeriesRecommendation>? recommendation;
  final RequestState seriesRecommendationState;
  final String seriesRecommendationMessage;

  const SeriesDetailsState({
    this.seriesDetails,
    this.seriesDetailsState = RequestState.loading,
    this.seriesDetailsMessage = '',
    this.recommendation = const [],
    this.seriesRecommendationState = RequestState.loading,
    this.seriesRecommendationMessage = '',
  });

  SeriesDetailsState copyWith({
    SeriesDetails? seriesDetails,
    RequestState? seriesDetailsState,
    String? seriesDetailsMessage,
    List<SeriesRecommendation>? recommendation,
    RequestState? seriesRecommendationState,
    String? seriesRecommendationMessage,
  }) {
    return SeriesDetailsState(
      seriesDetails: seriesDetails ?? this.seriesDetails,
      seriesDetailsState: seriesDetailsState ?? this.seriesDetailsState,
      seriesDetailsMessage: seriesDetailsMessage ?? this.seriesDetailsMessage,
      recommendation: recommendation ?? this.recommendation,
      seriesRecommendationState:
          seriesRecommendationState ?? this.seriesRecommendationState,
      seriesRecommendationMessage:
          seriesDetailsMessage ?? this.seriesRecommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
        seriesDetails,
        seriesDetailsState,
        seriesDetailsMessage,
        recommendation,
        seriesRecommendationState,
        seriesRecommendationMessage
      ];
}
