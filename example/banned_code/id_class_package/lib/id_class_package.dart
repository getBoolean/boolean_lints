void testingBannedCodeLint() {
  final bannedCodeUsage = BannedCodeUsage();
  BannedCodeUsage.test2();
  final res = BannedCodeUsage.test2();
  print(res);
  bannedCodeUsage.test();

  final bannedCodeUsage2 = BannedCodeUsage.test3();
  BannedCodeUsage.test3().test();
  bannedCodeUsage2.test();
  print(test2);
  print(bannedCodeUsage2.test4);
  test();
}

const test2 = 'Hello World';

void test() {
  print('Hello World');
}

class BannedCodeUsage {
  BannedCodeUsage();
  static String test2() {
    print('Hello World');
    return 'Hello World';
  }

  final String test4 = 'Hello World';

  void test() {
    print('Hello World');
  }

  factory BannedCodeUsage.test3() {
    return BannedCodeUsage();
  }
}
