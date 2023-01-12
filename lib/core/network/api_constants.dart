class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '5b77cbfdf7d1b257a091909d633b4fc6';
  static const String nowPlayingMoviePath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMoviesPath =
      '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMoviesPath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500/';
  static String imageUrl(String path) => '$baseImageUrl$path';

  static String movieDetailsPath(int movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';

  static String movieRecommendationPath(int movieId) =>
      '$baseUrl/movie/$movieId/similar?api_key=$apiKey';

  static const String onAirSeriesPath = '$baseUrl/tv/on_the_air?api_key=$apiKey';
  static const String popularSeriesPath = '$baseUrl/tv/popular?api_key=$apiKey';
  static const String topRatedSeriesPath = '$baseUrl/tv/top_rated?api_key=$apiKey';
  static String seriesDetailsPath(int seriesId) =>
      '$baseUrl/tv/$seriesId?api_key=$apiKey';

  static String seriesRecommendationPath(int seriesId) =>
      '$baseUrl/tv/$seriesId/similar?api_key=$apiKey';
}
//https://api.themoviedb.org/3/tv/66732/similar?api_key=5b77cbfdf7d1b257a091909d633b4fc6&language=en-US&page=1