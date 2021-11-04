import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sports_complete/features/schedule/blocs/schedule/schedule_cubit.dart';
import 'package:sports_complete/features/schedule/entities/entities.dart';
import 'package:sports_complete/features/schedule/repositories/schedule_repository.dart';
import 'package:sports_complete/features/schedule/widgets/widgets.dart';
import 'package:sports_complete/services/server_api.dart';
import 'package:sports_complete/utils/utils.dart';
import 'package:sports_complete/widgets/widgets.dart';
import 'package:sticky_headers/sticky_headers.dart';

class SchedulePage extends StatefulWidget {
  final String apiUrl;

  const SchedulePage({Key? key, required this.apiUrl}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => ScheduleCubit(
        repository: ScheduleRepository(serverApi: context.read<ServerApi>()),
        apiUrl: widget.apiUrl,
      )..fetch(),
      child: BlocConsumer<ScheduleCubit, ScheduleState>(
        listener: (context, state) {
          if (state is ScheduleLoadFailure) {
            Toast.show(state.message);
          }
        },
        builder: (context, state) {
          if (state is ScheduleLoadSuccess) {
            return _View(state.schedules);
          }
          if (state is ScheduleLoadInProgress) {
            return const Loading();
          }
          if (state is ScheduleLoadFailure) {
            return ErrorRetry(
              onRetry: () => context.read<ScheduleCubit>().fetch(),
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

class _View extends StatelessWidget {
  final Schedules schedules;

  const _View(this.schedules, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridHeader(
          titles: [
            '时间',
            '客队',
            '比分',
            '主队',
            if (schedules.hasGameType) '赛事',
          ],
        ),
        Expanded(
          child: ScrollablePositionedList.builder(
            initialScrollIndex: schedules.position,
            itemCount: schedules.schedules.length,
            itemBuilder: (_, index) {
              final schedule = schedules.schedules[index];
              return StickyHeader(
                header: DateTitle(schedule.date),
                content: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: schedule.games.length,
                  itemBuilder: (_, gameIndex) {
                    return GameRow(
                      index: gameIndex,
                      game: schedule.games[gameIndex],
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
}
