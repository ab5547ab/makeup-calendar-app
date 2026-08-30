import 'package:flutter/services.dart';

class WifiService {
  static const platform = MethodChannel('com.example.app/wifi');

  static Future<bool> connectAndSync({
    required String ssid,
    required String password,
  }) async {
    try {
      final String result = await platform.invokeMethod('connectAndSync', {
        'ssid': ssid,
        'password': password,
      });
      return result == "CONNECTED";
    } on PlatformException {
      return false;
    }
  }
}
