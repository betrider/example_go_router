class GoRouterAnnotation {
  final String goRootArgument;
  final String rootArgument;
  const GoRouterAnnotation({
    this.goRootArgument = 'router',
    this.rootArgument = 'route',
  });
}

abstract class _BuildRoute {
  const _BuildRoute();
}

class BuildRoute extends _BuildRoute {
  final String path;
  final String? name;
  final Set<String>? pathArguments;
  final Set<String>? arguments;
  final Function? redirect;
  final Type? pageClassType;
  final Function? pageBuilder;
  final Set<_BuildRoute>? routes;
  final String? parentNavigatorKey;
  final bool extra;

  const BuildRoute(
    this.path, {
    this.name,
    this.parentNavigatorKey,
    this.redirect,
    this.pathArguments,
    this.arguments,
    this.routes,
    this.pageClassType,
    this.pageBuilder,
    this.extra = false,
  });
}

class BuildShellRoute extends _BuildRoute {
  final String? navigatorKey;
  //
  final Type? pageClassType;
  final String? customPageBuilder;
  final Set<_BuildRoute>? routes;
  final String? parentNavigatorKey;

  const BuildShellRoute({
    required this.routes,
    this.parentNavigatorKey,
    this.navigatorKey,
    this.pageClassType,
    this.customPageBuilder,
  });
}
