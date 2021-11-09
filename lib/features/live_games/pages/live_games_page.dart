import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LiveGamesPage extends StatefulWidget {
  const LiveGamesPage({Key? key}) : super(key: key);

  @override
  State<LiveGamesPage> createState() => _LiveGamesPageState();
}

class _LiveGamesPageState extends State<LiveGamesPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.liveGames)),
      body: const Center(child: Text('Comming soon')),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
