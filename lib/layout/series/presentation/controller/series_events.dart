abstract class SeriesEvents {
  const SeriesEvents();
  List<Object> get props => [];
}

class GetOnAirSeriesEvent extends SeriesEvents {}
class GetPopularSeriesEvent extends SeriesEvents {}
class GetTopRatedSeriesEvent extends SeriesEvents {}