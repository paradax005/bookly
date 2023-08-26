import 'package:bookly/core/utils/typedef.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class HomeRepository {
  ResultFuture<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});

  ResultFuture<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
}
