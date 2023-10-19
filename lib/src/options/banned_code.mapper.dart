// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'banned_code.dart';

class BannedCodeOptionMapper extends ClassMapperBase<BannedCodeOption> {
  BannedCodeOptionMapper._();

  static BannedCodeOptionMapper? _instance;
  static BannedCodeOptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BannedCodeOptionMapper._());
      EntryOptionMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'BannedCodeOption';

  static List<EntryOption> _$entries(BannedCodeOption v) => v.entries;
  static const Field<BannedCodeOption, List<EntryOption>> _f$entries =
      Field('entries', _$entries, opt: true, def: const []);
  static List<String> _$exclude(BannedCodeOption v) => v.exclude;
  static const Field<BannedCodeOption, List<String>> _f$exclude =
      Field('exclude', _$exclude, opt: true, def: const []);
  static List<String> _$include(BannedCodeOption v) => v.include;
  static const Field<BannedCodeOption, List<String>> _f$include =
      Field('include', _$include, opt: true, def: const []);
  static ErrorSeverity? _$severity(BannedCodeOption v) => v.severity;
  static const Field<BannedCodeOption, ErrorSeverity> _f$severity =
      Field('severity', _$severity, opt: true, hook: ErrorSeverityHook());

  @override
  final Map<Symbol, Field<BannedCodeOption, dynamic>> fields = const {
    #entries: _f$entries,
    #exclude: _f$exclude,
    #include: _f$include,
    #severity: _f$severity,
  };

  @override
  final MappingHook hook = const MapOrListHook();
  static BannedCodeOption _instantiate(DecodingData data) {
    return BannedCodeOption(
        entries: data.dec(_f$entries),
        exclude: data.dec(_f$exclude),
        include: data.dec(_f$include),
        severity: data.dec(_f$severity));
  }

  @override
  final Function instantiate = _instantiate;

  static BannedCodeOption fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BannedCodeOption>(map);
  }

  static BannedCodeOption fromJson(String json) {
    return ensureInitialized().decodeJson<BannedCodeOption>(json);
  }
}

mixin BannedCodeOptionMappable {
  String toJson() {
    return BannedCodeOptionMapper.ensureInitialized()
        .encodeJson<BannedCodeOption>(this as BannedCodeOption);
  }

  Map<String, dynamic> toMap() {
    return BannedCodeOptionMapper.ensureInitialized()
        .encodeMap<BannedCodeOption>(this as BannedCodeOption);
  }

  BannedCodeOptionCopyWith<BannedCodeOption, BannedCodeOption, BannedCodeOption>
      get copyWith => _BannedCodeOptionCopyWithImpl(
          this as BannedCodeOption, $identity, $identity);
  @override
  String toString() {
    return BannedCodeOptionMapper.ensureInitialized()
        .stringifyValue(this as BannedCodeOption);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            BannedCodeOptionMapper.ensureInitialized()
                .isValueEqual(this as BannedCodeOption, other));
  }

  @override
  int get hashCode {
    return BannedCodeOptionMapper.ensureInitialized()
        .hashValue(this as BannedCodeOption);
  }
}

extension BannedCodeOptionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BannedCodeOption, $Out> {
  BannedCodeOptionCopyWith<$R, BannedCodeOption, $Out>
      get $asBannedCodeOption =>
          $base.as((v, t, t2) => _BannedCodeOptionCopyWithImpl(v, t, t2));
}

abstract class BannedCodeOptionCopyWith<$R, $In extends BannedCodeOption, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, EntryOption,
      EntryOptionCopyWith<$R, EntryOption, EntryOption>> get entries;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get exclude;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get include;
  $R call(
      {List<EntryOption>? entries,
      List<String>? exclude,
      List<String>? include,
      ErrorSeverity? severity});
  BannedCodeOptionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _BannedCodeOptionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BannedCodeOption, $Out>
    implements BannedCodeOptionCopyWith<$R, BannedCodeOption, $Out> {
  _BannedCodeOptionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BannedCodeOption> $mapper =
      BannedCodeOptionMapper.ensureInitialized();
  @override
  ListCopyWith<$R, EntryOption,
          EntryOptionCopyWith<$R, EntryOption, EntryOption>>
      get entries => ListCopyWith($value.entries,
          (v, t) => v.copyWith.$chain(t), (v) => call(entries: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get exclude =>
      ListCopyWith($value.exclude, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(exclude: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get include =>
      ListCopyWith($value.include, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(include: v));
  @override
  $R call(
          {List<EntryOption>? entries,
          List<String>? exclude,
          List<String>? include,
          Object? severity = $none}) =>
      $apply(FieldCopyWithData({
        if (entries != null) #entries: entries,
        if (exclude != null) #exclude: exclude,
        if (include != null) #include: include,
        if (severity != $none) #severity: severity
      }));
  @override
  BannedCodeOption $make(CopyWithData data) => BannedCodeOption(
      entries: data.get(#entries, or: $value.entries),
      exclude: data.get(#exclude, or: $value.exclude),
      include: data.get(#include, or: $value.include),
      severity: data.get(#severity, or: $value.severity));

  @override
  BannedCodeOptionCopyWith<$R2, BannedCodeOption, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _BannedCodeOptionCopyWithImpl($value, $cast, t);
}
