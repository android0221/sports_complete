import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sports_complete/features/home/pages/home_page.dart';
import 'package:sports_complete/features/settings/blocs/theme_mode/theme_mode_cubit.dart';
import 'package:sports_complete/services/server_api.dart';

class SportsCompleteApp extends StatelessWidget {
  const SportsCompleteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ServerApi(),
      child: BlocProvider(
        create: (context) => ThemeModeCubit(),
        child: BlocBuilder<ThemeModeCubit, ThemeMode>(
          builder: (context, state) {
            return MaterialApp(
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
              builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: child!,
              ),
              onGenerateTitle: (BuildContext context) =>
                  AppLocalizations.of(context)!.appTitle,
              theme: ThemeData(
                appBarTheme: _appBarTheme,
                dividerTheme: _dividerTheme,
              ),
              darkTheme: ThemeData.dark().copyWith(
                appBarTheme: _appBarTheme,
                dividerTheme: _dividerTheme,
              ),
              themeMode: state,
              home: const HomePage(),
            );
          },
        ),
      ),
    );
  }

  AppBarTheme get _appBarTheme => const AppBarTheme(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        titleTextStyle: TextStyle(fontSize: 20),
      );

  DividerThemeData get _dividerTheme => const DividerThemeData(space: 0);
}
