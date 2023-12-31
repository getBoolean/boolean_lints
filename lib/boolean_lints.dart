/// Contains the entrypoint of the plugin for use by [custom_lint](https://pub.dev/packages/custom_lint).
library;

import 'package:boolean_lints/src/lints/banned_external_code/banned_code_rule.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

/// This is the entry point of the plugin.
PluginBase createPlugin() => _CustomLintTemplatePlugin();

class _CustomLintTemplatePlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        BannedCodeRule(configs),
      ];

  @override
  List<Assist> getAssists() => [];
}
