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
          return MyHomePage(
            id: state.pathParameters['id']!,
            extra: state.extra,
          );
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
        path: 'product/:id/:type',
        builder: (context, state) {
          return MyProduct(
            id: state.pathParameters['id']!,
            type: state.pathParameters['type']!,
            view: state.uri.queryParameters['view']!,
            name: state.uri.queryParameters['name']!,
            title: state.uri.queryParameters['title']!,
          );
        },
        routes: [
          GoRoute(
            path: 'puser/:id',
            builder: (context, state) {
              return MyHomePage(
                id: state.pathParameters['id']!,
              );
            },
          ),
        ],
      ),
      ShellRoute(
        routes: [
          GoRoute(
            path: 'user1/:id',
            builder: (context, state) {
              return MyHomePage(
                id: state.pathParameters['id']!,
              );
            },
          ),
          GoRoute(
            path: 'product1',
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
final airoute = _$root();

class _$root$home$product1 with _ClassRouteMixin {
  _$root$home$product1(
    this._$parent,
  );
  _ClassRouteMixin _$parent;

  @override
  String toString() {
    return _$parent.toString() + "/" + "product1" + _$queryString;
  }
}

class _$root$home$user1 with _ClassRouteMixin {
  final String __id__;
  _$root$home$user1(
    this._$parent, {
    required String id,
  }) : __id__ = id;
  _ClassRouteMixin _$parent;

  @override
  String toString() {
    return _$parent.toString() + "/" + "user1/${__id__}" + _$queryString;
  }
}

class _$root$home$product$puser with _ClassRouteMixin {
  final String __id__;
  _$root$home$product$puser(
    this._$parent, {
    required String id,
  }) : __id__ = id;
  _ClassRouteMixin _$parent;

  @override
  String toString() {
    return _$parent.toString() + "/" + "puser/${__id__}" + _$queryString;
  }
}

class _$root$home$user$detail with _ClassRouteMixin {
  _$root$home$user$detail(
    this._$parent,
  );
  _ClassRouteMixin _$parent;

  @override
  String toString() {
    return _$parent.toString() + "/" + "detail" + _$queryString;
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
    return _$parent.toString() + "/" + "user/${__id__}" + _$queryString;
  }

  _$root$home$user$detail get detail {
    return _$root$home$user$detail(this);
  }
}

class _$root$home$product with _ClassRouteMixin {
  final String __id__;
  final String __type__;
  final String? __view__;
  final String? __name__;
  final String? __title__;
  @override
  late Map<String, String?> _$queryArgumentsMap = {
    "view": __view__,
    "name": __name__,
    "title": __title__,
  };
  _$root$home$product(
    this._$parent, {
    required String id,
    required String type,
    String? view,
    String? name,
    String? title,
  })  : __id__ = id,
        __type__ = type,
        __view__ = view,
        __name__ = name,
        __title__ = title;
  _ClassRouteMixin _$parent;

  @override
  String toString() {
    return _$parent.toString() +
        "/" +
        "product/${__id__}/${__type__}" +
        _$queryString;
  }

  _$root$home$product$puser puser({
    required String id,
  }) {
    return _$root$home$product$puser(
      this,
      id: id,
    );
  }
}

class _$root$home with _ClassRouteMixin {
  _$root$home(
    this._$parent,
  );
  _ClassRouteMixin _$parent;

  @override
  String toString() {
    return _$parent.toString() + "/" + "home" + _$queryString;
  }

  _$root$home$user user({
    required String id,
  }) {
    return _$root$home$user(
      this,
      id: id,
    );
  }

  _$root$home$product product({
    required String id,
    required String type,
    String? view,
    String? name,
    String? title,
  }) {
    return _$root$home$product(
      this,
      id: id,
      type: type,
      view: view,
      name: name,
      title: title,
    );
  }

  _$root$home$user1 user1({
    required String id,
  }) {
    return _$root$home$user1(
      this,
      id: id,
    );
  }

  _$root$home$product1 get product1 {
    return _$root$home$product1(this);
  }
}

class _$root with _ClassRouteMixin {
  _$root();

  @override
  String toString() {
    return "" + _$queryString;
  }

  _$root$home get home {
    return _$root$home(this);
  }
}

//-----------------------------------------
mixin _ClassRouteMixin {
  late Map<String, String?> _$queryArgumentsMap = {};
  String get _$queryString => _$queryArgumentsMap.entries.fold(
        "",
        (prev, e) {
          if (e.value != null) {
            final pre =
                _$queryArgumentsMap.entries.first.key == e.key ? "?" : "&";
            return "$prev$pre${e.key}=${e.value}";
          }
          return prev;
        },
      );
}
