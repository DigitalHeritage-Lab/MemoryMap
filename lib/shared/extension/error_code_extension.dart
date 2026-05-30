import 'package:flutter/widgets.dart';
import 'package:memory_map/l10n/l10n.dart';

/// Extension that converts a BLoC error-code string (e.g. 'requiredField')
/// into a localized human-readable message.
///
/// Usage:
/// ```dart
/// state.nameError.toLocalizedError(context)
/// ```
extension ErrorCodeExtension on String? {
  String? toLocalizedError(BuildContext context) {
    if (this == null) return null;
    final l10n = context.l10n;
    switch (this) {
      case 'requiredField':
        return l10n.requiredField;
      case 'fullNameTooShort':
        return l10n.fullNameTooShort;
      case 'invalidDate':
        return l10n.invalidDate;
      case 'invalidDateRange':
        return l10n.invalidDateRange;
      case 'dateInFuture':
        return l10n.dateInFuture;
      case 'invalidLifespan':
        return l10n.invalidLifespan;
      case 'coordinatesTooFar':
        return l10n.coordinatesTooFar;
      default:
        return null;
    }
  }
}
