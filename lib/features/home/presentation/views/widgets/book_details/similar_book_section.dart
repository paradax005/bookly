import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/height_spacer.dart';
import 'package:flutter/material.dart';

class SimilarBookSection extends StatelessWidget {
  const SimilarBookSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "You Can also like",
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const HeightSpacer(size: 15),
        /*SizedBox(
          height: 100.h,
          child: const FeaturedListViewItem(),
        ),*/
      ],
    );
  }
}
