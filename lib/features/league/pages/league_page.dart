import 'package:flutter/material.dart';

import '../../data/entities/entities.dart';
import '../../fifa/entities/entities.dart';
import '../../fifa/pages/fifa_page.dart';
import '../../ranking/pages/ranking_page.dart';
import '../../schedule/pages/schedule_page.dart';

class LeaguePage extends StatelessWidget {
  final League league;

  const LeaguePage(this.league, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: league.tabTypes.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(league.name),
          bottom: TabBar(
            isScrollable: league.tabTypes.length > 4,
            indicator: BoxDecoration(color: Theme.of(context).backgroundColor),
            enableFeedback: false,
            indicatorWeight: 0,
            tabs: league.tabTypes.map((e) => Tab(text: e.name)).toList(),
          ),
        ),
        body: TabBarView(children: pages),
      ),
    );
  }

  List<Widget> get pages {
    if (league.name == 'FIFA') {
      return const [
        FifaPage(gender: Gender.male),
        FifaPage(gender: Gender.female),
      ];
    }
    return league.tabTypes.map((e) {
      switch (e.name) {
        case '赛程':
          return SchedulePage(apiUrl: e.apiUrl);
        case '排名':
          return RankingPage(apiUrl: e.apiUrl);
        default:
          return Text(e.name);
      }
    }).toList();
  }
}
