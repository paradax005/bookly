import 'package:bookly/core/widgets/custom_fading_indicator.dart';
import 'package:bookly/core/widgets/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_book_item_loading.dart';

class FeaturedListViewIndicator extends StatelessWidget {
  const FeaturedListViewIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingIndicator(
      child: SizedBox(
        height: 180.w,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          separatorBuilder: (context, index) => const WidthSpacer(width: 20),
          itemBuilder: (context, index) {
            return const CustomBookItemLoading();
          },
        ),
      ),
    );
  }
}
