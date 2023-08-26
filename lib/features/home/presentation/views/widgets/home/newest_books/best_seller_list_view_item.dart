import 'package:bookly/core/utils/constant.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/height_spacer.dart';
import 'package:bookly/core/widgets/width_spacer.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/home/book_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125.h,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.4 / 4,
            child: SizedBox(
              width: 120.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.w),
                child: CachedNetworkImage(imageUrl: book.image ?? ""),
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
                    book.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Styles.textStyle20.copyWith(fontFamily: fontGTSectraFine),
                  ),
                ),
                const HeightSpacer(size: 5),
                Text(
                  book.author ?? "unknown",
                  style: Styles.textStyle14,
                ),
                const HeightSpacer(size: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      book.price == 0 ? "Free" : "${book.price}\$",
                      style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
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
