import 'package:flutter/material.dart';
import 'settings_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  int _selectedView = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('ניהול יומן עבודה')),
            );
          },
          child: const Text(
            'סטודיו לאיפור',
            style: TextStyle(fontFamily: 'FrankRuhlLibre', fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          SegmentedButton<int>(
            segments: const [
              ButtonSegment(value: 0, label: Text('חודש')),
              ButtonSegment(value: 1, label: Text('שבוע')),
              ButtonSegment(value: 2, label: Text('יום')),
            ],
            selected: {_selectedView},
            onSelectionChanged: (Set<int> newSelection) {
              setState(() {
                _selectedView = newSelection.first;
              });
            },
          ),
          const Expanded(
            child: Center(
              child: Text('תצוגת לוח שנה', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
