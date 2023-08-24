import 'package:bookly/core/widgets/height_spacer.dart';
import 'package:bookly/features/home/presentation/views/widgets/home/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class SearchListViewResult extends StatelessWidget {
  const SearchListViewResult({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (context, index) {
        return (index < 9) ? const HeightSpacer(size: 20) : const HeightSpacer(size: 40);
      },
      itemBuilder: (context, index) {
        return const BestSellerListViewItem();
      },
    );
  }
}
