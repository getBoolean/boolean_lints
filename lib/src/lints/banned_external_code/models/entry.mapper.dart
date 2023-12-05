// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'entry.dart';

class BannedCodeEntryOptionsMapper
    extends ClassMapperBase<BannedCodeEntryOptions> {
  BannedCodeEntryOptionsMapper._();

  static BannedCodeEntryOptionsMapper? _instance;
  static BannedCodeEntryOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BannedCodeEntryOptionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BannedCodeEntryOptions';

  static String? _$className(BannedCodeEntryOptions v) => v.className;
  static const Field<BannedCodeEntryOptions, String> _f$className =
      Field('className', _$className, key: 'class_name', opt: true);
  static String? _$id(BannedCodeEntryOptions v) => v.id;
  static const Field<BannedCodeEntryOptions, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$source(BannedCodeEntryOptions v) => v.source;
  static const Field<BannedCodeEntryOptions, String> _f$source =
      Field('source', _$source, opt: true);
  static ErrorSeverity? _$severity(BannedCodeEntryOptions v) => v.severity;
  static const Field<BannedCodeEntryOptions, ErrorSeverity> _f$severity =
      Field('severity', _$severity, opt: true, hook: ErrorSeverityHook());
  static String? _$reason(BannedCodeEntryOptions v) => v.reason;
  static const Field<BannedCodeEntryOptions, String> _f$reason =
      Field('reason', _$reason, opt: true);
  static List<String> _$includes(BannedCodeEntryOptions v) => v.includes;
  static const Field<BannedCodeEntryOptions, List<String>> _f$includes =
      Field('includes', _$includes, opt: true, def: const []);
  static List<String> _$excludes(BannedCodeEntryOptions v) => v.excludes;
  static const Field<BannedCodeEntryOptions, List<String>> _f$excludes =
      Field('excludes', _$excludes, opt: true, def: const []);

  @override
  final Map<Symbol, Field<BannedCodeEntryOptions, dynamic>> fields = const {
    #className: _f$className,
    #id: _f$id,
    #source: _f$source,
    #severity: _f$severity,
    #reason: _f$reason,
    #includes: _f$includes,
    #excludes: _f$excludes,
  };

  @override
  final MappingHook hook = const MapOrListHook();
  static BannedCodeEntryOptions _instantiate(DecodingData data) {
    return BannedCodeEntryOptions(
        className: data.dec(_f$className),
        id: data.dec(_f$id),
        source: data.dec(_f$source),
        severity: data.dec(_f$severity),
        reason: data.dec(_f$reason),
        includes: data.dec(_f$includes),
        excludes: data.dec(_f$excludes));
  }

  @override
  final Function instantiate = _instantiate;

  static BannedCodeEntryOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BannedCodeEntryOptions>(map);
  }

  static BannedCodeEntryOptions fromJson(String json) {
    return ensureInitialized().decodeJson<BannedCodeEntryOptions>(json);
  }
}

mixin BannedCodeEntryOptionsMappable {
  String toJson() {
    return BannedCodeEntryOptionsMapper.ensureInitialized()
        .encodeJson<BannedCodeEntryOptions>(this as BannedCodeEntryOptions);
  }

  Map<String, dynamic> toMap() {
    return BannedCodeEntryOptionsMapper.ensureInitialized()
        .encodeMap<BannedCodeEntryOptions>(this as BannedCodeEntryOptions);
  }

  BannedCodeEntryOptionsCopyWith<BannedCodeEntryOptions, BannedCodeEntryOptions,
          BannedCodeEntryOptions>
      get copyWith => _BannedCodeEntryOptionsCopyWithImpl(
          this as BannedCodeEntryOptions, $identity, $identity);
  @override
  String toString() {
    return BannedCodeEntryOptionsMapper.ensureInitialized()
        .stringifyValue(this as BannedCodeEntryOptions);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            BannedCodeEntryOptionsMapper.ensureInitialized()
                .isValueEqual(this as BannedCodeEntryOptions, other));
  }

  @override
  int get hashCode {
    return BannedCodeEntryOptionsMapper.ensureInitialized()
        .hashValue(this as BannedCodeEntryOptions);
  }
}

extension BannedCodeEntryOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BannedCodeEntryOptions, $Out> {
  BannedCodeEntryOptionsCopyWith<$R, BannedCodeEntryOptions, $Out>
      get $asBannedCodeEntryOptions =>
          $base.as((v, t, t2) => _BannedCodeEntryOptionsCopyWithImpl(v, t, t2));
}

abstract class BannedCodeEntryOptionsCopyWith<
    $R,
    $In extends BannedCodeEntryOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get includes;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get excludes;
  $R call(
      {String? className,
      String? id,
      String? source,
      ErrorSeverity? severity,
      String? reason,
      List<String>? includes,
      List<String>? excludes});
  BannedCodeEntryOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _BannedCodeEntryOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BannedCodeEntryOptions, $Out>
    implements
        BannedCodeEntryOptionsCopyWith<$R, BannedCodeEntryOptions, $Out> {
  _BannedCodeEntryOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BannedCodeEntryOptions> $mapper =
      BannedCodeEntryOptionsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get includes =>
      ListCopyWith($value.includes, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(includes: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get excludes =>
      ListCopyWith($value.excludes, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(excludes: v));
  @override
  $R call(
          {Object? className = $none,
          Object? id = $none,
          Object? source = $none,
          Object? severity = $none,
          Object? reason = $none,
          List<String>? includes,
          List<String>? excludes}) =>
      $apply(FieldCopyWithData({
        if (className != $none) #className: className,
        if (id != $none) #id: id,
        if (source != $none) #source: source,
        if (severity != $none) #severity: severity,
        if (reason != $none) #reason: reason,
        if (includes != null) #includes: includes,
        if (excludes != null) #excludes: excludes
      }));
  @override
  BannedCodeEntryOptions $make(CopyWithData data) => BannedCodeEntryOptions(
      className: data.get(#className, or: $value.className),
      id: data.get(#id, or: $value.id),
      source: data.get(#source, or: $value.source),
      severity: data.get(#severity, or: $value.severity),
      reason: data.get(#reason, or: $value.reason),
      includes: data.get(#includes, or: $value.includes),
      excludes: data.get(#excludes, or: $value.excludes));

  @override
  BannedCodeEntryOptionsCopyWith<$R2, BannedCodeEntryOptions, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _BannedCodeEntryOptionsCopyWithImpl($value, $cast, t);
}
