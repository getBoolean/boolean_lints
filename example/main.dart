/// Example Lint Configuration:
///
/// ```yaml
/// boolean_lints:
///  rules:
///    banned_code:
///      # Default severity for all entries
///      severity: warning
///      entries:
///        - id: test
///          class_name: BannedCodeUsage
///          source: package:example
///          reason: "BannedCodeUsage.test from the example package is not allowed"
///          severity: error
/// ```
void main(List<String> arguments) {
  final bannedCodeUsage = BannedCodeUsage(); // OK
  BannedCodeUsage.test2(); // OK
  bannedCodeUsage.test(); // LINT

  final bannedCodeUsage2 = BannedCodeUsage.test3(); // OK
  BannedCodeUsage.test3().test(); // LINT
  bannedCodeUsage2.test(); // LINT
  print(bannedCodeUsage2.test4); // OK
}

class BannedCodeUsage {
  BannedCodeUsage();

  factory BannedCodeUsage.test3() {
    return BannedCodeUsage();
  }
  static String test2() {
    print('Hello World');
    return 'Hello World';
  }

  final String test4 = 'Hello World';

  void test() {
    // OK
    print('Hello World');
  }
}
