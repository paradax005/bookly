import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle appStyle({required Color color, required double size, required FontWeight fw}) {
  return TextStyle(
    color: color,
    fontSize: size.sp,
    fontWeight: fw,
  );
}
