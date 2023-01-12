import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/core/usecase/base_use_case.dart';
import 'package:movie/layout/series/domain/entities/series_recommendations.dart';
import 'package:movie/layout/series/domain/repository/base_tv_repositry.dart';

class GetSeriesRecommendationsUseCse extends BaseUseCase
<List<SeriesRecommendation>,SeriesRecommendationParameters>{
  final BaseSeriesRepository baseSeriesRepository;


  GetSeriesRecommendationsUseCse(this.baseSeriesRepository);

  @override
  Future<Either<Failure, List<SeriesRecommendation>>> call(SeriesRecommendationParameters parameters,) async{
    return await baseSeriesRepository.getSeriesRecommendation(parameters);
  }

}
class SeriesRecommendationParameters extends Equatable{
  final int seriesId;

  const SeriesRecommendationParameters({required this.seriesId});

  @override
  List<Object?> get props => [
    seriesId
  ];

}