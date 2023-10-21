// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'entry.dart';

class EntryOptionMapper extends ClassMapperBase<EntryOption> {
  EntryOptionMapper._();

  static EntryOptionMapper? _instance;
  static EntryOptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EntryOptionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'EntryOption';

  static String? _$className(EntryOption v) => v.className;
  static const Field<EntryOption, String> _f$className =
      Field('className', _$className, key: 'class_name', opt: true);
  static String? _$id(EntryOption v) => v.id;
  static const Field<EntryOption, String> _f$id = Field('id', _$id, opt: true);
  static String? _$source(EntryOption v) => v.source;
  static const Field<EntryOption, String> _f$source =
      Field('source', _$source, opt: true);
  static ErrorSeverity? _$severity(EntryOption v) => v.severity;
  static const Field<EntryOption, ErrorSeverity> _f$severity =
      Field('severity', _$severity, opt: true, hook: ErrorSeverityHook());
  static String? _$reason(EntryOption v) => v.reason;
  static const Field<EntryOption, String> _f$reason =
      Field('reason', _$reason, opt: true);

  @override
  final Map<Symbol, Field<EntryOption, dynamic>> fields = const {
    #className: _f$className,
    #id: _f$id,
    #source: _f$source,
    #severity: _f$severity,
    #reason: _f$reason,
  };

  @override
  final MappingHook hook = const MapOrListHook();
  static EntryOption _instantiate(DecodingData data) {
    return EntryOption(
        className: data.dec(_f$className),
        id: data.dec(_f$id),
        source: data.dec(_f$source),
        severity: data.dec(_f$severity),
        reason: data.dec(_f$reason));
  }

  @override
  final Function instantiate = _instantiate;

  static EntryOption fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EntryOption>(map);
  }

  static EntryOption fromJson(String json) {
    return ensureInitialized().decodeJson<EntryOption>(json);
  }
}

mixin EntryOptionMappable {
  String toJson() {
    return EntryOptionMapper.ensureInitialized()
        .encodeJson<EntryOption>(this as EntryOption);
  }

  Map<String, dynamic> toMap() {
    return EntryOptionMapper.ensureInitialized()
        .encodeMap<EntryOption>(this as EntryOption);
  }

  EntryOptionCopyWith<EntryOption, EntryOption, EntryOption> get copyWith =>
      _EntryOptionCopyWithImpl(this as EntryOption, $identity, $identity);
  @override
  String toString() {
    return EntryOptionMapper.ensureInitialized()
        .stringifyValue(this as EntryOption);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            EntryOptionMapper.ensureInitialized()
                .isValueEqual(this as EntryOption, other));
  }

  @override
  int get hashCode {
    return EntryOptionMapper.ensureInitialized().hashValue(this as EntryOption);
  }
}

extension EntryOptionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, EntryOption, $Out> {
  EntryOptionCopyWith<$R, EntryOption, $Out> get $asEntryOption =>
      $base.as((v, t, t2) => _EntryOptionCopyWithImpl(v, t, t2));
}

abstract class EntryOptionCopyWith<$R, $In extends EntryOption, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? className,
      String? id,
      String? source,
      ErrorSeverity? severity,
      String? reason});
  EntryOptionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _EntryOptionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, EntryOption, $Out>
    implements EntryOptionCopyWith<$R, EntryOption, $Out> {
  _EntryOptionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<EntryOption> $mapper =
      EntryOptionMapper.ensureInitialized();
  @override
  $R call(
          {Object? className = $none,
          Object? id = $none,
          Object? source = $none,
          Object? severity = $none,
          Object? reason = $none}) =>
      $apply(FieldCopyWithData({
        if (className != $none) #className: className,
        if (id != $none) #id: id,
        if (source != $none) #source: source,
        if (severity != $none) #severity: severity,
        if (reason != $none) #reason: reason
      }));
  @override
  EntryOption $make(CopyWithData data) => EntryOption(
      className: data.get(#className, or: $value.className),
      id: data.get(#id, or: $value.id),
      source: data.get(#source, or: $value.source),
      severity: data.get(#severity, or: $value.severity),
      reason: data.get(#reason, or: $value.reason));

  @override
  EntryOptionCopyWith<$R2, EntryOption, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _EntryOptionCopyWithImpl($value, $cast, t);
}
