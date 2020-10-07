import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:genius_demo/core/utils/text_style.dart';
import 'package:genius_demo/core/widgets/shimmerEffect.dart';
import 'package:genius_demo/features/movies/domain/entities/movies_response.dart';

class PageViewItem extends StatelessWidget {
  final Results movie;
  PageViewItem({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width - 40,
              width: MediaQuery.of(context).size.width - 40,
              foregroundDecoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: CachedNetworkImage(
                imageUrl:
                    'https://image.tmdb.org/t/p/w600_and_h900_bestv2${movie.poster_path}',
                placeholder: (context, url) => Center(
                  child: ShimmerEffect(
                      height: MediaQuery.of(context).size.width - 40),
                ),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        movie.vote_average.toString(),
                        style: StyleText.montMedium,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade700,
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(top: 12),
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.grey.shade300,
                          Colors.transparent,
                        ])),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                    bottom: 16,
                  ),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 50,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: Text(
                                movie.title,
                                textAlign: TextAlign.right,
                                style: StyleText.montSemiBold.copyWith(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            Text(
                              movie.release_date,
                              overflow: TextOverflow.ellipsis,
                              style: StyleText.montMedium
                                  .copyWith(color: Colors.white, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
