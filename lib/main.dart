import 'package:empty_template/bootstrap.dart';
import 'package:empty_template/l10n/arb/app_localizations.dart';
import 'package:empty_template/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await bootstrap(() => const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), // Standard mobile frame
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'MemoryMap',
          debugShowCheckedModeBanner: false,

          // Theme settings matching the respectful design system (Slate / Emerald / Gold)
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.deepEmerald,
              primary: AppColors.emerald,
              secondary: AppColors.gold,
              brightness: Brightness.dark,
              surface: AppColors.slate800,
            ),
            scaffoldBackgroundColor: AppColors.slate900,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.slate900,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white),
            ),
          ),

          // Router configuration
          routerConfig: appRouter,

          // Localization delegates
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('uk'), // Default locale set to Ukrainian
        );
      },
    );
  }
}
