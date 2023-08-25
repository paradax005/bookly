import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/usecase/featured_books_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.featuredBooksUseCase) : super(const FeaturedBookInitial());

  final FeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBookLoading());

    var result = await featuredBooksUseCase.call();
    result.fold(
      (failure) {
        emit(FeaturedBookFailure(failure.message));
      },
      (books) {
        emit(FeaturedBookSuccess(books));
      },
    );
  }
}
