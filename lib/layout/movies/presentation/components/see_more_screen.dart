import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/layout/movies/presentation/screens/Movies_screen/movie_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

class SeeMoreMovies extends StatelessWidget {
  final data;
  const SeeMoreMovies({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: data.length,
              itemBuilder: (context, index) {
                 final movie = data[index];
                return Container(

                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                MovieDetailScreen(id: movie.id)),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: ApiConstants.imageUrl(movie.backdropPath!),
                            placeholder: (context, url) => Shimmer.fromColors(
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
                      const SizedBox(
                        width:10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(movie.title,
                                style: GoogleFonts.poppins(
                                  fontSize: 18,


                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2.0,
                                    horizontal: 8.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red[800],
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Text(
                                    movie.releaseDate.split('-')[0],
                                    style: const TextStyle(
                                      fontSize: 14.0,

                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      (movie.voteAverage ).toStringAsFixed(1),
                                      style: const TextStyle(
                                        fontSize: 14.0,

                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      '(${movie.voteAverage})',
                                      style: const TextStyle(
                                        fontSize: 1.0,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              movie.overview,

                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,

                                overflow: TextOverflow.ellipsis
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                );
              }),
        ));
  }
}
