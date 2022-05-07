import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Announcement with ChangeNotifier {
  final String description;
  final String clubid;
  final String timestamp;
  final String id;

  Announcement({
    required this.clubid,
    required this.description,
    required this.timestamp,
    required this.id,
  });
}

class AnnouncementList with ChangeNotifier {
  List<Announcement> _items = [];

  List<Announcement> get items {
    final ids = Set();
    _items.retainWhere((x) => ids.add(x.id));
    return [..._items];
  }

  Future<void> addAnnouncement(
      String description, String token, String id) async {
    var url = Uri.parse("http://10.0.1.60:3000/announcement");
    http.post(
      url,
      body: json.encode({
        'description': description,
        'clubid': id,
        'createdAt': DateTime.now().toString()
      }),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
    ).then((response) {
      var decodedResponse = json.decode(response.body) as Map;
      print(decodedResponse);
      final announcement = Announcement(
        clubid: decodedResponse['owner'],
        description: decodedResponse['description'],
        timestamp: decodedResponse['createdAt'],
        id: decodedResponse['_id'],
      );
      _items.add(announcement);
      notifyListeners();
    });
  }

  Future<void> clubannouncements(String clubid) async {
    var url = Uri.parse("http://10.0.1.60:3000/getClubAnnouncement/$clubid");
    var res = await http.get(url);
    final decodedresponse = json.decode(res.body) as List;
    print(decodedresponse);
    decodedresponse.forEach((element) {
      final announcement = Announcement(
        clubid: element['owner'],
        description: element['description'],
        timestamp: element['createdAt'],
        id: element['_id'],
      );
      _items.add(announcement);
      notifyListeners();
    });
  }
}
