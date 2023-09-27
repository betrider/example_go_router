import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_builder/annotation.dart';

part 'main.router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _counter = 0;

  void _incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

//-------------------------------------------------------------------------------------

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

// extension _StringRouteExt on String {
//   BuildRoute route({
//     GlobalKey<NavigatorState>? parentKey,
//     Set<BuildRoute>? children,
//     Set<String>? parameters,
//     GoRouterRedirect? redirect,
//   }) {
//     return const BuildRoute(
//       this,
//       parentKey: parentKey,
//       children: children,
//       parameters: parameters,
//       redirect: redirect,
//     );
//   }
// }

@GoRouterAnnotation()
const _routes = {
  BuildRoute(
    'home',
    children: {
      BuildRoute('user', parameters: {'id'}), // home/user/123345
      BuildRoute('product'),
    },
    redirect: redirectHome,
  ),
};

FutureOr<String?> redirectHome(BuildContext context, GoRouterState state) {
  return null;
}
