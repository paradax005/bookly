import 'package:bookly/core/api/api_service.dart';
import 'package:bookly/features/home/data/data_source/local/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:bookly/features/home/data/repositories/home_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // API SERVICE
  getIt.registerSingleton<ApiService>(
    ApiService(Dio()),
  );
  // HOME REPOS IMPL
  getIt.registerSingleton<HomeRepositoryImpl>(
    HomeRepositoryImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
      localDataSource: HomeLocalDataSourceImpl(),
    ),
  );
}
