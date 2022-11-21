import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text('settings page')),
        body: SettingsList(sections: [
      SettingsSection(
        title: Text('Section'),
        tiles: [
          SettingsTile(
              title: Text('notifications'),
              leading: Icon(Icons.notifications),
              onPressed: (BuildContext context) {}),
        ],
      ),
    ]));
  }
}