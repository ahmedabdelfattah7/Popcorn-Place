import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/core/usecase/base_use_case.dart';
import 'package:movie/layout/series/domain/repository/base_tv_repositry.dart';

import '../entities/serise_details.dart';

class GetSeriesDetailsUseCse extends BaseUseCase<SeriesDetails,SeriesDetailsParameters>{
  final BaseSeriesRepository baseSeriesRepository;


  GetSeriesDetailsUseCse(this.baseSeriesRepository);

  @override
  Future<Either<Failure, SeriesDetails>> call(SeriesDetailsParameters parameters,) async{
    return await baseSeriesRepository.getSeriesDetails(parameters);
  }

}
class SeriesDetailsParameters extends Equatable{
  final int seriesId;

  const SeriesDetailsParameters({required this.seriesId});

  @override
  List<Object?> get props => [
    seriesId
  ];

}