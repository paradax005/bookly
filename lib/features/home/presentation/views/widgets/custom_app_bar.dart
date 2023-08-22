import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          ImageAssets.logo,
          height: 16.h,
        ),
        GestureDetector(
          onTap: () {},
          child: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: kLight,
            size: 18,
          ),
        )
      ],
    );
  }
}
