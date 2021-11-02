import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sports_complete/features/home/pages/home_page.dart';
import 'package:sports_complete/services/server_api.dart';

/// The Widget that configures your application.
class SportsCompleteApp extends StatelessWidget {
  const SportsCompleteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ServerApi(),
      child: MaterialApp(
        // Providing a restorationScopeId allows the Navigator built by the
        // MaterialApp to restore the navigation stack when a user leaves and
        // returns to the app after it has been killed while running in the
        // background.
        restorationScopeId: 'app',

        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('zh', 'CN'),
        ],

        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context)!.appTitle,

        theme: ThemeData(appBarTheme: _appBarTheme),
        darkTheme: ThemeData.dark().copyWith(appBarTheme: _appBarTheme),
        themeMode: ThemeMode.dark,
        home: const HomePage(),
      ),
    );
  }

  AppBarTheme get _appBarTheme => const AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(fontSize: 20),
      );
}
