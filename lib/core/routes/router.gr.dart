// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/index_screen.dart';
import '../widgets/i_am_awesome_screen.dart';

class Routes {
  static const String indexScreen = '/';
  static const String iAmAwesomeScreen = '/i-am-awesome-screen';
  static const all = <String>{
    indexScreen,
    iAmAwesomeScreen,
  };
}

class CustomRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.indexScreen, page: IndexScreen),
    RouteDef(Routes.iAmAwesomeScreen, page: IAmAwesomeScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    IndexScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => IndexScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      );
    },
    IAmAwesomeScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            IAmAwesomeScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension CustomRouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushIndexScreen() => push<dynamic>(Routes.indexScreen);

  Future<dynamic> pushIAmAwesomeScreen() =>
      push<dynamic>(Routes.iAmAwesomeScreen);
}
