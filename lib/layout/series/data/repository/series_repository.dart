import 'package:dartz/dartz.dart';
import 'package:movie/core/error/exceptions.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/layout/series/data/data_source/series_remote_data_source.dart';
import 'package:movie/layout/series/domain/entities/series.dart';
import 'package:movie/layout/series/domain/entities/series_recommendations.dart';
import 'package:movie/layout/series/domain/entities/serise_details.dart';
import 'package:movie/layout/series/domain/repository/base_tv_repositry.dart';
import 'package:movie/layout/series/domain/usecases/get_series_details_usecase.dart';
import 'package:movie/layout/series/domain/usecases/get_series_recommandations_usecase.dart';

class SeriesRepository extends BaseSeriesRepository{
 final BaseSeriesRemoteDataResource baseSeriesRemoteDataResource;

 SeriesRepository(this.baseSeriesRemoteDataResource);

  @override
  Future<Either<Failure, List<Series>>> getOnAirSeries() async{
    final result = await baseSeriesRemoteDataResource.getOnAirSeries();


    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMassage));
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getPopularSeries() async{
    final result = await baseSeriesRemoteDataResource.getPopularSeries();


    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMassage));
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getTopRatedSeries()async {
    final result = await baseSeriesRemoteDataResource.getTopRatedSeries();


    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMassage));
    }
  }

  @override
  Future<Either<Failure, SeriesDetails>> getSeriesDetails(SeriesDetailsParameters parameters) async{
    final result = await baseSeriesRemoteDataResource.getSeriesDetails(parameters);


    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMassage));
    }

  }

  @override
  Future<Either<Failure, List<SeriesRecommendation>>> getSeriesRecommendation(SeriesRecommendationParameters parameters)async {
    final result = await baseSeriesRemoteDataResource.getSeriesRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMassage));
    }
  }

}