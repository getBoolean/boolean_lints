import 'package:analyzer/error/listener.dart';
import 'package:boolean_lints/src/lints/fixes/fix_example.dart';
import 'package:boolean_lints/src/options.dart';
import 'package:boolean_lints/src/options_plugin_base.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class CustomLintExampleRule extends OptionsLintRule {
  CustomLintExampleRule() : super(code: _code);

  static const _code = LintCode(
    name: 'custom_lint_example',
    problemMessage: 'This is the description of our custom lint',
  );

  @override
  Future<void> runWithOptions(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
    Options options,
  ) async {
    if (options.rules.customLintExample.shouldSkipFile(resolver.path)) {
      return;
    }

    final severity = options.rules.customLintExample.severity;
    final code = this.code.copyWith(errorSeverity: severity);
    context.registry.addVariableDeclaration((node) {
      // TODO: Check if the error should be reported
      reporter.reportErrorForNode(code, node);
    });
  }

  @override
  List<Fix> getFixes() => [FixExampleFix()];
}
