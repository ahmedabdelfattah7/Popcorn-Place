import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/core/services/services_locator.dart';
import 'package:movie/layout/movies/presentation/components/see_more_screen.dart';
import 'package:movie/layout/series/presentation/components/on_air_componant.dart';
import 'package:movie/layout/series/presentation/components/popular_series.dart';
import 'package:movie/layout/series/presentation/components/see_more_series.dart';
import 'package:movie/layout/series/presentation/components/top_rated_series.dart';
import 'package:movie/layout/series/presentation/controller/series_bloc.dart';
import 'package:movie/layout/series/presentation/controller/series_events.dart';
import 'package:movie/layout/series/presentation/controller/series_states.dart';

class SeriesScreen extends StatelessWidget {
  const SeriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SeriesBloc>()..add(GetOnAirSeriesEvent())..add(GetPopularSeriesEvent())..add(GetTopRatedSeriesEvent()),
      child: BlocBuilder<SeriesBloc, SeriesStates>(
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              key: const Key('movieScrollView'),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const OnAirComponent(),
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
                                        SeeMoreSeries(data: state.popularSeries),
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
                    const PopularSeriesComponent(),
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
                                        SeeMoreSeries(data: state.topRatedSeries),
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
                    const TopRatedSeriesComponent(),
                  ]),
            ),
          );
        },
      ),
    );
  }
}
