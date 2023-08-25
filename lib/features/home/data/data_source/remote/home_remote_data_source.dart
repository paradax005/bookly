import 'package:bookly/core/api/api_service.dart';
import 'package:bookly/core/utils/constant.dart';
import 'package:bookly/features/home/data/models/BookModel.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();

  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  HomeRemoteDataSourceImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(endPoint: "volumes?Filtering=free-ebooks&q=programming");
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  /* -------------------------------------------------------------- */

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(endPoint: "volumes?Filtering=free-ebooks&Sorting=newest%20&q=programming");
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kNewestBox);
    return books;
  }

  /* -------------------------------------------------------------- */

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data["items"]) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }

  void saveBooksData(List<BookEntity> books, String boxName) {
    var box = Hive.box(boxName);
    box.addAll(books);
  }
}
