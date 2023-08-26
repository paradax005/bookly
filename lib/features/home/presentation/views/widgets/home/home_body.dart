import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/height_spacer.dart';
import 'package:bookly/features/home/presentation/cubit/newest_book/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/home/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/home/featured_books/featured_list_view_consumer.dart';
import 'package:bookly/features/home/presentation/views/widgets/home/newest_books/best_seller_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(),
                  HeightSpacer(size: 40),
                  FeaturedBooksListViewBlocConsumer(),
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
            child: BlocBuilder<NewestBooksCubit, NewestBooksState>(
              builder: (context, state) {
                if (state is NewestBooksSuccess) {
                  return BestSellerListView(books: state.books);
                } else if (state is NewestBooksFailure) {
                  return Text(state.message, style: Styles.textStyle18);
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
