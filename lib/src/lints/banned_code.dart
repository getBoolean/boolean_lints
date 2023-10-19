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

    // TODO: Check id works for fields/getters/global vars/global methods

    // TODO: only id
    // TODO: only className
    // TODO: only package
    // TODO: only className and package
    // TODO: only id and package
    // only id and className
    // id and className and package
    final BannedCodeOption(:entries, :severity) = options.rules.bannedCode;
    final lintCode = code.copyWith(errorSeverity: severity);
    for (final entry in entries) {
      final EntryOption(:id, :className, :package, :severity, :reason) = entry;
      final entryCode =
          lintCode.copyWith(errorSeverity: severity, problemMessage: reason);

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
          break;
        case EntryOption(:final className?):
          break;
        case EntryOption(:final id?):
          break;

        // all null
        case EntryOption():
          break;
      }

      // lint the node if the id matches for method calls
      context.registry.addSimpleIdentifier((node) {
        final name = node.name;
        if (name != id) {
          return;
        }

        if (className != null) {
          final parent = node.parent;
          final parentEntity =
              parent!.childEntities.firstWhere((element) => element != node);
          if (parentEntity is SimpleIdentifier) {
            final parentType = parentEntity.staticType;
            final parentElement = parentEntity.staticElement;
            final parentSource = parentElement?.librarySource;
            if (package != null) {
              final parentSourceName = parentSource?.uri.toString();
              if (!matchesPackage(parentSourceName, package)) {
                return;
              }
            }

            if (parentType != null) {
              final parentTypeName =
                  parentType.getDisplayString(withNullability: false);
              if (parentTypeName != className) {
                return;
              }
            } else if (parentElement != null) {
              final parentElementName = parentElement.name;
              if (parentElementName != className) {
                return;
              }
            } else {
              return;
            }
          } else if (parentEntity is NamedType) {
            final parentTypeName = parentEntity.name2.lexeme;
            final parentSource = parentEntity.element?.librarySource;
            if (package != null) {
              final parentSourceName = parentSource?.uri.toString();
              if (!matchesPackage(parentSourceName, package)) {
                return;
              }
            }

            if (parentTypeName != className) {
              return;
            }
          } else {
            return;
          }
        }

        // check if the package name matches the node's source file package

        reporter.reportErrorForNode(entryCode, node);
      });
    }
  }

  bool matchesPackage(String? parentSourceName, String package) {
    return parentSourceName?.startsWith('package:$package') ?? false;
  }

  @override
  List<Fix> getFixes() => [];
}
