import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../services/server_api.dart';
import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';
import '../blocs/news/news_cubit.dart';
import '../repositories/news_repository.dart';
import '../widgets/widgets.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => NewsCubit(
        repository: NewsRepository(serverApi: context.read<ServerApi>()),
      )..fetch(),
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.news)),
        body: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {
            if (state is NewsLoadFailure) {
              Toast.show(state.message);
            }
          },
          builder: (context, state) {
            if (state is NewsLoadSuccess) {
              final topNewsList = state.topNewsList;
              final normalNewsList = state.normalNewsList;
              final itemCount =
                  normalNewsList.length + (topNewsList.isNotEmpty ? 1 : 0);
              return ListView.builder(
                  itemBuilder: (_, index) => index == 0
                      ? NewsCarouselSlider(topNewsList)
                      : NewsWidget(
                          normalNewsList[
                              index - (topNewsList.isNotEmpty ? 1 : 0)],
                        ),
                  itemCount: itemCount);
            }
            if (state is NewsLoadInProgress) {
              return const Loading();
            }
            if (state is NewsLoadFailure) {
              return ErrorRetry(
                onRetry: () => context.read<NewsCubit>().fetch(),
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
