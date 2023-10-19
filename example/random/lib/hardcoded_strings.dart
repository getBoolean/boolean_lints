// no_expect_lint: avoid_hardcoded_strings
final test = 'test';

void tester() {
  final test2 = 'test'.hardcoded;
  // no_expect_lint: avoid_hardcoded_strings
  final test3 = 'test';
  final test4 = 'abc'.hardcoded;
  // no_expect_lint: avoid_hardcoded_strings
  final test5 = 'test$test4';
  // no_expect_lint: avoid_hardcoded_strings
  final test6 = 'test${test4}test';

  // no_expect_lint: avoid_hardcoded_strings
  final test7 = 'test'
      // no_expect_lint: avoid_hardcoded_strings
      'test2'
      // no_expect_lint: avoid_hardcoded_strings
      'test3';
  // no_expect_lint: avoid_hardcoded_strings
  'test';
  print(test2);
  print(test3);
  print(test4);
  print(test5);
  print(test6);
  print(test7);
}

extension HardcodedString on String {
  String get hardcoded => this;
}
