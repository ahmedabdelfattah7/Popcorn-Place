import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/core/usecase/base_use_case.dart';
import 'package:movie/layout/movies/domain/entities/movies.dart';
import 'package:movie/layout/series/domain/entities/series.dart';
import 'package:movie/layout/series/domain/repository/base_tv_repositry.dart';

class OnAirSeriesUseCase extends BaseUseCase<List<Series>,NoParameters> {
  final BaseSeriesRepository baseSeriesRepository;

  OnAirSeriesUseCase(this.baseSeriesRepository);

  @override
  Future<Either< Failure ,List<Series>>> call(NoParameters parameters) async {
    return await baseSeriesRepository.getOnAirSeries();
  }
}