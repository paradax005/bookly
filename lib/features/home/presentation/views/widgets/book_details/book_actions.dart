import 'package:bookly/core/utils/colors.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.w),
              bottomLeft: Radius.circular(12.w),
            ),
            text: "19.99 \$",
          ),
        ),
        Expanded(
          child: CustomButton(
            backgroundColor: kOrange,
            textColor: kLight,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12.w),
              bottomRight: Radius.circular(12.w),
            ),
            text: "Free Preview",
          ),
        ),
      ],
    );
  }
}
