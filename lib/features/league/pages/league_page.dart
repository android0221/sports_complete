import 'package:flutter/material.dart';
import 'package:sports_complete/features/home/entities/entities.dart';

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
      ),
    );
  }
}