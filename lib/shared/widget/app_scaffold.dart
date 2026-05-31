import 'package:flutter/material.dart';
import 'package:memory_map/shared/constants/theme/app_colors.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    super.key,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.resizeToAvoidBottomInset = true,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppColors.slate900, // Slate 900 (slate/charcoal background)
      appBar: appBar != null
          ? PreferredSize(
              preferredSize: appBar!.preferredSize,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.slate700, // Slate 700 divider
                      width: 0.5,
                    ),
                  ),
                ),
                child: appBar,
              ),
            )
          : null,
      body: SafeArea(
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar != null
          ? Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppColors.slate700, // Slate 700 divider
                    width: 0.5,
                  ),
                ),
              ),
              child: bottomNavigationBar,
            )
          : null,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}
