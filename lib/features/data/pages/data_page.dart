import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../services/server_api.dart';
import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';
import '../blocs/leagues/leagues_cubit.dart';
import '../repositories/leagues_repository.dart';
import '../widgets/widgets.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => LeaguesCubit(
        repository: LeaguesRepository(serverApi: context.read<ServerApi>()),
      )..fetch(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.dataPageTitle),
        ),
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

  @override
  bool get wantKeepAlive => true;
}
