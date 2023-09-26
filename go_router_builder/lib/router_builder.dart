// ignore_for_file: avoid_print

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
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
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final visitor = _Visitor();

    print('Router builder start -->');
    //TODO: type check here
    element.accept(visitor);
    print('<-- Router builder end.');
    //! Never return empty string, or it wouldn't create part file
    return '''
      final routes = <RouteBase>[
        //
      ];
    ''';
  }

  String getClassNameFromAnnotation(ConstantReader annotation) {
    final typeValue = annotation.peek("type");
    final dartType = typeValue?.typeValue;
    if (dartType != null) {
      return dartType.getDisplayString(withNullability: false);
    }

    return ''; // Return an empty string if the class name is not found
  }
}

class _Visitor extends SimpleElementVisitor<void> {
  _Visitor() {
    print('init visitor');
  }

  @override
  void visitTopLevelVariableElement(TopLevelVariableElement element) {
    print(element);
  }
}
