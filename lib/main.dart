import 'package:bookly/config/theme/theme.dart';
import 'package:bookly/core/utils/bloc_observer.dart';
import 'package:bookly/core/utils/constant.dart';
import 'package:bookly/features/home/data/repositories/home_repository_impl.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/usecase/featured_books_usecase.dart';
import 'package:bookly/features/home/domain/usecase/newest_books_usecase.dart';
import 'package:bookly/features/home/presentation/cubit/featured_book/featured_book_cubit.dart';
import 'package:bookly/features/home/presentation/cubit/newest_book/newest_books_cubit.dart';
import 'package:bookly/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

import 'config/routes/routes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());

  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();

  await Hive.openBox<BookEntity>(kFeaturedBox);

  await Hive.openBox<BookEntity>(kNewestBox);
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => FeaturedBookCubit(
                FeaturedBooksUseCase(
                  getIt.get<HomeRepositoryImpl>(),
                ),
              )..fetchFeaturedBooks(),
            ),
            BlocProvider(
              create: (context) => NewestBooksCubit(
                NewestBooksUseCase(
                  getIt.get<HomeRepositoryImpl>(),
                ),
              )..fetchNewestBooks(),
            ),
          ],
          child: MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            theme: theme(),
          ),
        );
      },
    );
  }
}
