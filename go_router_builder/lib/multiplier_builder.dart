import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

Builder multiplier(BuilderOptions options) => SharedPartBuilder([MultiplierGenerator()], 'multiply');

class Multiplier {
  final num value;

  const Multiplier(this.value);
}

class MultiplierGenerator extends GeneratorForAnnotation<Multiplier> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    print('Multiplier builder');
    final numValue = annotation.read('value').literalValue as num;
    return 'num ${element.name}Multiplied() => ${element.name} * $numValue;';
  }
}
