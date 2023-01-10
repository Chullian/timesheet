// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../screens/home/home_screen.dart' as _i3;
import '../screens/login/login_screen.dart' as _i1;
import '../screens/projectDetail/project_detail_screen.dart' as _i4;
import '../screens/registration/registration_screen.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoginScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginScreen(),
      );
    },
    RegistrationScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.RegistrationScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    ProjectDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectDetailScreenRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.ProjectDetailScreen(
          key: args.key,
          projectId: args.projectId,
        ),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/login',
          fullMatch: true,
        ),
        _i5.RouteConfig(
          LoginScreenRoute.name,
          path: '/login',
        ),
        _i5.RouteConfig(
          RegistrationScreenRoute.name,
          path: '/registration',
        ),
        _i5.RouteConfig(
          HomeScreenRoute.name,
          path: '/home',
        ),
        _i5.RouteConfig(
          ProjectDetailScreenRoute.name,
          path: '/project_details}',
        ),
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginScreenRoute extends _i5.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i2.RegistrationScreen]
class RegistrationScreenRoute extends _i5.PageRouteInfo<void> {
  const RegistrationScreenRoute()
      : super(
          RegistrationScreenRoute.name,
          path: '/registration',
        );

  static const String name = 'RegistrationScreenRoute';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreenRoute extends _i5.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '/home',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i4.ProjectDetailScreen]
class ProjectDetailScreenRoute
    extends _i5.PageRouteInfo<ProjectDetailScreenRouteArgs> {
  ProjectDetailScreenRoute({
    _i6.Key? key,
    required int projectId,
  }) : super(
          ProjectDetailScreenRoute.name,
          path: '/project_details}',
          args: ProjectDetailScreenRouteArgs(
            key: key,
            projectId: projectId,
          ),
        );

  static const String name = 'ProjectDetailScreenRoute';
}

class ProjectDetailScreenRouteArgs {
  const ProjectDetailScreenRouteArgs({
    this.key,
    required this.projectId,
  });

  final _i6.Key? key;

  final int projectId;

  @override
  String toString() {
    return 'ProjectDetailScreenRouteArgs{key: $key, projectId: $projectId}';
  }
}
