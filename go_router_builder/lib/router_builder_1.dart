// ignore_for_file: avoid_print

import 'dart:async';

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'annotation.dart';

Builder router(BuilderOptions options) => LibraryBuilder(
      GoRouterGenerator(),
      generatedExtension: '.router.dart',
    );

class GoRouterGenerator extends Generator {
  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) async {
    final generatedCode = StringBuffer();
    generatedCode.write('''
      final routes = <RouteBase>[
        //
      ];
    ''');
    //! Never return empty string, or it wouldn't create part file
    // find marked variables
    final annotatedVariables = library.annotatedWith(const TypeChecker.fromRuntime(GoRouterAnnotation));
    for (final variable in annotatedVariables) {
      final e = variable.element;
      if (e is TopLevelVariableElement) {
        print(e.computeConstantValue());
      }
    }

    return generatedCode.toString();
  }
}

class VariableVisitor extends RecursiveAstVisitor<void> {
  @override
  void visitVariableDeclaration(VariableDeclaration node) {
    print(node);
  }
}
