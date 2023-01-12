import 'package:movie/layout/movies/data/models/genres_model.dart';
import 'package:movie/layout/series/domain/entities/serise_details.dart';

class SeriesDetailsModel extends SeriesDetails {
  const SeriesDetailsModel(
      {required super.backDropPath,
      required super.genres,
      required super.id,
      required super.overView,
      required super.name,
        required super.voteAverage,
      required super.numberOfSeasons,
      required super.numberOfEpisodes,
      required super.firstAirDate});

  factory SeriesDetailsModel.fromJson(Map<String, dynamic> json) =>
      SeriesDetailsModel(
          voteAverage:json['vote_average']??8.7,
          backDropPath: json['backdrop_path'] ?? '/3ayWL13P1HeRnyVL9lU9flOdZjq.jpg',
          genres: List<GenresModel>.from(
            json['genres'].map(
              (x) => GenresModel.fromJson(x),
            ),
          ),
          id: json['id'],
          overView: json['overview'],
          firstAirDate: json['first_air_date'],
          name: json['original_name'],
          numberOfEpisodes: json['number_of_episodes'],
          numberOfSeasons: json['number_of_seasons']);
}
