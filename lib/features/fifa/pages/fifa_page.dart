import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_complete/features/fifa/blocs/world_ranking/world_ranking_cubit.dart';
import 'package:sports_complete/features/fifa/entities/entities.dart';
import 'package:sports_complete/features/fifa/repositories/fifa_repository.dart';
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
          const GridHeader(
            titles: [
              '世界排名',
              '国家/地区',
              '排名变化',
              '积分情况',
              '积分变化',
            ],
          ),
          Expanded(
            child: BlocConsumer<WorldRankingCubit, WorldRankingState>(
              listener: (context, state) {
                if (state is WorldRankingLoadFailure) {
                  Toast.show(state.message);
                }
              },
              builder: (context, state) {
                if (state is WorldRankingLoadSucess) {
                  return _View(state.rankings);
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

class _View extends StatelessWidget {
  final List<WorldRanking> rankings;

  const _View(this.rankings, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rankings.length,
      itemBuilder: (_, index) => GridRow(
        index: index,
        children: [
          GridTextCell(rankings[index].ranking),
          GridLogoCell(
            text: rankings[index].countryName,
            logoUrl: rankings[index].logoUrl,
            logoFirst: true,
          ),
          GridTextCell(rankings[index].rankingChange),
          GridTextCell(rankings[index].points),
          GridTextCell(rankings[index].pointsChange),
        ],
      ),
    );
  }
}
