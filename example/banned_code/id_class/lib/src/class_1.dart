class BannedCodeUsage {
  BannedCodeUsage();
  void test() {
    print('Hello World');
  }

  factory BannedCodeUsage.testFactory() {
    // expect_lint: banned_code
    return BannedCodeUsage();
  }
}
