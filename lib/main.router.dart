// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

final router = <RouteBase>[
  GoRoute(
    path: 'home',
    builder: (context, state) {
      return MyHomePage();
    },
    redirect: redirectHome,
    routes: [
      GoRoute(
        path: 'user/:id',
        builder: (context, state) {
          return MyHomePage(id: state.pathParameters['id']!);
        },
        routes: [
          GoRoute(
            path: 'detail',
            builder: (context, state) {
              return MyHomePage();
            },
          ),
        ],
      ),
    ],
  ),
];
//-----------------------------------------
final route = _$root();

class _$root$home$user$detail {
  @override
  String toString() {
    return "/home/user/detail";
  }
}

class _$root$home$user {
  final String id;
  _$root$home$user({
    required this.id,
  });
  @override
  String toString() {
    return "/home/user/$id";
  }

  final user = _$root$home$user$detail();
}

class _$root$home {
  @override
  String toString() {
    return "/home";
  }

  final home = _$root$home$user.new;
}

class _$root {
  @override
  String toString() {
    return "/root";
  }

  final root = _$root$home();
}
