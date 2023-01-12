abstract class MoviesEvents {
  const MoviesEvents();
  List<Object> get props => [];
}

class GetNowPlayingMoviesEvent extends MoviesEvents {}

class GetPopularMoviesEvent extends MoviesEvents {}

class GetTopRatedMoviesEvent extends MoviesEvents {}
