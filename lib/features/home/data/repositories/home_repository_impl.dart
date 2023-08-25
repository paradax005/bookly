import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/typedef.dart';
import 'package:bookly/features/home/data/data_source/local/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl({required this.homeRemoteDataSource, required this.localDataSource});

  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource localDataSource;

  @override
  ResultFuture<List<BookEntity>> fetchFeaturedBooks() async {
    try {
      List<BookEntity> bookList;
      bookList = localDataSource.fetchFeaturedBooks();
      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      bookList = await homeRemoteDataSource.fetchFeaturedBooks();

      return right(bookList);
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  ResultFuture<List<BookEntity>> fetchNewestBooks() async {
    try {
      List<BookEntity> bookList;

      bookList = localDataSource.fetchNewestBooks();
      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      bookList = await homeRemoteDataSource.fetchNewestBooks();

      return right(bookList);
    } catch (e) {
      return left(Failure());
    }
  }
}
