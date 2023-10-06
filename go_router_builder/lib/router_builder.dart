// ignore_for_file: avoid_print, unused_import

import 'dart:async';

import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:collection/collection.dart';
import 'package:source_gen/source_gen.dart';

import 'annotation.dart';

Builder router(BuilderOptions options) {
  return PartBuilder(
    [GoRouterGenerator()],
    '.router.dart',
    header: '''
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark
    ''',
    options: options,
    allowSyntaxErrors: true,
  );
}

class GoRouterGenerator extends GeneratorForAnnotation<GoRouterAnnotation> {
  // @override
  // FutureOr<String> generate(
  //   LibraryReader library,
  //   BuildStep buildStep,
  // ) async {
  //   print('router generate');
  //   return 'void main() {}';
  // }

  @override
  FutureOr<String> generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    final goRouterGen = StringBuffer();
    final classGen = StringBuffer();
    print('Router builder start -->');
    // final pageType = _getStringArgumentFromAnnotation(annotation, 'pageType');
    if (element is TopLevelVariableElement) {
      final value = element.computeConstantValue();
      final root = value?.toSetValue();
      if (root != null) {
        //
        final goRootName = _getStringArgumentFromAnnotation(annotation, 'goRootArgument');
        goRouterGen.write('final $goRootName = <RouteBase>');
        _writeGoRoutes(root, goRouterGen, childrenSep: ';');
        //
        final rootName = _getStringArgumentFromAnnotation(annotation, 'rootArgument');
        final defRoot = 'root';
        _writeClassRoutes(classGen, childrenNodes: root, path: defRoot);
        _writeStringBufferAtTop(classGen, 'final $rootName = ${_classNameBasedOnPaths(['', defRoot])}();');
      } else {
        //TODO error handling
      }
    } else {
      //TODO error handling
    }

    print('<-- Router builder end.');

