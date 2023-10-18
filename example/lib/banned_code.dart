import 'package:example/hardcoded_strings.dart';

void testingBannedCodeLint() {
  final bannedCodeUsage = BannedCodeUsage();
  // expect_lint: banned_code
  BannedCodeUsage.test2();
  // expect_lint: banned_code
  final res = BannedCodeUsage.test2();
  print(res);
  // expect_lint: banned_code
  bannedCodeUsage.test();

  // expect_lint: banned_code
  final bannedCodeUsage2 = BannedCodeUsage.test3();
  // expect_lint: banned_code
  bannedCodeUsage2.test();
}

class BannedCodeUsage {
  BannedCodeUsage();
  static String test2() {
    print('Hello World'.hardcoded);
    return 'Hello World'.hardcoded;
  }

  void test() {
    print('Hello World'.hardcoded);
  }

  factory BannedCodeUsage.test3() {
    return BannedCodeUsage();
  }
}
