<!-- omit from toc -->
# All Lint Rules

## Table of Contents

- [Table of Contents](#table-of-contents)
- [Configuring Lints](#configuring-lints)
- [Dart](#dart)
  - [banned\_code](#banned_code)

## Configuring Lints

All lints have configuration options available, these can be specified in the `analysis_options.yaml`
or the `pubspec.yaml` file, an example is shown below. Each lint may also have additional options
available that are covered in their respective sections below.

All lints have the following options:

- `severity`: This can be set to `none`, `info`, `warning` or `error`.
- `include`: Only lint files matching these regular expressions.
- `exclude`: Skip linting files matching these regular expressions.

```yaml
boolean_lints:
  rules:
    example_lint_code:
      severity: info
      include:
        - "lib/.*\\.dart"
      exclude:
        - "lib/.*_temp\\.dart"
```

## Dart

### banned_code

> **warning**

Warn. Prevent *usage* of banned code in the project. All entry options are optional, specifying each
option will narrow the scope of the lint. If no options are specified, the lint will be ignored.

- `severity`: Changes the default lint severity for all entries.
- `entries`
  - `source`: Limits lints to a specific source, e.g. `package:example` or `dart:io`.
    If `id` or `class_name` is not specified, the lint will be applied to everything from the source.
  - `class_name`: Lint for *usage* of all members of the class.
  - `id`: Lint a specific variable/method from a class if `class_name` is specified, otherwise it will only lint globals.
  - `reason`: Why the code should not be used and what should be used instead.
  - `severity`: Override the lint severity for this entry.
- plus the options mentioned in [Configuring Lints](#configuring-lints)

```yaml
boolean_lints:
  rules:
    banned_code:
      # Default severity for all entries
      severity: warning
      entries:
        - id: test
          class_name: BannedCodeUsage
          source: package:example
          reason: "BannedCodeUsage.test from the example package is not allowed"
          severity: error
```

<!-- Disabled -->

<!-- ### avoid_hardcoded_strings

> **info * 🛠**

Info. Avoid hardcoding strings. Use a localization package or append ".hardcoded" to the string to suppress this message.
This lint is designed for `flutter_localizations` from the Flutter SDK.

```yaml
boolean_lints:
  rules:
    avoid_hardcoded_strings:
      minimum_length: 0
      severity: info
```

**Good**:

```dart
final title = AppLocalizations.of(context).appTitle;
// .hardcoded extension not included, see example for source
final title = 'My App'.hardcoded;
```

**Bad**:

```dart
final title = 'My App'; // LINT
``` -->
