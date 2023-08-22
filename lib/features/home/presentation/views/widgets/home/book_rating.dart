import 'package:bookly/core/utils/colors.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    String averageRating = "4.8";
    int ratingCount = 2330;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.solidStar,
            color: kStarColor,
            size: 14.r,
          ),
          const WidthSpacer(width: 7),
          Text(
            averageRating,
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
          ),
          const WidthSpacer(width: 5),
          Text(
            "($ratingCount)",
            style: Styles.textStyle14.copyWith(
              color: kLight.withOpacity(.5),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
