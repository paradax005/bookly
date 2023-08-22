import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/height_spacer.dart';
import 'package:bookly/features/home/presentation/views/widgets/home/best_seller_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/home/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/home/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(),
                  HeightSpacer(size: 40),
                  FeaturedListViewItem(),
                  HeightSpacer(size: 40),
                  Text(
                    "Best Seller",
                    style: Styles.textStyle18,
                  ),
                  HeightSpacer(size: 20),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: BestSellerListView(),
          )
        ],
      ),
    );
  }
}
