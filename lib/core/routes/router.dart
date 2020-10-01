import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:genius_demo/features/index_screen.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    // AdaptiveRoute(page: SplashPage, initial: true),
    CustomRoute(
        page: IndexScreen,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        initial: true)
  ],
)
class $CustomRouter {}
