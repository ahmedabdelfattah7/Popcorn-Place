import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/layout/series/presentation/controller/series_bloc.dart';
import 'package:movie/layout/series/presentation/controller/series_states.dart';
import 'package:movie/layout/series/presentation/screens/series_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class TopRatedSeriesComponent extends StatelessWidget {
  const TopRatedSeriesComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesBloc, SeriesStates>(
      buildWhen:(previous, current)=> previous.topRatedSeriesState!=current.topRatedSeriesState,
      builder: (context, state) {

        switch (state.topRatedSeriesState) {
          case RequestState.loading:
            return const SizedBox(
              height: 400,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.topRatedSeries.length,
                  itemBuilder: (context, index) {
                    final movie = state.topRatedSeries[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SeriesDetailScreen(id: movie.id)),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(
                              8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: ApiConstants.imageUrl(
                                movie.backdropPath!),
                            placeholder: (context, url) =>
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[850]!,
                                  highlightColor: Colors.grey[800]!,
                                  child: Container(
                                    height: 170.0,
                                    width: 120.0,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestState.error:
            return Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  state.topRatedSeriesMessage,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}