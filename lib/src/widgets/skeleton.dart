import 'package:flutter/cupertino.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SSkeleton extends StatelessWidget {
  const SSkeleton({this.height = 48, this.width, super.key});

  final double? width;
  final double height;

  @override
  Widget build(final BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(),
      child: SizedBox(width: width, height: height),
    );
  }
}
