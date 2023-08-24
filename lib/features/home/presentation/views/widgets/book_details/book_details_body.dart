import 'package:bookly/core/widgets/height_spacer.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details/book_detail_header.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details/book_detail_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details/similar_book_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 32.w),
        child: const CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: true,
              child: Column(
                children: [
                  BookDetailHeader(),
                  HeightSpacer(size: 30),
                  BookDetailsSection(),
                  Expanded(
                    child: HeightSpacer(size: 15),
                  ),
                  SimilarBookSection(),
                  HeightSpacer(size: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
