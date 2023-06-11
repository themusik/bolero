import 'package:bolero/views/settings/heatmapColor.view.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text('settings page')),
        body: SettingsList(sections: [
      SettingsSection(
        title: const Text('Section'),
        tiles: [
          SettingsTile(
              title: const Text('notifications'),
              leading: const Icon(Icons.notifications),
              onPressed: (BuildContext context) {}),
          SettingsTile.navigation(
              title: const Text('color'),
              leading: const Icon(Icons.color_lens),
              onPressed: (BuildContext context) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HeatmapColorView()));
              }),
        ],
      ),
    ]));
  }
}
