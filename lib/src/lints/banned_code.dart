import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:boolean_lints/src/options.dart';
import 'package:boolean_lints/src/options/banned_code.dart';
import 'package:boolean_lints/src/options/entry.dart';
import 'package:boolean_lints/src/options_plugin_base.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class BannedCodeRule extends OptionsLintRule {
  BannedCodeRule() : super(code: _code);

  static const _code = LintCode(
    name: 'banned_code',
    problemMessage: 'Usage of this has been discouraged by your project.',
    errorSeverity: ErrorSeverity.WARNING,
  );

  @override
  Future<void> runWithOptions(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
    Options options,
  ) async {
    if (options.rules.bannedCode.shouldSkipFile(resolver.path)) {
      return;
    }

    final linter = BannedCodeLinter(
      resolver: resolver,
      reporter: reporter,
      context: context,
      options: options,
    );

    final BannedCodeOption(
      :entries,
      severity: ruleSeverity,
    ) = options.rules.bannedCode;

    for (final entry in entries) {
      final entryCode = code.copyWith(
        errorSeverity: entry.severity ?? ruleSeverity ?? code.errorSeverity,
        problemMessage: entry.reason,
      );

      switch (entry) {
        // all non null
        case EntryOption(:final id?, :final className?, :final package?):
          linter.banIdFromClassFromPackage(entryCode, id, className, package);

        // two non nulls
        case EntryOption(:final className?, :final package?):
          linter.banClassFromPackage(entryCode, className, package);
        case EntryOption(:final id?, :final className?):
          linter.banIdFromClass(entryCode, id, className);
        case EntryOption(:final id?, :final package?):
          linter.banIdFromPackage(entryCode, id, package);

        // one non null
        case EntryOption(:final package?):
          linter.banPackage(entryCode, package);
        case EntryOption(:final className?):
          linter.banClass(entryCode, className);
        case EntryOption(:final id?):
          linter.banId(entryCode, id);

        // all null
        case EntryOption():
          break;
      }
    }
  }

  @override
  List<Fix> getFixes() => [];
}

class BannedCodeLinter {
  const BannedCodeLinter({
    required this.resolver,
    required this.reporter,
    required this.context,
    required this.options,
  });

  final CustomLintResolver resolver;
  final ErrorReporter reporter;
  final CustomLintContext context;
  final Options options;

  bool _matchesPackage(String? parentSourceName, String package) {
    return parentSourceName?.startsWith('package:$package') ?? false;
  }

  void banId(
    LintCode entryCode,
    String id,
  ) {
    banIdFromPackage(entryCode, id);
  }

  void banClass(
    LintCode entryCode,
    String className,
  ) {
    banClassFromPackage(entryCode, className);
  }

  void banPackage(LintCode entryCode, String package) {
    context.registry.addSimpleIdentifier((node) {
      final parentSourceName = node.sourceUrl;
      if (!_matchesPackage(parentSourceName, package)) {
        return;
      }

      if (node.parent is ConstructorDeclaration) {
        return;
      }

      reporter.reportErrorForNode(entryCode, node);
    });

    context.registry.addNamedType((node) {
      final parentSourceName = node.sourceUrl;
      if (!_matchesPackage(parentSourceName, package)) {
        return;
      }

      reporter.reportErrorForNode(entryCode, node);
    });
  }

  void banIdFromPackage(LintCode entryCode, String id, [String? package]) {
    // only matches globals
    context.registry.addSimpleIdentifier((node) {
      final name = node.name;
      if (name != id) {
        return;
      }

      final parentSourceName = node.sourceUrl;
      if (package != null && !_matchesPackage(parentSourceName, package)) {
        return;
      }

      if (node.parent is ConstructorDeclaration) {
        return;
      }

      switch (node.staticElement) {
        case FunctionElement() || PropertyAccessorElement():
          reporter.reportErrorForNode(entryCode, node);
      }
    });
  }

  void banIdFromClass(LintCode entryCode, String id, String className) {
    banIdFromClassFromPackage(entryCode, id, className);
  }

  void banClassFromPackage(
    LintCode entryCode,
    String className, [
    String? package,
  ]) {
    context.registry.addSimpleIdentifier((node) {
      final parent = node.parent;
      final entityBeforeNode =
          parent!.childEntities.firstWhere((element) => element != node);
      switch (entityBeforeNode) {
        case InstanceCreationExpression(:final staticType?):
        case SimpleIdentifier(:final staticType?):
          final parentTypeName =
              staticType.getDisplayString(withNullability: false);
          if (parentTypeName != className) {
            return;
          }
        case SimpleIdentifier(:final staticElement?):
          final parentElementName = staticElement.name;
          if (parentElementName != className) {
            return;
          }
        default:
          return;
      }

      final parentSourceName = node.sourceUrl;
      if (package != null && !_matchesPackage(parentSourceName, package)) {
        return;
      }

      reporter.reportErrorForNode(entryCode, parent);
    });

    context.registry.addNamedType((node) {
      final nodeTypeName = node.name2.lexeme;
      if (nodeTypeName != className) {
        return;
      }

      final parentSourceName = node.sourceUrl;
      if (package != null && !_matchesPackage(parentSourceName, package)) {
        return;
      }

      reporter.reportErrorForNode(
          entryCode, node.parent?.parent ?? node.parent ?? node);
    });
  }

  void banIdFromClassFromPackage(
    LintCode entryCode,
    String id,
    String className, [
    String? package,
  ]) {
    context.registry.addSimpleIdentifier((node) {
      final name = node.name;
      if (name != id) {
        return;
      }

      final parent = node.parent;
      final entityBeforeNode =
          parent!.childEntities.firstWhere((element) => element != node);
      switch (entityBeforeNode) {
        case InstanceCreationExpression(:final staticType?):
        case SimpleIdentifier(:final staticType?):
          final parentTypeName =
              staticType.getDisplayString(withNullability: false);
          if (parentTypeName != className) {
            return;
          }

          final parentSourceName = node.sourceUrl;
          if (package != null && _matchesPackage(parentSourceName, package)) {
            reporter.reportErrorForNode(entryCode, node.parent ?? node);
          }
        case SimpleIdentifier(:final staticElement?):
          final parentElementName = staticElement.name;
          if (parentElementName != className) {
            return;
          }

          final parentSourceName = node.sourceUrl;
          if (package != null && _matchesPackage(parentSourceName, package)) {
            reporter.reportErrorForNode(entryCode, node.parent ?? node);
          }
        case NamedType(:final element?):
          final parentTypeName = element.name;
          if (parentTypeName != className) {
            return;
          }

          final parentSourceName = node.sourceUrl;
          if (package != null && _matchesPackage(parentSourceName, package)) {
            reporter.reportErrorForNode(
                entryCode, node.parent?.parent ?? node.parent ?? node);
          }
        default:
          return;
      }
    });
  }
}
