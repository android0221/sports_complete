import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_complete/features/fifa/blocs/world_ranking/world_ranking_cubit.dart';
import 'package:sports_complete/features/fifa/entities/entities.dart';
import 'package:sports_complete/features/fifa/repositories/fifa_repository.dart';
import 'package:sports_complete/features/fifa/widgets/widgets.dart';
import 'package:sports_complete/services/server_api.dart';
import 'package:sports_complete/utils/utils.dart';
import 'package:sports_complete/widgets/widgets.dart';

class FifaPage extends StatefulWidget {
  final Gender gender;

  const FifaPage({Key? key, required this.gender}) : super(key: key);

  @override
  State<FifaPage> createState() => _FifaPageState();
}

class _FifaPageState extends State<FifaPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => WorldRankingCubit(
        repository: FifaRepository(serverApi: context.read<ServerApi>()),
        gender: widget.gender,
      )..fetch(),
      child: Column(
        children: [
          const RankingTitle(),
          Expanded(
            child: BlocConsumer<WorldRankingCubit, WorldRankingState>(
              listener: (context, state) {
                if (state is WorldRankingLoadFailure) {
                  Toast.show(state.message);
                }
              },
              builder: (context, state) {
                if (state is WorldRankingLoadSucess) {
                  return ListView.builder(
                    itemCount: state.rankings.length,
                    itemBuilder: (_, index) => RankingRow(
                      state.rankings[index],
                      backgroundColor: index.isEven
                          ? Colors.transparent
                          : Theme.of(context).dividerColor,
                    ),
                  );
                }
                if (state is WorldRankingLoadInProgress) {
                  return const Loading();
                }
                if (state is WorldRankingLoadFailure) {
                  return ErrorRetry(
                    onRetry: () => context.read<WorldRankingCubit>().fetch(),
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
