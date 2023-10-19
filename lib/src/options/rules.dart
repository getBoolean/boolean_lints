import 'package:boolean_lints/src/options/avoid_hardcoded_strings.dart';
import 'package:boolean_lints/src/options/banned_code.dart';
import 'package:boolean_lints/src/options/custom_lint_example.dart';
import 'package:boolean_lints/src/options/hooks/map_or_list_hook.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'rules.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase, hook: MapOrListHook())
class RulesOption with RulesOptionMappable {
  const RulesOption({
    this.avoidHardcodedStrings = const AvoidHardcodedStringsOption(),
    this.customLintExample = const CustomLintExampleOption(),
    this.bannedCode = const BannedCodeOption(),
  });
  final AvoidHardcodedStringsOption avoidHardcodedStrings;
  final CustomLintExampleOption customLintExample;
  final BannedCodeOption bannedCode;

  static const fromJson = RulesOptionMapper.fromJson;
  static const fromMap = RulesOptionMapper.fromMap;
}