    //! Never return empty string, or it wouldn't create part file
    return goRouterGen.toString() + '\n//-----------------------------------------\n' + classGen.toString();
  }

  String _getStringArgumentFromAnnotation(ConstantReader annotation, String argument) {
    return annotation.peek(argument)!.stringValue;
  }

  void _writeGoRoutes(
    Set<DartObject>? children,
    StringBuffer buffer, {
    String childrenSep = ',',
  }) {
    if (children == null) return;
    buffer.write('[');
    for (final element in children) {
      final buildType = element.type?.getDisplayString(withNullability: false);
      assert(
        ['BuildRoute', 'BuildShellRoute'].contains(buildType),
        'BuildRoute or BuildShellRoute class should be use as element.',
      );
      if (buildType == 'BuildRoute') {
        buffer.write('GoRoute(');
        final path = element.getField('path')!.toStringValue();
        final pathArguments = element.getField('pathArguments')?.toSetValue();
        // create path
        buffer.writeAll([
          'path: \'$path',
          if (pathArguments != null) ...pathArguments.map((arg) => '/:${arg.toStringValue()}'),
          '\',',
        ]);
        // create pageBuilder
        //TODO type check
        final pageClassType = element.getField('pageClassType')?.toTypeValue();
        final customPageBuilder = element.getField('customPageBuilder')?.toFunctionValue();
        assert(
          pageClassType != null || customPageBuilder != null,
          'Either pageClassType or customPageBuilder should be used.',
        );
        if (pageClassType != null) {
          final type = pageClassType.getDisplayString(withNullability: false);
          final arguments = element.getField('arguments')?.toSetValue();
          buffer.writeAll([
            'builder: (context, state) {',
            '  return $type(',
            if (pathArguments != null)
              ...pathArguments.map((arg) {
                final argName = arg.toStringValue();
                return '$argName: state.pathParameters[\'$argName\']!';
              }),
            if (arguments != null)
              ...arguments.map((arg) {
                final argName = arg.toStringValue();
                return '$argName: state.uri.queryParameters[\'$argName\']!';
              }),
            '  );',
            '},',
          ]);
        }
        if (customPageBuilder != null) {
          buffer.write('pageBuilder: ${customPageBuilder.displayName},');
        }
        // add options
        final redirect = element.getField('redirect')?.toFunctionValue();
        if (redirect != null) {
          //TODO function arguments check
          buffer.write('redirect: ${redirect.displayName},');
        }
        final parentNavigatorKey = element.getField('parentKey')?.toStringValue();
        if (parentNavigatorKey != null) {
          buffer.write('parentNavigatorKey: $parentNavigatorKey,');
        }
        final name = element.getField('name')?.toStringValue();
        if (name != null) {
          buffer.write('name: $name,');
        }
        // create children
        final childrenNodes = element.getField('routes')?.toSetValue();
        if (childrenNodes != null) {
          buffer.write('routes:');
          _writeGoRoutes(childrenNodes, buffer);
        }
        buffer.write('),');
      }
      if (buildType == 'BuildShellRoute') {
        buffer.write('ShellRoute(');
        // add options
        var pageClassType = element.getField('pageClassType')?.toTypeValue();
        var customPageBuilder = element.getField('customPageBuilder')?.toFunctionValue();
        assert(
          pageClassType != null || customPageBuilder != null,
          'Either pageClassType or customPageBuilder should be used.',
        );
        var parentNavigatorKey = element.getField('parentNavigatorKey')?.toStringValue();
        if (parentNavigatorKey != null) {
          buffer.write('parentNavigatorKey: $parentNavigatorKey,');
        }
        var navigatorKey = element.getField('navigatorKey')?.toStringValue();
        if (parentNavigatorKey != null) {
          buffer.write('navigatorKey: $navigatorKey,');
        }
        // create children
        var childrenNode = element.getField('routes')?.toSetValue();
        if (childrenNode != null) {
          buffer.write('routes:');
          _writeGoRoutes(childrenNode, buffer);
        }
        buffer.write('),');
      }
    }

    buffer.write(']$childrenSep');
  }

  void _writeClassRoutes(
    StringBuffer buffer, {
    Set<DartObject>? childrenNodes,
    Set<DartObject>? pathArguments,
    Set<DartObject>? arguments,
    required String path,
    List<String> parentPath = const [''],
  }) {
    // flatten BuildShellRoute first
    childrenNodes = childrenNodes?.fold<Set<DartObject>>({}, (prev, element) {
      final buildType = element.type?.getDisplayString(withNullability: false);
      if (buildType != null) {
        if (buildType == 'BuildRoute') {
          return prev..add(element);
        }
        if (buildType == 'BuildShellRoute') {
          final children = element.getField('routes')?.toSetValue();
          if (children != null) {
            return prev..addAll(children);
          }
          return prev..add(element);
        }
      }
      return prev;
    });
    //TODO check duplicate paths
    //TODO [path] format check
    final className = _classNameBasedOnPaths([...parentPath, path]);
    final classBuffer = StringBuffer();
    classBuffer.write('class $className {');
    final argumentBuffer = StringBuffer();
    // declare arguments
    argumentBuffer.writeAll([
      if (pathArguments.hasElement) ...pathArguments!.map((e) => 'final String ${e.toStringValue()};'),
      if (arguments.hasElement) ...arguments!.map((e) => 'final String? ${e.toStringValue()};'),
    ]);
    // create init
    if (argumentBuffer.isNotEmpty) {
      argumentBuffer.writeAll([
        '$className({',
        if (pathArguments.hasElement) ...pathArguments!.map((e) => 'required this.${e.toStringValue()},'),
        if (arguments.hasElement) ...arguments!.map((e) => 'this.${e.toStringValue()},'),
        '});',
      ]);
    }
    classBuffer.write(argumentBuffer.toString());
    // add toString()
    // exclude /root from parentPath
    var modifiedPaths = [...parentPath];
    if (modifiedPaths.length > 1) {
      modifiedPaths..removeAt(1);
    }
    final strElements = [
      ...modifiedPaths,
      path,
      ...(pathArguments ?? {}).map((e) => "\$${e.toStringValue()}"),
      // ...(arguments ?? {}).mapIndexed((i, e) => "${(i == 0) ? '?' : '&'}${e.toStringValue()}=\$${e.toStringValue()}"),
    ];
    classBuffer.writeAll([
      '@override\n',
      'String toString() {',
      ' return "${strElements.join("/")}";',
      '}',
    ]);
    //
    if (childrenNodes == null) {
      // leaf node
      classBuffer.write('}');
      _writeStringBufferAtTop(buffer, classBuffer.toString());
      return;
    }
    for (var child in childrenNodes) {
      final pathArguments = child.getField('pathArguments')?.toSetValue();
      final arguments = child.getField('arguments')?.toSetValue();
      final childPath = child.getField('path')?.toStringValue();
      if (childPath != null) {
        if (pathArguments.hasElement || arguments.hasElement) {
          classBuffer.write('final $path = ${_classNameBasedOnPaths([...parentPath, path, childPath])}.new;');
        } else {
          classBuffer.write('final $path = ${_classNameBasedOnPaths([...parentPath, path, childPath])}();');
        }
        //
        final children = child.getField('routes')?.toSetValue();
        _writeClassRoutes(
          buffer,
          childrenNodes: children,
          path: childPath,
          parentPath: [...parentPath, path],
          pathArguments: pathArguments,
          arguments: arguments,
        );
      }
    }
    classBuffer.write('}');
    buffer.write(classBuffer.toString());
  }

  String _classNameBasedOnPaths(List<String> paths) => '_' + paths.join('\$');

  void _writeStringBufferAtTop(StringBuffer buffer, String str) {
    final old = buffer.toString();
    buffer.clear();
    buffer.writeAll([str, old]);
  }
}

extension on Set? {
  bool get hasElement => this?.isNotEmpty == true;
}

// class _Visitor extends SimpleElementVisitor<void> {
//   _Visitor() {
//     print('init visitor');
//   }

//   @override
//   void visitTopLevelVariableElement(TopLevelVariableElement element) {
//     print(element);
//   }
// }

/// LibraryBuilder example
// Builder router(BuilderOptions options) => LibraryBuilder(
//       GoRouterGenerator(),
//       generatedExtension: '.router.dart',
//     );

// class GoRouterGenerator extends Generator {
//   @override
//   FutureOr<String> generate(LibraryReader library, BuildStep buildStep) async {
//     final generatedCode = StringBuffer();
//     generatedCode.write('''
//       final routes = <RouteBase>[
//         //
//       ];
//     ''');
//     //! Never return empty string, or it wouldn't create part file
//     // find marked variables
//     final annotatedVariables = library.annotatedWith(const TypeChecker.fromRuntime(GoRouterAnnotation));
//     for (final variable in annotatedVariables) {
//       final e = variable.element;
//       if (e is TopLevelVariableElement) {
//         print(e.computeConstantValue());
//       }
//     }

//     return generatedCode.toString();
//   }
// }

// class VariableVisitor extends RecursiveAstVisitor<void> {
//   @override
//   void visitVariableDeclaration(VariableDeclaration node) {
//     print(node);
//   }
// }
