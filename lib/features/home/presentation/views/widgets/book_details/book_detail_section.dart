import 'package:bookly/core/utils/colors.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/height_spacer.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details/book_actions.dart';
import 'package:bookly/features/home/presentation/views/widgets/home/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    String title = "The Jungle Book";
    String author = "Rudyard Kipling";
    return Column(
      children: [
        SizedBox(
          width: 140.w,
          child: const SizedBox(),
          //const CustomBookItem(book : BookEntity()),
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
      ],
    );
  }
}
