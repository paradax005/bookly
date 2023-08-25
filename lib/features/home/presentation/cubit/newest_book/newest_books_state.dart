part of 'newest_books_cubit.dart';

@immutable
abstract class NewestBooksState {
  const NewestBooksState();
}

class NewestBooksInitial extends NewestBooksState {
  const NewestBooksInitial();
}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;
  const NewestBooksSuccess(this.books);
}

class NewestBooksFailure extends NewestBooksState {
  const NewestBooksFailure(this.message);
  final String message;
}
