import 'package:bookly/core/utils/colors.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.w,
      child: TextField(
        decoration: InputDecoration(
          hintText: "search",
          hintStyle: Styles.textStyle14,
          suffixIcon: InkWell(
            onTap: () {},
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
              color: kLight.withOpacity(.9),
            ),
          ),
          enabledBorder: buildOutlineBorder(),
          disabledBorder: buildOutlineBorder(),
          focusedBorder: buildOutlineBorder(),
        ),
      ),
    );
  }

  buildOutlineBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.w),
        borderSide: const BorderSide(color: kLight),
      );
}
