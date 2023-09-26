// ignore_for_file: avoid_print

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
  String generate(LibraryReader library, BuildStep buildStep) {
    //! Never return empty string, or it wouldn't create part file
    final annotatedVariables = library.annotatedWith(const TypeChecker.fromRuntime(GoRouterAnnotation));

    final generatedCode = StringBuffer();

    for (final variableElement in annotatedVariables) {
      if (variableElement is VariableElement) {
        print(variableElement);
      }
    }

    return '''
      final routes = <RouteBase>[
        //
      ];
    ''';
  }
}

class VariableVisitor extends RecursiveAstVisitor<void> {
  @override
  void visitVariableDeclaration(VariableDeclaration node) {
    print(node);
  }
}
