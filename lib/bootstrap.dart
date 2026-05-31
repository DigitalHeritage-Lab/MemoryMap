import 'dart:developer' show log;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart'
    show Colors, Widget, WidgetsFlutterBinding, runApp;
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:memory_map/shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)', name: 'Bootstrap');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log(
      'Bloc Error Runtime Type - ${bloc.runtimeType}',
      error: error,
      stackTrace: stackTrace,
      name: 'Bootstrap',
    );
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(Widget Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  await Supabase.initialize(
    url: const String.fromEnvironment('SUPABASE_URL'),
    anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
  );

  // Sign in anonymously if not already authenticated.
  // This allows rpc_add_grave to use auth.uid() securely.
  // Requires "Anonymous sign-ins" enabled in Supabase Dashboard →
  // Authentication → Providers → Anonymous.
  final session = Supabase.instance.client.auth.currentSession;
  if (session == null) {
    try {
      await Supabase.instance.client.auth.signInAnonymously();
    } on Object catch (e, st) {
      log(
        'Anonymous sign-in skipped (enable in Supabase Dashboard)',
        error: e,
        stackTrace: st,
        name: 'Bootstrap',
      );
    }
  }

  Bloc.observer = const AppBlocObserver();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  configureDependencies();

  runApp(builder());
}
