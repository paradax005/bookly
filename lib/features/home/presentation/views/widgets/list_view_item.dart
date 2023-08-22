import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.w),
        image: DecorationImage(
          image: NetworkImage(ImageAssets.networkBookTest),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
