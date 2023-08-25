import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/usecase/newest_books_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.newestBooksUseCase) : super(const NewestBooksInitial());

  final NewestBooksUseCase newestBooksUseCase;
  Future<void> fetchFeaturedBooks() async {
    emit(NewestBooksLoading());

    var result = await newestBooksUseCase.call();
    result.fold(
      (failure) {
        emit(NewestBooksFailure(failure.message));
      },
      (books) {
        emit(NewestBooksSuccess(books));
      },
    );
  }
}
