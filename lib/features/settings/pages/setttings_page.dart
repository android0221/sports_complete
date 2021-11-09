import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../blocs/theme_mode/theme_mode_cubit.dart';
import 'theme_mode_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const _items = [
    DarkModeItem(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsPageTitle),
      ),
      body: ListView.separated(
        itemBuilder: (_, index) => _items[index],
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemCount: 1,
      ),
    );
  }
}

class DarkModeItem extends StatelessWidget {
  const DarkModeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('深色模式'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<ThemeModeCubit, ThemeMode>(
            builder: (context, state) {
              var text = '跟随系统';
              if (state == ThemeMode.light) {
                text = '已关闭';
              } else if (state == ThemeMode.dark) {
                text = '已开启';
              }
              return Text(text);
            },
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ThemeModePage()),
      ),
    );
  }
}
