void testingBannedCodeLint() {
  final bannedCodeUsage = BannedCodeUsage();
  bannedCodeUsage.test();

  // expect_lint: banned_code
  test();
}

void test() {}

class BannedCodeUsage {
  BannedCodeUsage();

  void test() {}
}
