import 'package:analyzer/error/listener.dart';
import 'package:boolean_lints/src/lints/custom_lint_example/fixes/custom_lint_example_fix.dart';
import 'package:boolean_lints/src/lints/custom_lint_example/models/custom_lint_example_options.dart';
import 'package:boolean_lints/src/models/options_lint_rule.dart';
import 'package:boolean_lints/src/models/rule_config.dart';
import 'package:boolean_lints/src/utils/extensions.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class CustomLintExampleRule extends OptionsLintRule<CustomLintExampleOptions> {
  /// Creates a new instance of [OptionsLintRule]
  /// based on the lint configuration.
  CustomLintExampleRule(
    CustomLintConfigs configs,
  ) : super(RuleConfig(
          configs: configs,
          name: lintName,
          paramsParser: CustomLintExampleOptions.fromMap,
          problemMessage: (_) => 'This is the description of our custom lint',
        ));

  /// The [LintCode] of this lint rule
  static const String lintName = 'custom_lint_example';

  @override
  Future<void> run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) async {
    final rootPath = await resolver.rootPath;
    final parameters = config.parameters;
    if (parameters.shouldSkipAnalysis(
      path: resolver.path,
      rootPath: rootPath,
    )) {
      return;
    }

    final code = this.code.copyWith(
          errorSeverity: parameters.severity ?? this.code.errorSeverity,
        );
    context.registry.addVariableDeclaration((node) {
      // TODO: Check if the error should be reported
      reporter.reportErrorForNode(code, node);
    });
  }

  @override
  List<Fix> getFixes() => [CustomLintExampleFix(config)];
}
