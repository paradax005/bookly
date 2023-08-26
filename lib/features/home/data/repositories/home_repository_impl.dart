import 'dart:developer';

import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/typedef.dart';
import 'package:bookly/features/home/data/data_source/local/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl({required this.homeRemoteDataSource, required this.localDataSource});

  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource localDataSource;

  @override
  ResultFuture<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    try {
      List<BookEntity> bookList = [];

      bookList = localDataSource.fetchFeaturedBooks();
      if (bookList.isNotEmpty) {
        return right(bookList);
      }

      bookList = await homeRemoteDataSource.fetchFeaturedBooks();

      return right(bookList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  ResultFuture<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    try {
      List<BookEntity> bookList;

      bookList = localDataSource.fetchNewestBooks();
      if (bookList.isNotEmpty) {
        log("fetch book from local data source");
        return right(bookList);
      }
      bookList = await homeRemoteDataSource.fetchNewestBooks();

      log(bookList[0].title);

      return right(bookList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
