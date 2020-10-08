import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  final double height;
  final double width;
  final bool isCircular;

  const ShimmerEffect({
    Key key,
    this.height = 30.0,
    this.width,
    this.isCircular = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      child: Container(
        height: this.height,
        width: this.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(this.isCircular ? this.height : 8)),
      ),
    );
  }
}
