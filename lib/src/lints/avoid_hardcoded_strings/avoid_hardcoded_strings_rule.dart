import 'package:analyzer/error/listener.dart';
import 'package:boolean_lints/src/lints/avoid_hardcoded_strings/fixes/avoid_hardcoded_strings_fix.dart';
import 'package:boolean_lints/src/lints/avoid_hardcoded_strings/models/avoid_hardcoded_strings_options.dart';
import 'package:boolean_lints/src/models/options_lint_rule.dart';
import 'package:boolean_lints/src/models/rule_config.dart';
import 'package:boolean_lints/src/utils/extensions.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class AvoidHardcodedStringsRule
    extends OptionsLintRule<AvoidHardcodedStringsOptions> {
  /// Creates a new instance of [AvoidHardcodedStringsRule]
  /// based on the lint configuration.
  AvoidHardcodedStringsRule(
    CustomLintConfigs configs,
  ) : super(RuleConfig(
          configs: configs,
          name: lintName,
          paramsParser: AvoidHardcodedStringsOptions.fromMap,
          problemMessage: (_) =>
              'Avoid hardcoding strings. Use a localization package or append ".hardcoded" to the string to suppress this message.',
        ));

  /// The [LintCode] of this lint rule
  static const String lintName = 'avoid_hardcoded_strings';

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

    final minimumLength = parameters.minimumLength;
    final code = this.code.copyWith(
          errorSeverity: parameters.severity ?? this.code.errorSeverity,
        );

    context.registry.addSimpleStringLiteral((node) {
      if (node.value.length <= minimumLength) {
        return;
      }

      // ignore import statements
      if (node.parent?.toSource().startsWith('import') ?? false) {
        return;
      }

      // ignore if ".hardcoded" is appended after the string
      if (node.parent?.toSource().endsWith('.hardcoded') ?? false) {
        return;
      }
      reporter.reportErrorForNode(code, node);
    });

    context.registry.addInterpolationString((node) {
      if (node.value.length <= minimumLength) {
        return;
      }

      // ignore if ".hardcoded" is appended after the string
      if (node.parent?.parent?.toSource().endsWith('.hardcoded') ?? false) {
        return;
      }
      reporter.reportErrorForNode(code, node.parent ?? node);
    });
  }

  @override
  List<Fix> getFixes() => [
        AvoidHardcodedStringsFix(config),
      ];
}
