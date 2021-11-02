import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sports_complete/features/home/widgets/sport_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.appTitle)),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        padding: const EdgeInsets.all(16),
        children: const [
          SportItem(text: 'NBA', iconPath: 'assets/nba.png'),
          SportItem(text: 'CBA', iconPath: 'assets/nba.png'),
        ],
      ),
    );
  }
}
