import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/layout/series/domain/entities/series.dart';
import 'package:movie/layout/series/domain/entities/series_recommendations.dart';
import 'package:movie/layout/series/domain/entities/serise_details.dart';
import 'package:movie/layout/series/domain/usecases/get_series_details_usecase.dart';
import 'package:movie/layout/series/domain/usecases/get_series_recommandations_usecase.dart';

abstract class BaseSeriesRepository {
  Future<Either<Failure, List<Series>>>getOnAirSeries();
  Future<Either<Failure, List<Series>>>getPopularSeries();
  Future<Either<Failure, List<Series>>>getTopRatedSeries();
  Future<Either<Failure, SeriesDetails>>getSeriesDetails(SeriesDetailsParameters parameters);
  Future<Either<Failure, List<SeriesRecommendation>>>getSeriesRecommendation(SeriesRecommendationParameters parameters);
}