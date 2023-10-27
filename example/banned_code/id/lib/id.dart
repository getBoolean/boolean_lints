void testingBannedCodeLint() {
  final bannedCodeUsage = BannedCodeUsage();
  bannedCodeUsage.test();

  final bannedCodeUsage2 = BannedCodeUsage.test3();
  BannedCodeUsage.test3().test();
  bannedCodeUsage2.test();
  print(test2);

  // expect_lint: banned_code
  test();
}

const test2 = 'Hello World';

void test() {
  print('Hello World');
}

class BannedCodeUsage {
  BannedCodeUsage();

  void test() {
    print('Hello World');
  }

  factory BannedCodeUsage.test3() {
    return BannedCodeUsage();
  }
}