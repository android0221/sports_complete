import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../../../services/server_api.dart';
import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';
import '../blocs/ranking/ranking_cubit.dart';
import '../repositories/ranking_repository.dart';
import '../widgets/widgets.dart';

class RankingPage extends StatefulWidget {
  final String apiUrl;

  const RankingPage({Key? key, required this.apiUrl}) : super(key: key);

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => RankingCubit(
        repository: RankingRepository(serverApi: context.read<ServerApi>()),
        apiUrl: widget.apiUrl,
      )..fetch(),
      child: BlocConsumer<RankingCubit, RankingState>(
        listener: (context, state) {
          if (state is RankingLoadFailure) {
            Toast.show(state.message);
          }
        },
        builder: (context, state) {
          if (state is RankingLoadSuccess) {
            return Column(
              children: [
                GridHeader(
                  titles: [
                    '排名',
                    '球队',
                    '胜/负',
                    '胜率',
                    if (state.hasDifference) '胜差',
                    '近况'
                  ],
                  flexes: const [1, 2, 1, 1, 1, 1],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.groups.length,
                    itemBuilder: (_, index) {
                      final group = state.groups[index];
                      return StickyHeader(
                        header: GridSticky(group.title),
                        content: ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: group.rankings.length,
                          itemBuilder: (_, rankingIndex) {
                            return RankingRow(
                              index: rankingIndex,
                              ranking: group.rankings[rankingIndex],
                              hasDifference: group.hasDifference,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          if (state is RankingLoadInProgress) {
            return const Loading();
          }
          if (state is RankingLoadFailure) {
            return ErrorRetry(
              onRetry: () => context.read<RankingCubit>().fetch(),
            );
          }
          return Container();
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
