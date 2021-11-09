import 'package:flutter/material.dart';

import '../../settings/pages/setttings_page.dart';

class SettingIcon extends StatelessWidget {
  const SettingIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingsPage()),
      ),
      icon: const Icon(Icons.settings),
    );
  }
}
