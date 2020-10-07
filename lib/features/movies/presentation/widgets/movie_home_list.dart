import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:genius_demo/core/utils/text_style.dart';
import 'package:genius_demo/core/widgets/shimmerEffect.dart';
import 'package:genius_demo/core/extensions/context_extension.dart';
import 'package:genius_demo/features/movies/domain/entities/movies_response.dart';

class MovieHomeList extends StatelessWidget {
  final String listTitle;
  final MoviesResponse moviesResponse;
  MovieHomeList({@required this.moviesResponse, @required this.listTitle});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(listTitle,
                  style: StyleText.montMedium.copyWith(
                      color: Colors.grey, fontSize: 12, letterSpacing: 2)),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
                child: Text("VIEW ALL",
                    style: StyleText.montSemiBold.copyWith(
                        color: context.theme.corePalatte.colorPrimary,
                        fontSize: 12)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final movie = moviesResponse.results[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {},
                  child: Hero(
                    tag: "ItemDetail${movie.id}",
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: index == 0 ? 16 : 8, right: 8, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 130,
                            width: 100,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w600_and_h900_bestv2${movie.backdrop_path == null ? '/riYInlsq2kf1AWoGm80JQW5dLKp.jpg' : movie.backdrop_path}',
                              placeholder: (context, url) => Center(
                                  child: ShimmerEffect(
                                height: 130,
                              )),
                              errorWidget: (context, url, error) => Center(
                                  child: ShimmerEffect(
                                height: 130,
                              )),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 5),
                              width: 100,
                              child: Text(
                                movie.title,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                style: StyleText.montSemiBold.copyWith(
                                  fontSize: 10,
                                  color: context.theme.textColor,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
