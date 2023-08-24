import 'package:bookly/core/usecase/usecase.dart';
import 'package:bookly/core/utils/typedef.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repositories/home_repository.dart';

class FeaturedBooksUseCase extends UseCase<List<BookEntity>> {
  const FeaturedBooksUseCase(this._repository);

  final HomeRepository _repository;

  @override
  ResultFuture<List<BookEntity>> call() async {
    return await _repository.fetchFeaturedBooks();
  }
}
