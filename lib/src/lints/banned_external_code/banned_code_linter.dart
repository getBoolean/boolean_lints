import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/error/listener.dart';
import 'package:boolean_lints/src/lints/banned_external_code/banned_code_rule.dart';
import 'package:boolean_lints/src/lints/banned_external_code/models/banned_code_options.dart';
import 'package:boolean_lints/src/models/rule_config.dart';
import 'package:boolean_lints/src/utils/extensions.dart';
import 'package:collection/collection.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:path/path.dart' as p;

/// Linter for [BannedCodeRule]
class BannedCodeLinter {
  /// Linter for [BannedCodeRule]
  const BannedCodeLinter({
    required this.resolver,
    required this.reporter,
    required this.context,
    required this.config,
  });

  /// Access to the resolver for this lint context
  final CustomLintResolver resolver;

  /// The error reporter to create lints
  final ErrorReporter reporter;

  /// The current lint context
  final CustomLintContext context;

  /// The configuration parameters for the lint
  final RuleConfig<BannedCodeOptions?> config;

  bool _matchesSource(String? parentSourcePath, String sourceToMatch) {
    if (parentSourcePath == null) {
      return false;
    }

    final parentUri = p.toUri(parentSourcePath);
    final sourceUri = p.toUri(sourceToMatch);

    final libraryName = parentUri.pathSegments.first;
    final sourceLibraryName = sourceUri.pathSegments.first;

    final matchesLibraryName = libraryName == sourceLibraryName;
    final shouldLintFileFromSource = sourceUri.pathSegments.length > 1;
    if (shouldLintFileFromSource) {
      final sourceFile = sourceUri.pathSegments.sublist(1).join('/');
      final libraryFile = parentUri.pathSegments.sublist(1).join('/');

      final matchesFile = p.equals(sourceFile, libraryFile);
      return matchesLibraryName && matchesFile;
    }

    return matchesLibraryName;
  }

  /// Lints usages of a global variable or function
  void banId(
    LintCode entryCode,
    String id,
  ) {
    banIdFromSource(entryCode, id);
  }

  /// Lints usages of a class and its members
  void banClass(
    LintCode entryCode,
    String className,
  ) {
    banClassFromSource(entryCode, className);
  }

  /// Lints usages of a given source
  void banSource(LintCode entryCode, String package) {
    context.registry.addSimpleIdentifier((node) {
      final parentSourceName = node.sourceUrl;
      if (!_matchesSource(parentSourceName, package)) {
        return;
      }

      if (node.parent is ConstructorDeclaration) {
        return;
      }

      reporter.reportErrorForNode(entryCode, node);
    });

    context.registry.addNamedType((node) {
      final parentSourceName = node.sourceUrl;
      if (!_matchesSource(parentSourceName, package)) {
        return;
      }

      reporter.reportErrorForNode(entryCode, node);
    });
  }

  /// Lints usages of a global variable or function from a given source
  void banIdFromSource(LintCode entryCode, String id, [String? source]) {
    // only matches globals
    context.registry.addSimpleIdentifier((node) {
      final name = node.name;
      if (name != id) {
        return;
      }

      final parentSourceName = node.sourceUrl;
      if (source != null && !_matchesSource(parentSourceName, source)) {
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

  /// Lints usages of a class member
  void banIdFromClass(LintCode entryCode, String id, String className) {
    banIdFromClassFromSource(entryCode, id, className);
  }

  /// Lints usages of a class and its members from a given source
  void banClassFromSource(
    LintCode entryCode,
    String className, [
    String? source,
  ]) {
    context.registry.addSimpleIdentifier((node) {
      final parentSourceName = node.sourceUrl;
      if (source != null && !_matchesSource(parentSourceName, source)) {
        return;
      }

      final parent = node.parent;
      if (parent == null) {
        return;
      }

      if (parent is ConstructorDeclaration) {
        return;
      }

      final entityBeforeNode = parent.childEntities.firstOrNull;
      switch (entityBeforeNode) {
        case InstanceCreationExpression(:final staticType?):
        case SimpleIdentifier(:final staticType?):
          final parentTypeName = staticType.element?.name;
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

      reporter.reportErrorForNode(entryCode, parent);
    });

    context.registry.addNamedType((node) {
      final nodeTypeName = node.name2.lexeme;
      if (nodeTypeName != className) {
        return;
      }

      final parentSourceName = node.sourceUrl;
      if (source != null && !_matchesSource(parentSourceName, source)) {
        return;
      }

      reporter.reportErrorForNode(
        entryCode,
        node.parent?.parent ?? node.parent ?? node,
      );
    });
  }

  /// Lints usages of a class member from a given source
  void banIdFromClassFromSource(
    LintCode entryCode,
    String id,
    String className, [
    String? source,
  ]) {
    context.registry.addSimpleIdentifier((node) {
      final name = node.name;
      if (name != id) {
        return;
      }

      final parentSourceName = node.sourceUrl;
      if (source != null && !_matchesSource(parentSourceName, source)) {
        return;
      }

      final parent = node.parent;
      if (parent == null) {
        return;
      }

      if (parent is ConstructorDeclaration) {
        return;
      }

      final entityBeforeNode = parent.childEntities.firstOrNull;
      switch (entityBeforeNode) {
        case InstanceCreationExpression(:final staticType?):
        case SimpleIdentifier(:final staticType?):
          final parentTypeName = staticType.element?.name;
          if (parentTypeName != className) {
            return;
          }

          reporter.reportErrorForNode(entryCode, node.parent ?? node);
        case SimpleIdentifier(:final staticElement?):
          final parentElementName = staticElement.name;
          if (parentElementName != className) {
            return;
          }

          reporter.reportErrorForNode(entryCode, node.parent ?? node);
        case NamedType(:final element?):
          final parentTypeName = element.name;
          if (parentTypeName != className) {
            return;
          }

          reporter.reportErrorForNode(
            entryCode,
            node.parent?.parent ?? node.parent ?? node,
          );
      }
    });
  }
}
