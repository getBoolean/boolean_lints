// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'banned_code_options.dart';

class BannedCodeOptionsMapper extends ClassMapperBase<BannedCodeOptions> {
  BannedCodeOptionsMapper._();

  static BannedCodeOptionsMapper? _instance;
  static BannedCodeOptionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BannedCodeOptionsMapper._());
      BannedCodeEntryOptionsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'BannedCodeOptions';

  static List<BannedCodeEntryOptions> _$entries(BannedCodeOptions v) =>
      v.entries;
  static const Field<BannedCodeOptions, List<BannedCodeEntryOptions>>
      _f$entries = Field('entries', _$entries, opt: true, def: const []);
  static List<String> _$includes(BannedCodeOptions v) => v.includes;
  static const Field<BannedCodeOptions, List<String>> _f$includes =
      Field('includes', _$includes, opt: true, def: const []);
  static List<String> _$excludes(BannedCodeOptions v) => v.excludes;
  static const Field<BannedCodeOptions, List<String>> _f$excludes =
      Field('excludes', _$excludes, opt: true, def: const []);
  static ErrorSeverity? _$severity(BannedCodeOptions v) => v.severity;
  static const Field<BannedCodeOptions, ErrorSeverity> _f$severity =
      Field('severity', _$severity, opt: true, hook: ErrorSeverityHook());

  @override
  final Map<Symbol, Field<BannedCodeOptions, dynamic>> fields = const {
    #entries: _f$entries,
    #includes: _f$includes,
    #excludes: _f$excludes,
    #severity: _f$severity,
  };

  @override
  final MappingHook hook = const MapOrListHook();
  static BannedCodeOptions _instantiate(DecodingData data) {
    return BannedCodeOptions(
        entries: data.dec(_f$entries),
        includes: data.dec(_f$includes),
        excludes: data.dec(_f$excludes),
        severity: data.dec(_f$severity));
  }

  @override
  final Function instantiate = _instantiate;

  static BannedCodeOptions fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BannedCodeOptions>(map);
  }

  static BannedCodeOptions fromJson(String json) {
    return ensureInitialized().decodeJson<BannedCodeOptions>(json);
  }
}

mixin BannedCodeOptionsMappable {
  String toJson() {
    return BannedCodeOptionsMapper.ensureInitialized()
        .encodeJson<BannedCodeOptions>(this as BannedCodeOptions);
  }

  Map<String, dynamic> toMap() {
    return BannedCodeOptionsMapper.ensureInitialized()
        .encodeMap<BannedCodeOptions>(this as BannedCodeOptions);
  }

  BannedCodeOptionsCopyWith<BannedCodeOptions, BannedCodeOptions,
          BannedCodeOptions>
      get copyWith => _BannedCodeOptionsCopyWithImpl(
          this as BannedCodeOptions, $identity, $identity);
  @override
  String toString() {
    return BannedCodeOptionsMapper.ensureInitialized()
        .stringifyValue(this as BannedCodeOptions);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            BannedCodeOptionsMapper.ensureInitialized()
                .isValueEqual(this as BannedCodeOptions, other));
  }

  @override
  int get hashCode {
    return BannedCodeOptionsMapper.ensureInitialized()
        .hashValue(this as BannedCodeOptions);
  }
}

extension BannedCodeOptionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BannedCodeOptions, $Out> {
  BannedCodeOptionsCopyWith<$R, BannedCodeOptions, $Out>
      get $asBannedCodeOptions =>
          $base.as((v, t, t2) => _BannedCodeOptionsCopyWithImpl(v, t, t2));
}

abstract class BannedCodeOptionsCopyWith<$R, $In extends BannedCodeOptions,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      BannedCodeEntryOptions,
      BannedCodeEntryOptionsCopyWith<$R, BannedCodeEntryOptions,
          BannedCodeEntryOptions>> get entries;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get includes;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get excludes;
  $R call(
      {List<BannedCodeEntryOptions>? entries,
      List<String>? includes,
      List<String>? excludes,
      ErrorSeverity? severity});
  BannedCodeOptionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _BannedCodeOptionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BannedCodeOptions, $Out>
    implements BannedCodeOptionsCopyWith<$R, BannedCodeOptions, $Out> {
  _BannedCodeOptionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BannedCodeOptions> $mapper =
      BannedCodeOptionsMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      BannedCodeEntryOptions,
      BannedCodeEntryOptionsCopyWith<$R, BannedCodeEntryOptions,
          BannedCodeEntryOptions>> get entries => ListCopyWith(
      $value.entries, (v, t) => v.copyWith.$chain(t), (v) => call(entries: v));
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
          {List<BannedCodeEntryOptions>? entries,
          List<String>? includes,
          List<String>? excludes,
          Object? severity = $none}) =>
      $apply(FieldCopyWithData({
        if (entries != null) #entries: entries,
        if (includes != null) #includes: includes,
        if (excludes != null) #excludes: excludes,
        if (severity != $none) #severity: severity
      }));
  @override
  BannedCodeOptions $make(CopyWithData data) => BannedCodeOptions(
      entries: data.get(#entries, or: $value.entries),
      includes: data.get(#includes, or: $value.includes),
      excludes: data.get(#excludes, or: $value.excludes),
      severity: data.get(#severity, or: $value.severity));

  @override
  BannedCodeOptionsCopyWith<$R2, BannedCodeOptions, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _BannedCodeOptionsCopyWithImpl($value, $cast, t);
}
