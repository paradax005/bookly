import 'package:bookly/config/routes/names.dart';
import 'package:bookly/features/home/presentation/views/book_detail_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/home_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: RoutesName.HOME,
        builder: (context, state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: RoutesName.BOOK_DETAIL,
        builder: (context, state) {
          return const BookDetailView();
        },
      )
    ],
  );
}
