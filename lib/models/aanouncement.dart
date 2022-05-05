import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Announcement with ChangeNotifier {
  final String description;
  final String clubid;

  Announcement({
    required this.clubid,
    required this.description,
  });
}

class AnnouncementList with ChangeNotifier {
  List<Announcement> _items = [];

  List<Announcement> get items {
    return [..._items];
  }

  Future<void> addAnnouncement(
      String description, String token, String id) async {
    var url = Uri.parse("http://10.0.1.60:3000/announcement");
    http.post(
      url,
      body: json.encode({'description': description, 'clubid': id}),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
    ).then((response) {
      var decodedResponse = json.decode(response.body) as Map;
      final announcement = Announcement(
        clubid: decodedResponse['owner'],
        description: decodedResponse['description'],
      );
      _items.add(announcement);
      notifyListeners();
    });
  }
}
