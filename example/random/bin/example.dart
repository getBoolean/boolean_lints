import 'package:example/example.dart' as example;

void main(List<String> arguments) {
  // no_expect_lint: avoid_hardcoded_strings
  final test = 'test';

  // no_expect_lint: avoid_hardcoded_strings
  print('Hello world: $test ${example.calculate()}!');
}
