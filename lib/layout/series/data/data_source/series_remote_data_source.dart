import 'package:dio/dio.dart';
import 'package:movie/core/error/exceptions.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/network/error_massage_model.dart';
import 'package:movie/layout/series/data/models/series_details_model.dart';
import 'package:movie/layout/series/data/models/series_reco_model.dart';
import 'package:movie/layout/series/data/models/serise_model.dart';
import 'package:movie/layout/series/domain/entities/series_recommendations.dart';
import 'package:movie/layout/series/domain/entities/serise_details.dart';
import 'package:movie/layout/series/domain/usecases/get_series_details_usecase.dart';
import 'package:movie/layout/series/domain/usecases/get_series_recommandations_usecase.dart';

abstract class BaseSeriesRemoteDataResource {
  Future<List<SeriesModel>> getOnAirSeries();
  Future<List<SeriesModel>> getPopularSeries();
  Future<List<SeriesModel>> getTopRatedSeries();
  Future<SeriesDetails> getSeriesDetails(SeriesDetailsParameters parameters);
  Future<List<SeriesRecommendation>> getSeriesRecommendation(
      SeriesRecommendationParameters parameters);
}

class SeriesRemoteDataSource extends BaseSeriesRemoteDataResource {
  @override
  Future<List<SeriesModel>> getOnAirSeries() async {
    final response = await Dio().get(ApiConstants.onAirSeriesPath);

    if (response.statusCode == 200) {
      return List<SeriesModel>.from(
        (response.data['results'] as List).map(
          (element) => SeriesModel?.fromJson(element),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<SeriesModel>> getPopularSeries() async {
    final response = await Dio().get(ApiConstants.popularSeriesPath);
    if (response.statusCode == 200) {
      return List<SeriesModel>.from(
        (response.data['results'] as List).map(
          (element) => SeriesModel?.fromJson(element),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<SeriesModel>> getTopRatedSeries() async {
    final response = await Dio().get(ApiConstants.topRatedSeriesPath);
    if (response.statusCode == 200) {
      return List<SeriesModel>.from(
        (response.data['results'] as List).map(
          (element) => SeriesModel?.fromJson(element),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<SeriesDetails> getSeriesDetails(
      SeriesDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.seriesDetailsPath(parameters.seriesId));
    if (response.statusCode == 200) {
      return SeriesDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<SeriesRecommendation>> getSeriesRecommendation(SeriesRecommendationParameters parameters) async{
    final response = await Dio()
        .get(ApiConstants.seriesRecommendationPath(parameters.seriesId));
    if (response.statusCode == 200) {
      return List<SeriesRecommendation>.from(
        (response.data['results'] as List).map(
              (element) => SeriesRecommendationModel.fromJson(element),
        ),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
    }
  }



