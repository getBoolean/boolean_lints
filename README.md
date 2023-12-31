<!-- omit from toc -->
# Boolean Lints

`boolean_lints` is a developer tool made using `custom_lint`, designed to help stop common issues and simplify repetetive tasks. It aims to adds various warnings with quick fixes and refactoring options. At the moment, the only lint rule enabled is [banned_code](doc/LINTS.md#banned_code).

## Table of Contents

- [Table of Contents](#table-of-contents)
- [Usage](#usage)
  - [Installing boolean\_lints](#installing-boolean_lints)
  - [Enabling/disabling lints](#enablingdisabling-lints)
  - [Disable one specific rule](#disable-one-specific-rule)
  - [Disable all lints by default](#disable-all-lints-by-default)
  - [Configuring Lints](#configuring-lints)
  - [Running boolean\_lints in the terminal/CI](#running-boolean_lints-in-the-terminalci)
- [All Lint Rules](#all-lint-rules)
- [Contributing Guide](#contributing-guide)
  - [Creating Lints](#creating-lints)
  - [Creating Assists](#creating-assists)
  - [Debugging/Testing](#debuggingtesting)
- [Semantic Versioning Policy](#semantic-versioning-policy)
- [Resources](#resources)

## Usage

### Installing boolean_lints

`boolean_lints` is implemented using [custom_lint](https://pub.dev/packages/custom_lint). As such, it uses `custom_lint`'s installation logic.  
Long story short:

- Add both `boolean_lints` and `custom_lint` to your `pubspec.yaml`:

  ```yaml
  dev_dependencies:
    custom_lint:
    boolean_lints:
  ```

- Enable `custom_lint`'s plugin in your `analysis_options.yaml`:

  ```yaml
  analyzer:
    plugins:
      - custom_lint
  ```

### Enabling/disabling lints

By default when installing `boolean_lints`, most of the lints will be enabled.
To change this, you have a few options.

### Disable one specific rule

You may dislike one of the various lint rules offered by `boolean_lints`.
In that event, you can explicitly disable this lint rule for your project
by modifying the `analysis_options.yaml`

```yaml
analyzer:
  plugins:
    - custom_lint

custom_lint:
  rules:
    # Explicitly disable one lint rule
    - banned_code: false
```

Note that you can both enable and disable lint rules at once.
This can be useful if your `analysis_options.yaml` includes another one:

```yaml
include: path/to/another/analysis_options.yaml
analyzer:
  plugins:
    - custom_lint

custom_lint:
  rules:
    # Enable one rule
    - banned_code
    # Disable another
    - custom_lint_example: false
```

### Disable all lints by default

Instead of having all lints on by default and manually disabling lints of your choice,
you can switch to the opposite logic:  
Have lints off by default, and manually enable lints.

This can be done in your `analysis_options.yaml` with the following:

```yaml
analyzer:
  plugins:
    - custom_lint

custom_lint:
  # Forcibly disable lint rules by default
  enable_all_lint_rules: false
  rules:
    # You can now enable one specific rule in the "rules" list
    - banned_code
```

### Configuring Lints

Some of the lints have configuration options. These can be specified in `analysis_options.yaml`.

All lints have the following options:

- `severity`: This can be set to `none`, `info`, `warning` or `error`.
- `include`: Only lint files matching these regular expressions.
- `exclude`: Skip linting files matching these regular expressions.

```yaml
custom_lint:
  rules:
    - example_lint_code:
      severity: info
      include:
        - "lib/**.dart"
      exclude:
        - "lib/**_temp.dart"
```

### Running boolean_lints in the terminal/CI

Custom lint rules created by boolean_lints may not show-up in `dart analyze`.
To fix this, you can run a custom command line: `custom_lint`.

Since your project should already have custom_lint installed
(cf [installing boolean_lints](#installing-boolean_lints)), then you should be
able to run:

```sh
dart run custom_lint
```

Alternatively, you can globally install `custom_lint`:

```sh
# Install custom_lint for all projects
dart pub global activate custom_lint
# run custom_lint's command line in a project
dart run custom_lint
```

## All Lint Rules

Most lints have configuration options. These can be specified in the `analysis_options.yaml` or the `pubspec.yaml`.
See [LINTS.md](doc/LINTS.md) for a list of implemented lint rules and their configuration options.

- [banned_code](doc/LINTS.md#banned_code)

## Contributing Guide

### Creating Lints

1. Create a new file with the lint name in `lib/src/lints/{lint_name}/`,
type `lint` and use snippet to generate the boilerplate code.
1. Add the lint logic to the `OptionsLintRule.run` method.
1. (Optional) Adding a fix for the lint
    1. Create a fix file in the `lib/src/lints/{lint_name}/models/fixes`, type `fix` and
    use the snippet to generate the boilerplate code.
    2. Add it to the lint's `OptionsLintRule.getFixes` method.
1. Add the lint to the [lib/lints.dart](lib/lints.dart) `getAllLints` method. Type
`fix` and use the lint to generate the boilerplate code.
1. (Optional) Adding configuration options. These options are available with the `config.parameters` getter in the `OptionsLintRule`
and `OptionsFix` classes.
    1. Create a new file for each key in `lib/src/lints/{lint_name}/models/`,
    type `options` and use the snippet to generate the boilerplate code.
    2. Add the new options class to the lint rule `paramsParser` and the super class `OptionsLintRule` generic type parameter.
    3. Run `dart run build_runner build -d` to generate the new [dart_mappable](https://pub.dev/packages/dart_mappable) classes.
1. Update [LINTS.md](doc/LINTS.md) with the new lint and configuration options.

### Creating Assists

1. Create a new file with the lint name in [lib/src/assists](lib/src/assists),
type `assist` and use snippet to generate the boilerplate code.
1. Add the assist to the [lib/custom_lints_template.dart](lib/custom_lints_template.dart) `getAllAssists` method.

### Debugging/Testing

Follow the [custom_lint debugging/testing docs](https://pub.dev/packages/custom_lint#using-the-dart-debugger).

## Semantic Versioning Policy

`boolean_lints` follows [semantic versioning](https://semver.org/).

Major:

- New lint rules are added
- Lint is enabled by default (previously disabled by default).
- Lint configuration options changed

Minor:

- New lint rule added (disabled by default)
- New fix/assist added
- Lint configuration option added (without changing the default behavior)

Patch:

- Bug fixes
- Documentation updates

## Resources

- [Example lints](https://github.com/invertase/dart_custom_lint/blob/main/packages/custom_lint/example/example_lint/lib/custom_lint_example_lint.dart)
- [Riverpod Lint](https://github.com/rrousselGit/riverpod/tree/master/packages/riverpod_lint)
