part of 'featured_book_cubit.dart';

@immutable
abstract class FeaturedBookState {
  const FeaturedBookState();
}

class FeaturedBookInitial extends FeaturedBookState {
  const FeaturedBookInitial();
}

class FeaturedBookLoading extends FeaturedBookState {}

class FeaturedBookPaginationLoading extends FeaturedBookState {}

class FeaturedBookPaginationFailure extends FeaturedBookState {
  const FeaturedBookPaginationFailure(this.message);
  final String message;
}

class FeaturedBookSuccess extends FeaturedBookState {
  final List<BookEntity> books;
  const FeaturedBookSuccess(this.books);
}

class FeaturedBookFailure extends FeaturedBookState {
  const FeaturedBookFailure(this.message);
  final String message;
}
