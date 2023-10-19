import 'package:analyzer/dart/ast/ast.dart';
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

    // TODO: Check id works for fields/getters/global vars/global methods

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
          break;

        // two non nulls
        case EntryOption(:final className?, :final package?):
          break;
        case EntryOption(:final id?, :final className?):
          break;
        case EntryOption(:final id?, :final package?):
          break;

        // one non null
        case EntryOption(:final package?):
          linter.banPackage(entryCode, package);
        case EntryOption(:final className?):
          linter.banClassName(entryCode, className);
        case EntryOption(:final id?):
          linter.banId(entryCode, id);

        // all null
        case EntryOption():
          break;
      }

      // lint the node if the id matches for method calls
      // context.registry.addSimpleIdentifier((node) {
      //   final name = node.name;
      //   if (name != id) {
      //     return;
      //   }

      //   if (className != null) {
      //     final parent = node.parent;
      //     final parentEntity =
      //         parent!.childEntities.firstWhere((element) => element != node);
      //     if (parentEntity is SimpleIdentifier) {
      //       final parentType = parentEntity.staticType;
      //       final parentElement = parentEntity.staticElement;
      //       final parentSource = parentElement?.librarySource;
      //       if (package != null) {
      //         final parentSourceName = parentSource?.uri.toString();
      //         if (!matchesPackage(parentSourceName, package)) {
      //           return;
      //         }
      //       }

      //       if (parentType != null) {
      //         final parentTypeName =
      //             parentType.getDisplayString(withNullability: false);
      //         if (parentTypeName != className) {
      //           return;
      //         }
      //       } else if (parentElement != null) {
      //         final parentElementName = parentElement.name;
      //         if (parentElementName != className) {
      //           return;
      //         }
      //       } else {
      //         return;
      //       }
      //     } else if (parentEntity is NamedType) {
      //       final parentTypeName = parentEntity.name2.lexeme;
      //       final parentSource = parentEntity.element?.librarySource;
      //       if (package != null) {
      //         final parentSourceName = parentSource?.uri.toString();
      //         if (!matchesPackage(parentSourceName, package)) {
      //           return;
      //         }
      //       }

      //       if (parentTypeName != className) {
      //         return;
      //       }
      //     } else {
      //       return;
      //     }
      //   }

      //   // check if the package name matches the node's source file package

      //   reporter.reportErrorForNode(entryCode, node);
      // });
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
    LintCode code,
    String id,
  ) {
    context.registry.addSimpleIdentifier((node) {
      final name = node.name;
      if (name != id) {
        return;
      }

      reporter.reportErrorForNode(code, node);
    });

    context.registry.addDeclaredIdentifier((node) {
      final name = node.name.lexeme;
      if (name != id) {
        return;
      }

      reporter.reportErrorForNode(code, node);
    });
  }

  void banClassName(
    LintCode code,
    String className,
  ) {
    context.registry.addSimpleIdentifier((node) {
      switch (node) {
        case SimpleIdentifier(:final staticType?):
          final nodeTypeName =
              staticType.getDisplayString(withNullability: false);
          if (nodeTypeName != className) {
            return;
          }
        case SimpleIdentifier(:final staticElement?):
          final nodeElementName = staticElement.name;
          if (nodeElementName != className) {
            return;
          }

          if (node.parent is ConstructorDeclaration) {
            return;
          }
        default:
          return;
      }

      reporter.reportErrorForNode(code, node);
    });

    context.registry.addNamedType((node) {
      final parentTypeName = node.name2.lexeme;
      if (parentTypeName != className) {
        return;
      }

      reporter.reportErrorForNode(code, node);
    });
  }

  void banPackage(LintCode entryCode, String package) {
    context.registry.addSimpleIdentifier((node) {
      final parentSource = node.staticElement?.librarySource;
      final parentSourceName = parentSource?.uri.toString();
      if (!_matchesPackage(parentSourceName, package)) {
        return;
      }

      if (node.parent is ConstructorDeclaration) {
        return;
      }

      reporter.reportErrorForNode(entryCode, node);
    });

    context.registry.addNamedType((node) {
      final parentSource = node.element?.librarySource;
      final parentSourceName = parentSource?.uri.toString();
      if (!_matchesPackage(parentSourceName, package)) {
        return;
      }

      reporter.reportErrorForNode(entryCode, node);
    });
  }
}
