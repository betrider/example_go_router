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
      GoRoute(
        path: 'product',
        builder: (context, state) {
          return MyHomePage();
        },
      ),
    ],
  ),
];
//-----------------------------------------
final route = _$root();

class _$root$home$product with _ClassRouteMixin {
  _$root$home$product(
    this._$parent,
  );

  _ClassRouteMixin _$parent;

  @override
  String toString() {
    return _$parent.toString() + "product" + _$queryString;
  }
}

class _$root$home$user$detail with _ClassRouteMixin {
  _$root$home$user$detail(
    this._$parent,
  );

  _ClassRouteMixin _$parent;

  @override
  String toString() {
    return _$parent.toString() + "detail" + _$queryString;
  }
}

class _$root$home$user with _ClassRouteMixin {
  final String __id__;
  _$root$home$user(
    this._$parent, {
    required String id,
  }) : __id__ = id;

  _ClassRouteMixin _$parent;

  @override
  String toString() {
    return _$parent.toString() + "user/${__id__}" + _$queryString;
  }

  _$root$home$user$detail get detail {
    return _$root$home$user$detail(this);
  }
}

class _$root$home with _ClassRouteMixin {
  _$root$home(
    this._$parent,
  );

  _ClassRouteMixin _$parent;

  @override
  String toString() {
    return _$parent.toString() + "home" + _$queryString;
  }

  _$root$home$user user({
    required String id,
  }) {
    return _$root$home$user(
      this,
      id: id,
    );
  }

  _$root$home$product get product {
    return _$root$home$product(this);
  }
}

class _$root with _ClassRouteMixin {
  _$root();

  @override
  String toString() {
    return "/" + _$queryString;
  }

  _$root$home get home {
    return _$root$home(this);
  }
}

//-----------------------------------------
mixin _ClassRouteMixin {
  Map<String, String?> _$queryArgumentsMap = {};
  String get _$queryString => _$queryArgumentsMap.entries.fold(
        "",
        (prev, e) {
          if (e.value != null) {
            final pre = _$queryArgumentsMap.entries.first == e ? "?" : "&";
            return "$prev$pre${e.key}=${e.value}";
          }
          return prev;
        },
      );
}
