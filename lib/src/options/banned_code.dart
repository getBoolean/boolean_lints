import 'package:analyzer/error/error.dart';
import 'package:boolean_lints/src/options.dart';
import 'package:boolean_lints/src/options/entry.dart';
import 'package:boolean_lints/src/options/hooks/error_severity_hook.dart';
import 'package:boolean_lints/src/options/hooks/map_or_list_hook.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'banned_code.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase, hook: MapOrListHook())
class BannedCodeOption with BannedCodeOptionMappable, OptionsMixin {
  const BannedCodeOption({
    this.entries = const [],
    this.exclude = const [],
    this.include = const [],
    this.severity,
  });

  final List<EntryOption> entries;

  @override
  final List<String> exclude;

  @override
  final List<String> include;

  @MappableField(hook: ErrorSeverityHook())
  final ErrorSeverity? severity;

  static const fromJson = BannedCodeOptionMapper.fromJson;
  static const fromMap = BannedCodeOptionMapper.fromMap;
}
