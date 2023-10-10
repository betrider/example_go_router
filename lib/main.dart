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
      home: const MyHomePage(id: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String? id;
  const MyHomePage({super.key, this.id});

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
        title: Text(widget.id ?? ""),
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

@GoRouterAnnotation()
// ignore: unused_element
const _routes = {
  BuildRoute(
    'home',
    pageClassType: MyHomePage,
    routes: {
      BuildRoute(
        'user',
        pathArguments: {'id'},
        pageClassType: MyHomePage,
        routes: {
          BuildRoute(
            Routes.detail,
            pageClassType: MyHomePage,
          ),
        },
      ),
      BuildRoute(
        'product',
        pageClassType: MyHomePage,
      ),
      // BuildShellRoute(
      //   pageClassType: MyHomePage,
      //   routes: {
      //     BuildRoute(
      //       'user1',
      //       pathArguments: {'id'},
      //       pageClassType: MyHomePage,
      //     ),
      //     BuildRoute(
      //       'product1',
      //       pageClassType: MyHomePage,
      //     ),
      //   },
      // ),
    },
    redirect: redirectHome,
  ),
};

FutureOr<String?> redirectHome(BuildContext context, GoRouterState state) {
  return null;
}

void xxx() {
  route.home.user(id: '').detail.toString();
  // route.home.product.toString();
}
