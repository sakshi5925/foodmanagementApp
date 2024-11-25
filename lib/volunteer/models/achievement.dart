import 'package:flutter/cupertino.dart';

class Achievement {
  final String name;
  final String description;
  final DateTime date;
  final IconData icon;

  Achievement({
    required this.name,
    required this.description,
    required this.date,
    required this.icon,
  });
} 