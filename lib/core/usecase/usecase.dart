import 'package:bookly/core/utils/typedef.dart';

abstract class UseCase<T> {
  const UseCase();
  ResultFuture<T> call();
}
