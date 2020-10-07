import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:genius_demo/core/widgets/i_am_awesome_screen.dart';
import 'package:genius_demo/features/index_screen.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    // AdaptiveRoute(page: SplashPage, initial: true),
    CustomRoute(
        page: IndexScreen,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        initial: true),

    CustomRoute(
      page: IAmAwesomeScreen,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    )
  ],
)
class $CustomRouter {}
