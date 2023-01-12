

import 'package:movie/layout/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({ super.backdropPath, required super.id});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        id: json['id'],
        backdropPath: json['backdrop_path']??'/gILte6Zd7m1YneIr6MVhh30S9pr.jpg',
      );
}
