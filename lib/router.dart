// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_builder/annotation.dart';

// part 'router.router.dart';

// final router = _R();

// typedef _RouterElementFunc<T extends _RouterElement> = T Function([String?]);

// abstract class _RouterElement {}

// extension on Type {}

// class _R {
//   _Home home([String? param]) => _Home();

//   final chat = _RouterElementFunc<_Chat>;
//   final alarm = _RouterElementFunc<_Alarm>;

//   List<_RouterElementFunc> equatable() => [home];
// }

// class _Home extends _RouterElement {
//   _Detail detail() => _Detail();
// }

// class _Chat extends _RouterElement {
//   _Home list() => _Home();
// }

// class _Alarm extends _RouterElement {
//   _Home list() => _Home();
// }

// class _Detail extends _RouterElement {}

class Routes {
  static const String list = 'list';
  static const String detail = 'detail';
  static const String create = 'create';
  static const String update = 'update';
}

class BuildRoute {
  final String path;
  final GlobalKey<NavigatorState>? parentKey;
  final Set<BuildRoute>? children;
  final Set<String>? parameters;
  final GoRouterRedirect? redirect;
  const BuildRoute(
    this.path, {
    this.parentKey,
    this.redirect,
    this.parameters,
    this.children,
  });
}

extension _StringRouteExt on String {
  BuildRoute route({
    GlobalKey<NavigatorState>? parentKey,
    Set<BuildRoute>? children,
    Set<String>? parameters,
    GoRouterRedirect? redirect,
  }) {
    return BuildRoute(
      this,
      parentKey: parentKey,
      children: children,
      parameters: parameters,
      redirect: redirect,
    );
  }
}

@GoRouterAnnotation()
final _routes = {
  'home'.route(children: {
    'user'.route(parameters: {'id'}),
    'product'.route(),
  }),
  'login'.route(children: {
    //
  }),
  // _Route(
  //   'home',
  //   children: {
  //     _Route('user', parameters: {'id'}), // home/user/123345
  //     _Route('product'),
  //   },
  // ),
};
