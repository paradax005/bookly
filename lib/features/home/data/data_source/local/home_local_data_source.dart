import 'package:bookly/core/utils/constant.dart';
import 'package:bookly/core/utils/functions/get_start_index.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});

  List<BookEntity> fetchNewestBooks({int pageNumber = 0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(kFeaturedBox);

    int startIndex = getStartedIndex(pageNumber);
    int endIndex = (pageNumber + 1) * 10;
    int length = box.values.length;
    if (startIndex >= length || endIndex < length) {
      return [];
    }

    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(kNewestBox);
    int startIndex = getStartedIndex(pageNumber);
    int endIndex = (pageNumber + 1) * 10;
    int length = box.values.length;
    if (startIndex >= length || endIndex < length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
