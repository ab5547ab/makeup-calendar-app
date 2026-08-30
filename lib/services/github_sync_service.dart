import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/appointment_model.dart';

class StorageService {
  static const String _storageKey = 'appointments_data';

  // שמירת כל התורים בזיכרון המקומי של המכשיר
  static Future<void> saveLocalAppointments(List<Appointment> list) async {
    final prefs = await SharedPreferences.getInstance();
    final String encoded = jsonEncode(list.map((a) => a.toJson()).toList());
    await prefs.setString(_storageKey, encoded);
  }

  // טעינת התורים מהזיכרון המקומי
  static Future<List<Appointment>> loadLocalAppointments() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString(_storageKey);
    if (data == null) return [];
    
    final List decoded = jsonDecode(data);
    return decoded.map((item) => Appointment.fromJson(item)).toList();
  }
}
