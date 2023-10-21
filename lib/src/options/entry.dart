import 'package:analyzer/error/error.dart';
import 'package:boolean_lints/src/options/hooks/error_severity_hook.dart';
import 'package:boolean_lints/src/options/hooks/map_or_list_hook.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'entry.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase, hook: MapOrListHook())
class EntryOption with EntryOptionMappable {
  const EntryOption({
    this.className,
    this.id,
    this.source,
    this.severity,
    this.reason,
  });

  final String? className;

  final String? id;

  final String? source;

  @MappableField(hook: ErrorSeverityHook())
  final ErrorSeverity? severity;
  final String? reason;

  static const fromJson = EntryOptionMapper.fromJson;
  static const fromMap = EntryOptionMapper.fromMap;
}
