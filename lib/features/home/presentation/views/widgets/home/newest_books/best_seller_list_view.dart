import 'package:bookly/core/widgets/height_spacer.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/home/newest_books/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
    required this.books,
  });

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: books.length,
      separatorBuilder: (context, index) {
        return (index < books.length - 1) ? const HeightSpacer(size: 20) : const HeightSpacer(size: 40);
      },
      itemBuilder: (context, index) {
        return BestSellerListViewItem(
          book: books[index],
        );
      },
    );
  }
}
