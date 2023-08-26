import 'package:bookly/core/utils/typedef.dart';

abstract class UseCase<T, Param> {
  const UseCase();
  ResultFuture<T> call([Param param]);
}
