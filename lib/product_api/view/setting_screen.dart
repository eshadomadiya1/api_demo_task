import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Icon(
                Icons.settings,
                size: 144,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Version 1.0.0'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.shop),
              title: Text('About Us'),
            ),

          ],
        ),
      ),
    );
  }
}