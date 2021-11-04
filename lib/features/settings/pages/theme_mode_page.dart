import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sports_complete/features/settings/blocs/theme_mode/theme_mode_cubit.dart';

class ThemeModePage extends StatelessWidget {
  const ThemeModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.themeModePageTitle),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('跟随系统'),
            subtitle: const Text('开启后，将跟随系统打开或关闭深色模式'),
            trailing: BlocBuilder<ThemeModeCubit, ThemeMode>(
              builder: (context, state) {
                return Switch.adaptive(
                  value: state == ThemeMode.system,
                  onChanged: (isDarkMode) =>
                      context.read<ThemeModeCubit>().toggleSystemMode(),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          const _ModeSelection(),
        ],
      ),
    );
  }
}

class _ModeSelection extends StatelessWidget {
  const _ModeSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeCubit, ThemeMode>(
      builder: (context, state) {
        if (state == ThemeMode.system) {
          return const SizedBox.shrink();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('手动选择'),
            ),
            _ModeTile(
              mode: ThemeMode.light,
              isSelected: state == ThemeMode.light,
            ),
            const Divider(),
            _ModeTile(
              mode: ThemeMode.dark,
              isSelected: state == ThemeMode.dark,
            ),
          ],
        );
      },
    );
  }
}

class _ModeTile extends StatelessWidget {
  final ThemeMode mode;
  final bool isSelected;

  const _ModeTile({
    Key? key,
    required this.mode,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_title),
      trailing: isSelected
          ? Icon(
              Icons.check,
              color: Theme.of(context).toggleableActiveColor,
            )
          : const SizedBox.shrink(),
      onTap: () => context.read<ThemeModeCubit>().changeTo(mode),
    );
  }

  String get _title => mode == ThemeMode.light ? '普通模式' : '深色模式';
}
