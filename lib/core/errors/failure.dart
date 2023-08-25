import 'package:dio/dio.dart';

abstract class Failure {
  const Failure(this.message);
  final String message;
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!.statusCode!, e.response!.data);
      case DioExceptionType.badCertificate:
        return ServerFailure("Bad certificate");
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection Timeout");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send Timeout");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("receive timeout");
      case DioExceptionType.connectionError:
        return ServerFailure("No Internet Connection");
      default:
        return ServerFailure("Oops, Please Try again Later ");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure("You request was not found !, Please try later");
    } else if (statusCode == 500) {
      return ServerFailure("There is a problem with the server ! Please try later");
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure("There is an error, please try again later");
    }
  }
}
