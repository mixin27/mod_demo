import 'package:auto_route/annotations.dart';

import '../features/pages.dart';

@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: PostListingPage, path: '/posts'),
  ],
)
// extend the generated private router
class $AppRouter {}
