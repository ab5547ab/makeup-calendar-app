import 'package:flutter/material.dart';

class Appointment {
  final String id;
  final String clientName;
  final String phone;
  final DateTime dateTime;
  final int durationMinutes;
  final String category;
  final double price;
  final String notes;
  final String clientHistoryNotes; // הערות היסטוריות ורגישויות

  Appointment({
    required this.id,
    required this.clientName,
    required this.phone,
    required this.dateTime,
    required this.durationMinutes,
    required this.category,
    required this.price,
    required this.notes,
    this.clientHistoryNotes = '',
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'clientName': clientName,
    'phone': phone,
    'dateTime': dateTime.toIso8601String(),
    'durationMinutes': durationMinutes,
    'category': category,
    'price': price,
    'notes': notes,
    'clientHistoryNotes': clientHistoryNotes,
  };

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
    id: json['id'],
    clientName: json['clientName'],
    phone: json['phone'],
    dateTime: DateTime.parse(json['dateTime']),
    durationMinutes: json['durationMinutes'],
    category: json['category'],
    price: (json['price'] as num).toDouble(),
    notes: json['notes'] ?? '',
    clientHistoryNotes: json['clientHistoryNotes'] ?? '',
  );

  static Color getCategoryColor(String category) {
    switch (category) {
      case 'כלה': return const Color(0xFFD4AF37); // זהב עתיק
      case 'ערב': return const Color(0xFF4A1525); // שזיף עמוק
      case 'יומיומי': return const Color(0xFFD8A7B1); // אבן-ורד
      case 'צילומים': return const Color(0xFF5B7B88); // כחול-אפור
      case 'קורס': return const Color(0xFF6B7A59); // ירוק זית
      default: return const Color(0xFF8D7B68);
    }
  }
}
