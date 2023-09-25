import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

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

class GoRouterAnnotation {
  const GoRouterAnnotation();
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
    for (var e in element.children) {
      // e.accept(visitor);
      e.visitChildren(visitor);
    }
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

class _Visitor extends RecursiveElementVisitor<void> {
  _Visitor() {
    print('init visitor');
  }

  @override
  void visitAugmentationImportElement(AugmentationImportElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitClassElement(ClassElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitCompilationUnitElement(CompilationUnitElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitConstructorElement(ConstructorElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitEnumElement(EnumElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitExtensionElement(ExtensionElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitExtensionTypeElement(ExtensionTypeElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitFieldElement(FieldElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitFieldFormalParameterElement(FieldFormalParameterElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitFunctionElement(FunctionElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitGenericFunctionTypeElement(GenericFunctionTypeElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitLabelElement(LabelElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitLibraryAugmentationElement(LibraryAugmentationElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitLibraryElement(LibraryElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitLibraryExportElement(LibraryExportElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitLibraryImportElement(LibraryImportElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitLocalVariableElement(LocalVariableElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitMethodElement(MethodElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitMixinElement(MixinElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitMultiplyDefinedElement(MultiplyDefinedElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitParameterElement(ParameterElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitPartElement(PartElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitPrefixElement(PrefixElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitPropertyAccessorElement(PropertyAccessorElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitSuperFormalParameterElement(SuperFormalParameterElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitTopLevelVariableElement(TopLevelVariableElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitTypeAliasElement(TypeAliasElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }

  @override
  void visitTypeParameterElement(TypeParameterElement element) {
    print(element.name);
    element.visitChildren(this);
    return;
  }
}
