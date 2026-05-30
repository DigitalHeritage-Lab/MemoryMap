import 'package:flutter/material.dart';
import 'package:memory_map/l10n/l10n.dart';
import 'package:memory_map/shared/shared.dart';

class GraveDatesWidget extends StatelessWidget {
  const GraveDatesWidget({
    required this.grave,
    this.datesStyle,
    this.lifespanStyle,
    this.centerAlign = false,
    super.key,
  });

  final Grave grave;
  final TextStyle? datesStyle;
  final TextStyle? lifespanStyle;
  final bool centerAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          centerAlign ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          '${grave.birthDate}  —  ${grave.deathDate}',
          style: datesStyle ??
              const TextStyle(
                color: AppColors.slate400,
                fontSize: 13,
              ),
        ),
        if (grave.lifespan != null)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              context.l10n.yearsOld(grave.lifespan!),
              style: lifespanStyle ??
                  const TextStyle(
                    color: AppColors.slate500,
                    fontSize: 12,
                  ),
            ),
          ),
      ],
    );
  }
}
