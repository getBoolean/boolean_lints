## 2.0.0

- **Breaking:** Migrated to new options format, options are now defined under the `custom_lint` key.
- **Breaking:** Removed `boolean_lints.rules_exclude` option as it is redundant with the analyzer's
  exclude option.

Before:

```yaml
custom_lint:
  rules:
    - banned_code:

boolean_lints:
  rules:
    banned_code:
      severity: info
      include:
        - "lib/.*\\.dart"
      exclude:
        - "lib/.*_temp\\.dart"
```

After:

```yaml
custom_lint:
  rules:
    - banned_code:
      severity: info
      include:
        - "lib/**.dart"
      exclude:
        - "lib/**_temp.dart"
```

## 1.0.2

- Minor change to readme

## 1.0.1

- Add example for pub.dev
- Add API comments for pub.dev

## 1.0.0

- Initial release with `banned_code` lint.
