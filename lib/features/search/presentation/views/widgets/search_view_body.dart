import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/height_spacer.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_result_listview.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          HeightSpacer(size: 20),
          Text(
            "Search Result",
            style: Styles.textStyle18,
          ),
          HeightSpacer(size: 20),
          Expanded(child: SearchListViewResult()),
        ],
      ),
    );
  }
}
