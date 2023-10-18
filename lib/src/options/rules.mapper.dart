// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'rules.dart';

class RulesOptionMapper extends ClassMapperBase<RulesOption> {
  RulesOptionMapper._();

  static RulesOptionMapper? _instance;
  static RulesOptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RulesOptionMapper._());
      AvoidHardcodedStringsOptionMapper.ensureInitialized();
      CustomLintExampleOptionMapper.ensureInitialized();
      BannedCodeOptionMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RulesOption';

  static AvoidHardcodedStringsOption _$avoidHardcodedStrings(RulesOption v) =>
      v.avoidHardcodedStrings;
  static const Field<RulesOption, AvoidHardcodedStringsOption>
      _f$avoidHardcodedStrings = Field(
          'avoidHardcodedStrings', _$avoidHardcodedStrings,
          key: 'avoid_hardcoded_strings',
          opt: true,
          def: const AvoidHardcodedStringsOption());
  static CustomLintExampleOption _$customLintExample(RulesOption v) =>
      v.customLintExample;
  static const Field<RulesOption, CustomLintExampleOption>
      _f$customLintExample = Field('customLintExample', _$customLintExample,
          key: 'custom_lint_example',
          opt: true,
          def: const CustomLintExampleOption());
  static BannedCodeOption _$bannedCode(RulesOption v) => v.bannedCode;
  static const Field<RulesOption, BannedCodeOption> _f$bannedCode = Field(
      'bannedCode', _$bannedCode,
      key: 'banned_code', opt: true, def: const BannedCodeOption());

  @override
  final Map<Symbol, Field<RulesOption, dynamic>> fields = const {
    #avoidHardcodedStrings: _f$avoidHardcodedStrings,
    #customLintExample: _f$customLintExample,
    #bannedCode: _f$bannedCode,
  };

  @override
  final MappingHook hook = const MapOrListHook();
  static RulesOption _instantiate(DecodingData data) {
    return RulesOption(
        avoidHardcodedStrings: data.dec(_f$avoidHardcodedStrings),
        customLintExample: data.dec(_f$customLintExample),
        bannedCode: data.dec(_f$bannedCode));
  }

  @override
  final Function instantiate = _instantiate;

  static RulesOption fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RulesOption>(map);
  }

  static RulesOption fromJson(String json) {
    return ensureInitialized().decodeJson<RulesOption>(json);
  }
}

mixin RulesOptionMappable {
  String toJson() {
    return RulesOptionMapper.ensureInitialized()
        .encodeJson<RulesOption>(this as RulesOption);
  }

  Map<String, dynamic> toMap() {
    return RulesOptionMapper.ensureInitialized()
        .encodeMap<RulesOption>(this as RulesOption);
  }

  RulesOptionCopyWith<RulesOption, RulesOption, RulesOption> get copyWith =>
      _RulesOptionCopyWithImpl(this as RulesOption, $identity, $identity);
  @override
  String toString() {
    return RulesOptionMapper.ensureInitialized()
        .stringifyValue(this as RulesOption);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            RulesOptionMapper.ensureInitialized()
                .isValueEqual(this as RulesOption, other));
  }

  @override
  int get hashCode {
    return RulesOptionMapper.ensureInitialized().hashValue(this as RulesOption);
  }
}

extension RulesOptionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RulesOption, $Out> {
  RulesOptionCopyWith<$R, RulesOption, $Out> get $asRulesOption =>
      $base.as((v, t, t2) => _RulesOptionCopyWithImpl(v, t, t2));
}

abstract class RulesOptionCopyWith<$R, $In extends RulesOption, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  AvoidHardcodedStringsOptionCopyWith<$R, AvoidHardcodedStringsOption,
      AvoidHardcodedStringsOption> get avoidHardcodedStrings;
  CustomLintExampleOptionCopyWith<$R, CustomLintExampleOption,
      CustomLintExampleOption> get customLintExample;
  BannedCodeOptionCopyWith<$R, BannedCodeOption, BannedCodeOption>
      get bannedCode;
  $R call(
      {AvoidHardcodedStringsOption? avoidHardcodedStrings,
      CustomLintExampleOption? customLintExample,
      BannedCodeOption? bannedCode});
  RulesOptionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RulesOptionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RulesOption, $Out>
    implements RulesOptionCopyWith<$R, RulesOption, $Out> {
  _RulesOptionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RulesOption> $mapper =
      RulesOptionMapper.ensureInitialized();
  @override
  AvoidHardcodedStringsOptionCopyWith<$R, AvoidHardcodedStringsOption,
          AvoidHardcodedStringsOption>
      get avoidHardcodedStrings => $value.avoidHardcodedStrings.copyWith
          .$chain((v) => call(avoidHardcodedStrings: v));
  @override
  CustomLintExampleOptionCopyWith<$R, CustomLintExampleOption,
          CustomLintExampleOption>
      get customLintExample => $value.customLintExample.copyWith
          .$chain((v) => call(customLintExample: v));
  @override
  BannedCodeOptionCopyWith<$R, BannedCodeOption, BannedCodeOption>
      get bannedCode =>
          $value.bannedCode.copyWith.$chain((v) => call(bannedCode: v));
  @override
  $R call(
          {AvoidHardcodedStringsOption? avoidHardcodedStrings,
          CustomLintExampleOption? customLintExample,
          BannedCodeOption? bannedCode}) =>
      $apply(FieldCopyWithData({
        if (avoidHardcodedStrings != null)
          #avoidHardcodedStrings: avoidHardcodedStrings,
        if (customLintExample != null) #customLintExample: customLintExample,
        if (bannedCode != null) #bannedCode: bannedCode
      }));
  @override
  RulesOption $make(CopyWithData data) => RulesOption(
      avoidHardcodedStrings:
          data.get(#avoidHardcodedStrings, or: $value.avoidHardcodedStrings),
      customLintExample:
          data.get(#customLintExample, or: $value.customLintExample),
      bannedCode: data.get(#bannedCode, or: $value.bannedCode));

  @override
  RulesOptionCopyWith<$R2, RulesOption, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _RulesOptionCopyWithImpl($value, $cast, t);
}
