import 'package:analyzer/error/error.dart';
import 'package:boolean_lints/src/models/excludable.dart';
import 'package:boolean_lints/src/models/hooks/error_severity_hook.dart';
import 'package:boolean_lints/src/models/hooks/map_or_list_hook.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'entry.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase, hook: MapOrListHook())
class BannedCodeEntryOptions extends Excludable
    with BannedCodeEntryOptionsMappable {
  const BannedCodeEntryOptions({
    this.className,
    this.id,
    this.source,
    this.severity,
    this.reason,
    this.includes = const [],
    this.excludes = const [],
  });

  final String? className;

  final String? id;

  final String? source;

  @MappableField(hook: ErrorSeverityHook())
  final ErrorSeverity? severity;
  final String? reason;
  @override
  final List<String> includes;

  @override
  final List<String> excludes;

  static const fromJson = BannedCodeEntryOptionsMapper.fromJson;
  static const fromMap = BannedCodeEntryOptionsMapper.fromMap;
}
