import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/core/services/services_locator.dart';
import 'package:movie/layout/movies/presentation/components/now_playing.dart';
import 'package:movie/layout/movies/presentation/components/popular_moves.dart';
import 'package:movie/layout/movies/presentation/components/see_more_screen.dart';
import 'package:movie/layout/movies/presentation/components/top_rated_moves.dart';
import 'package:movie/layout/movies/presentation/controller/bloc/movies_bloc.dart';
import 'package:movie/layout/movies/presentation/controller/bloc/movies_events.dart';
import 'package:movie/layout/movies/presentation/controller/bloc/movies_states.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              key: const Key('movieScrollView'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NowPlayingComponent(),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular",
                          style: GoogleFonts.poppins(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SeeMoreMovies(data: state.popularMovies),
                                ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Text(
                                  'See More',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.0,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const PopularMoviesComponent(),
                  Container(
                    margin: const EdgeInsets.fromLTRB(
                      16.0,
                      24.0,
                      16.0,
                      8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top Rated",
                          style: GoogleFonts.poppins(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SeeMoreMovies(data: state.topRatedMovies),
                                ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Text('See More',
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.0,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const TopRatedMovesComponent(),
                  const SizedBox(height: 50.0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
