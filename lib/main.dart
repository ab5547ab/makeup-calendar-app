import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/calendar_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MakeupCalendarApp());
}

class MakeupCalendarApp extends StatelessWidget {
  const MakeupCalendarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'יומן עבודה וניהול תורים',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      locale: const Locale('he', 'IL'),
      supportedLocales: const [Locale('he', 'IL')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const CalendarScreen(),
    );
  }
}
