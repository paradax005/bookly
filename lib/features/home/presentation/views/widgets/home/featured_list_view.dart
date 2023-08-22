import 'package:bookly/config/routes/names.dart';
import 'package:bookly/core/widgets/width_spacer.dart';
import 'package:bookly/features/home/presentation/views/widgets/home/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.w,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (context, index) => const WidthSpacer(width: 20),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              GoRouter.of(context).push(RoutesName.BOOK_DETAIL);
            },
            child: const CustomBookItem(),
          );
        },
      ),
    );
  }
}
