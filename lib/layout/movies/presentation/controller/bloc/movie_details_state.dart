part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;



  final List<Recommendation>? recommendation;
  final RequestState movieRecommendationState;
  final String movieRecommendationMessage;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',

    this.movieRecommendationMessage = '',
    this.movieRecommendationState = RequestState.loading,
    this.recommendation = const [],
  });

  MovieDetailsState copyWith({

    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,

    List<Recommendation>? recommendation,
    RequestState? movieRecommendationState,
    String? movieRecommendationMessage,

  }) {
    return MovieDetailsState(

      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,

      recommendation: recommendation ?? this.recommendation,
      movieRecommendationState:
      movieRecommendationState ?? this.movieRecommendationState,
      movieRecommendationMessage:
      movieRecommendationMessage ?? this.movieRecommendationMessage,
    );
  }
  @override
  List<Object?> get props =>
      [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,

        recommendation,
        movieRecommendationState,
        movieRecommendationMessage,
      ];

}
