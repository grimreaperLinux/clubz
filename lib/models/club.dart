import 'package:flutter/foundation.dart';

class Club with ChangeNotifier {
  final String clubpic;
  final String name;
  final String description;
  final String type;

  Club({
    required this.clubpic,
    required this.name,
    required this.description,
    required this.type,
  });
}
