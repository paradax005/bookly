import 'package:bookly/core/utils/colors.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/height_spacer.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details/book_actions.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details/book_detail_header.dart';
import 'package:bookly/features/home/presentation/views/widgets/home/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/home/custom_book_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/home/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    String title = "The Jungle Book";
    String author = "Rudyard Kipling";
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 32.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const BookDetailHeader(),
              const HeightSpacer(size: 30),
              SizedBox(
                width: 140.w,
                child: const CustomBookItem(),
              ),
              const HeightSpacer(size: 20),
              Text(
                title,
                style: Styles.textStyle30.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              const HeightSpacer(size: 4),
              Text(
                author,
                style: Styles.textStyle18.copyWith(
                  color: kLight.withOpacity(.7),
                  fontStyle: FontStyle.italic,
                ),
              ),
              const HeightSpacer(size: 18),
              const BookRating(),
              const HeightSpacer(size: 30),
              const BookActions(),
              const HeightSpacer(size: 20),
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
              SizedBox(
                height: 100.h,
                child: const FeaturedListViewItem(),
              ),
              const HeightSpacer(size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
