import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/constant.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/height_spacer.dart';
import 'package:bookly/core/widgets/width_spacer.dart';
import 'package:bookly/features/home/presentation/views/widgets/home/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    String title = "Harry Potter and the Globlet of Fire";
    String author = "J.K. Rowling";
    String price = "19.99 \$";
    return SizedBox(
      height: 125.h,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.4 / 4,
            child: Container(
              width: 120.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.w),
                image: DecorationImage(
                  image: NetworkImage(ImageAssets.networkBookTest),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const WidthSpacer(width: 25),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200.w,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Styles.textStyle20.copyWith(fontFamily: fontGTSectraFine),
                  ),
                ),
                const HeightSpacer(size: 5),
                Text(
                  author,
                  style: Styles.textStyle14,
                ),
                const HeightSpacer(size: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const BookRating(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
