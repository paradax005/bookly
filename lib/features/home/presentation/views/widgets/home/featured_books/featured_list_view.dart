import 'package:bookly/config/routes/names.dart';
import 'package:bookly/core/widgets/width_spacer.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/cubit/featured_book/featured_book_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/home/featured_books/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FeaturedListViewItem extends StatefulWidget {
  const FeaturedListViewItem({
    super.key,
    required this.books,
  });

  final List<BookEntity> books;

  @override
  State<FeaturedListViewItem> createState() => _FeaturedListViewItemState();
}

class _FeaturedListViewItemState extends State<FeaturedListViewItem> {
  late ScrollController _scrollController;
  int nextPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() async {
    num currentPosition = _scrollController.position.pixels;
    num maxScrollLength = _scrollController.position.maxScrollExtent;

    if (currentPosition > maxScrollLength * .7) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FeaturedBookCubit>(context).fetchFeaturedBooks(pageNumber: nextPage++);

        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.w,
      child: ListView.separated(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        separatorBuilder: (context, index) => const WidthSpacer(width: 20),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              GoRouter.of(context).push(RoutesName.BOOK_DETAIL);
            },
            child: CustomBookItem(image: widget.books[index].image ?? ""),
          );
        },
      ),
    );
  }
}
