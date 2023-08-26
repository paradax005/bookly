import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBookItemLoading extends StatelessWidget {
  const CustomBookItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.8 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.w),
        child: Container(color: Colors.grey),
      ),
    );
  }
}
