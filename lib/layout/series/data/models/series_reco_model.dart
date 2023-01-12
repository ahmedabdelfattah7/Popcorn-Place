import 'package:movie/layout/series/domain/entities/series_recommendations.dart';

class SeriesRecommendationModel extends SeriesRecommendation {
  const SeriesRecommendationModel({ super.backdropPath, required super.id});

  factory SeriesRecommendationModel.fromJson(Map<String, dynamic> json) =>
      SeriesRecommendationModel(
        id: json['id'],
        backdropPath: json['backdrop_path']??'/gILte6Zd7m1YneIr6MVhh30S9pr.jpg',
      );
}
