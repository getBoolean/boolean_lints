import 'package:analyzer/error/listener.dart';
import 'package:boolean_lints/src/lints/banned_external_code/banned_code_linter.dart';
import 'package:boolean_lints/src/lints/banned_external_code/models/banned_code_options.dart';
import 'package:boolean_lints/src/lints/banned_external_code/models/entry.dart';
import 'package:boolean_lints/src/models/options_lint_rule.dart';
import 'package:boolean_lints/src/models/rule_config.dart';
import 'package:boolean_lints/src/utils/extensions.dart';
import 'package:boolean_lints/src/utils/path_utils.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class BannedCodeRule extends OptionsLintRule<BannedCodeOptions> {
  /// Creates a new instance of [BannedCodeRule]
  /// based on the lint configuration.
  BannedCodeRule(
    CustomLintConfigs configs,
  ) : super(RuleConfig(
          configs: configs,
          name: lintName,
          paramsParser: BannedCodeOptions.fromMap,
          problemMessage: (_) =>
              'Usage of this has been discouraged by your project.',
        ));

  /// The [LintCode] of this lint rule
  static const String lintName = 'banned_code';

  @override
  Future<void> run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) async {
    final rootPath = (await resolver.getResolvedUnitResult())
        .session
        .analysisContext
        .contextRoot
        .root
        .path;
    final linter = BannedCodeLinter(
      resolver: resolver,
      reporter: reporter,
      context: context,
      config: config,
    );

    final parameters = config.parameters;
    for (final entry in parameters.entries) {
      if (shouldSkipFile(
        includeGlobs: entry.includes,
        excludeGlobs: entry.excludes,
        path: resolver.path,
        rootPath: rootPath,
      )) {
        continue;
      }

      final entryCode = super.code.copyWith(
            errorSeverity: entry.severity ??
                parameters.severity ??
                super.code.errorSeverity,
            problemMessage: entry.reason,
          );

      switch (entry) {
        case BannedCodeEntryOptions(
            :final id?,
            :final className?,
            :final source?
          ):
          linter.banIdFromClassFromSource(entryCode, id, className, source);
        case BannedCodeEntryOptions(:final className?, :final source?):
          linter.banClassFromSource(entryCode, className, source);
        case BannedCodeEntryOptions(:final id?, :final className?):
          linter.banIdFromClass(entryCode, id, className);
        case BannedCodeEntryOptions(:final id?, :final source?):
          linter.banIdFromSource(entryCode, id, source);
        case BannedCodeEntryOptions(:final source?):
          linter.banSource(entryCode, source);
        case BannedCodeEntryOptions(:final className?):
          linter.banClass(entryCode, className);
        case BannedCodeEntryOptions(:final id?):
          linter.banId(entryCode, id);
        case BannedCodeEntryOptions():
          break;
      }
    }
  }
}
