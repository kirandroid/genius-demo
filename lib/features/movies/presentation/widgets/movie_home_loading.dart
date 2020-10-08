import 'package:flutter/material.dart';
import 'package:genius_demo/core/widgets/shimmerEffect.dart';

class MovieHomeLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ShimmerEffect(
            height: MediaQuery.of(context).size.width - 40,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (ctx, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: ShimmerEffect(
                          height: 20,
                          width: 100,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
                        child: ShimmerEffect(
                          height: 20,
                          width: 100,
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
                          return Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ShimmerEffect(
                                  height: 130,
                                  width: 100,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ShimmerEffect(
                                  height: 12,
                                  width: 100,
                                ),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
