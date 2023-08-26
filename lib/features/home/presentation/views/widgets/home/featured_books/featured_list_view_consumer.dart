import 'package:bookly/core/utils/functions/snackbar_error.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/cubit/featured_book/featured_book_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/home/featured_books/featured_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/home/featured_books/loading/featured_list_view_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocConsumer extends StatefulWidget {
  const FeaturedBooksListViewBlocConsumer({super.key});

  @override
  State<FeaturedBooksListViewBlocConsumer> createState() => _FeaturedBooksListViewBlocConsumerState();
}

class _FeaturedBooksListViewBlocConsumerState extends State<FeaturedBooksListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBookCubit, FeaturedBookState>(
      listener: (context, state) {
        if (state is FeaturedBookSuccess) {
          books.addAll(state.books);
        }
        if (state is FeaturedBookPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(buildSnackBarError(state.message));
        }
      },
      builder: (context, state) {
        if (state is FeaturedBookSuccess ||
            state is FeaturedBookPaginationLoading ||
            state is FeaturedBookPaginationFailure) {
          return FeaturedListViewItem(books: books);
        } else if (state is FeaturedBookFailure) {
          return Text(state.message, style: Styles.textStyle18);
        } else {
          return const FeaturedListViewIndicator();
        }
      },
    );
  }
}
