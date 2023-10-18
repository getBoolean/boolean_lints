import 'package:example/hardcoded_strings.dart';

void testingBannedCodeLint() {
  final bannedCodeUsage = BannedCodeUsage();
  BannedCodeUsage.test2();
  final res = BannedCodeUsage.test2();
  print(res);
  bannedCodeUsage.test();

  final bannedCodeUsage2 = BannedCodeUsage.test3();
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
