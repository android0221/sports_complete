import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sports_complete/features/home/blocs/leagues/leagues_cubit.dart';
import 'package:sports_complete/features/home/repositories/leagues_repository.dart';
import 'package:sports_complete/features/home/widgets/widgets.dart';
import 'package:sports_complete/services/server_api.dart';
import 'package:sports_complete/utils/utils.dart';
import 'package:sports_complete/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LeaguesCubit(
        repository: LeaguesRepository(serverApi: context.read<ServerApi>()),
      )..fetch(),
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.appTitle)),
        body: BlocConsumer<LeaguesCubit, LeaguesState>(
          listener: (context, state) {
            if (state is LeaguesLoadFailure) {
              Toast.show(state.message);
            }
          },
          builder: (context, state) {
            if (state is LeaguesLoadSuccess) {
              return GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                padding: const EdgeInsets.all(16),
                children: state.leagues.map((e) => LeagueItem(e)).toList(),
              );
            }
            if (state is LeaguesLoadInProgress) {
              return const Loading();
            }
            if (state is LeaguesLoadFailure) {
              return ErrorRetry(
                onRetry: () => context.read<LeaguesCubit>().fetch(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
