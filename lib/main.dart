import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_animelist/config/localization/app_locales.dart';
import 'package:kraken_animelist/config/routes/routes.dart';
import 'package:kraken_animelist/core/constants/api_constants.dart';
import 'package:kraken_animelist/core/services/localization_service.dart';
import 'package:kraken_animelist/core/services/navigate.dart';
import 'package:kraken_animelist/features/anime/presentation/bloc/anime/anime_bloc.dart';
import 'package:kraken_animelist/features/anime/presentation/bloc/anime/anime_event.dart';
import 'package:kraken_animelist/features/anime/presentation/bloc/characters/characters_bloc.dart';
import 'package:kraken_animelist/features/anime/presentation/pages/home/anime_list.dart';

import 'config/theme/app_themes.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();

  await initializeDependencies();

  final deviceLocale = Locale(ui.window.locale.languageCode);
  runApp(
    EasyLocalization(
      supportedLocales: LocalizationService.supportedLanguages,
      path: LocalizationService.path,
      fallbackLocale: deviceLocale,
      useOnlyLangCode: true,
      child: const MyApp(),
    ),
  );
}

Future<void> initialize() async {
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  await EasyLocalization.ensureInitialized();
  LocalizationService.initialize(AppLocales.supportedLocales);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AnimeListBloc>(
          create: (context) => sl()
            ..add(GetAnimeList(
                page: ApiConstants.defaultPage,
                limit: ApiConstants.defaultLimit)),
        ),
        BlocProvider<CharactersBloc>(
          create: (context) => sl(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        navigatorKey: Navigate.navigatorKey,
        home: const AnimeList(),
      ),
    );
  }
}
