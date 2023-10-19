import 'package:boolean_lints/src/lints/banned_code.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

PluginBase createPlugin() => _CustomLintTemplatePlugin();

class _CustomLintTemplatePlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        BannedCodeRule(),
      ];

  @override
  List<Assist> getAssists() => [];
}
