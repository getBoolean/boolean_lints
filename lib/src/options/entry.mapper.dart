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

  static List<String> _$code(EntryOption v) => v.code;
  static const Field<EntryOption, List<String>> _f$code =
      Field('code', _$code, opt: true, def: const []);
  static List<String> _$regex(EntryOption v) => v.regex;
  static const Field<EntryOption, List<String>> _f$regex =
      Field('regex', _$regex, opt: true, def: const []);
  static String? _$package(EntryOption v) => v.package;
  static const Field<EntryOption, String> _f$package =
      Field('package', _$package, opt: true);
  static ErrorSeverity? _$severity(EntryOption v) => v.severity;
  static const Field<EntryOption, ErrorSeverity> _f$severity =
      Field('severity', _$severity, opt: true, hook: ErrorSeverityHook());
  static String? _$message(EntryOption v) => v.message;
  static const Field<EntryOption, String> _f$message =
      Field('message', _$message, opt: true);

  @override
  final Map<Symbol, Field<EntryOption, dynamic>> fields = const {
    #code: _f$code,
    #regex: _f$regex,
    #package: _f$package,
    #severity: _f$severity,
    #message: _f$message,
  };

  @override
  final MappingHook hook = const MapOrListHook();
  static EntryOption _instantiate(DecodingData data) {
    return EntryOption(
        code: data.dec(_f$code),
        regex: data.dec(_f$regex),
        package: data.dec(_f$package),
        severity: data.dec(_f$severity),
        message: data.dec(_f$message));
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
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get code;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get regex;
  $R call(
      {List<String>? code,
      List<String>? regex,
      String? package,
      ErrorSeverity? severity,
      String? message});
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
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get code =>
      ListCopyWith($value.code, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(code: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get regex =>
      ListCopyWith($value.regex, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(regex: v));
  @override
  $R call(
          {List<String>? code,
          List<String>? regex,
          Object? package = $none,
          Object? severity = $none,
          Object? message = $none}) =>
      $apply(FieldCopyWithData({
        if (code != null) #code: code,
        if (regex != null) #regex: regex,
        if (package != $none) #package: package,
        if (severity != $none) #severity: severity,
        if (message != $none) #message: message
      }));
  @override
  EntryOption $make(CopyWithData data) => EntryOption(
      code: data.get(#code, or: $value.code),
      regex: data.get(#regex, or: $value.regex),
      package: data.get(#package, or: $value.package),
      severity: data.get(#severity, or: $value.severity),
      message: data.get(#message, or: $value.message));

  @override
  EntryOptionCopyWith<$R2, EntryOption, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _EntryOptionCopyWithImpl($value, $cast, t);
}
