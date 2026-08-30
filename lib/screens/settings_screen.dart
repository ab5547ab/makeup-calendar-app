import 'package:flutter/material.dart';
import '../services/wifi_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _ssidController = TextEditingController();
  final _passwordController = TextEditingController();
  final _syncUrlController = TextEditingController();
  bool _isSyncing = false;

  void _startSync() async {
    setState(() => _isSyncing = true);
    
    bool connected = await WifiService.connectAndSync(
      ssid: _ssidController.text,
      password: _passwordController.text,
    );

    if (mounted) {
      setState(() => _isSyncing = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(connected ? 'הסנכרון הושלם בהצלחה' : 'שגיאה בחיבור לרשת'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('הגדרות סנכרון')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _syncUrlController,
              decoration: const InputDecoration(labelText: 'כתובת לסנכרון נתונים (GitHub Path)'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _ssidController,
              decoration: const InputDecoration(labelText: 'שם רשת Wi-Fi (SSID)'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'סיסמת Wi-Fi'),
            ),
            const SizedBox(height: 24),
            _isSyncing
                ? const CircularProgressIndicator()
                : ElevatedButton.icon(
                    onPressed: _startSync,
                    icon: const Icon(Icons.sync),
                    label: const Text('סנכרן כעת'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
