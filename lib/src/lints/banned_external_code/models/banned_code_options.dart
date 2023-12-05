import 'package:analyzer/error/error.dart';
import 'package:boolean_lints/src/lints/banned_external_code/models/entry.dart';
import 'package:boolean_lints/src/models/excludable.dart';
import 'package:boolean_lints/src/models/hooks/error_severity_hook.dart';
import 'package:boolean_lints/src/models/hooks/map_or_list_hook.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'banned_code_options.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase, hook: MapOrListHook())
class BannedCodeOptions extends Excludable with BannedCodeOptionsMappable {
  const BannedCodeOptions({
    this.entries = const [],
    this.includes = const [],
    this.excludes = const [],
    this.severity,
  });

  final List<BannedCodeEntryOptions> entries;

  @override
  final List<String> includes;

  @override
  final List<String> excludes;

  @MappableField(hook: ErrorSeverityHook())
  final ErrorSeverity? severity;

  static const fromJson = BannedCodeOptionsMapper.fromJson;
  static const fromMap = BannedCodeOptionsMapper.fromMap;
}
