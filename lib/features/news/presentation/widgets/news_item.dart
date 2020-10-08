import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:genius_demo/core/utils/text_style.dart';
import 'package:genius_demo/core/widgets/shimmerEffect.dart';
import 'package:genius_demo/features/news/domain/entities/news_response.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  final Articles article;
  const NewsItem({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: article.urlToImage == null
              ? "https://images.creativemarket.com/0.1.0/ps/3373662/300/200/m2/fpnw/wm0/yc1d62zhyatvyi8wcjmu59mgjryp7gvj9wjcsqguo4k6quucwkj4majkkyie2m0i-.jpg?1507355207&s=4efd71fc35d8475d0f31e85ef845d63b"
              : article.urlToImage,
          fit: BoxFit.cover,
          placeholder: (context, url) => ShimmerEffect(
            height: 200,
          ),
          errorWidget: (context, url, error) => ShimmerEffect(
            height: 200,
          ),
          imageBuilder: (context, imageProvider) => Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              article.source.name.toUpperCase(),
              style: StyleText.cormorantBold.copyWith(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            Text(
              timeago.format(DateTime.parse(article.publishedAt)),
              style: StyleText.cormorantBold.copyWith(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          article.title,
          style: StyleText.cormorantBold.copyWith(fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          article.description == null
              ? "[Decription Not Found]"
              : article.description,
          style: StyleText.montRegular.copyWith(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        Divider()
      ],
    );
  }
}
