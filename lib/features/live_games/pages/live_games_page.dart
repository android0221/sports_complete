import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../services/server_api.dart';
import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';
import '../blocs/live_games/live_games_cubit.dart';
import '../repositoires/live_games_repository.dart';
import 'live_games_view.dart';

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
    return DefaultTabController(
      length: 5,
      child: BlocProvider(
        create: (context) => LiveGamesCubit(
          repository: LiveGamesRepository(serverApi: context.read<ServerApi>()),
        )..fetchGames(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.liveGames),
            bottom: TabBar(
              indicator: BoxDecoration(
                color: Theme.of(context).backgroundColor,
              ),
              tabs: const [
                Tab(text: '全部'),
                Tab(text: '重要'),
                Tab(text: '足球'),
                Tab(text: '篮球'),
                Tab(text: '电竞'),
              ],
            ),
          ),
          body: BlocConsumer<LiveGamesCubit, LiveGamesState>(
            listener: (context, state) {
              if (state is LiveGamesLoadFailure) {
                Toast.show(state.message);
              }
            },
            builder: (context, state) {
              if (state is LiveGamesLoadSuccess) {
                return TabBarView(
                  children: [
                    LiveGamesView(
                      state.games,
                      gamesGetter: (liveGames) => liveGames.games,
                    ),
                    LiveGamesView(
                      state.games,
                      gamesGetter: (liveGames) => liveGames.important,
                    ),
                    LiveGamesView(
                      state.games,
                      gamesGetter: (liveGames) => liveGames.football,
                    ),
                    LiveGamesView(
                      state.games,
                      gamesGetter: (liveGames) => liveGames.basketball,
                    ),
                    LiveGamesView(
                      state.games,
                      gamesGetter: (liveGames) => liveGames.game,
                    ),
                  ],
                );
              }
              if (state is LiveGamesLoadInProgress) {
                return const Loading();
              }
              if (state is LiveGamesLoadFailure) {
                return ErrorRetry(
                  onRetry: () => context.read<LiveGamesCubit>().fetchGames(),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
