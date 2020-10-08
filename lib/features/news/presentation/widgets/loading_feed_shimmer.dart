import 'package:flutter/material.dart';
import 'package:genius_demo/core/widgets/shimmerEffect.dart';

class LoadingFeedShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ShimmerEffect(
              height: 200,
            ),
            const SizedBox(
              height: 10,
            ),
            ShimmerEffect(
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            ShimmerEffect(
              height: 40,
            ),
            const SizedBox(
              height: 10,
            )
          ],
        );
      },
    );
  }
}
