import 'package:clubz/models/anouncement.dart';
import 'package:clubz/widgets/announcement.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/club.dart';
import '../models/user.dart';

class ClubAnnouncementScreen extends StatefulWidget {
  static const routename = '/clubannouncements';

  @override
  State<ClubAnnouncementScreen> createState() => _ClubAnnouncementScreenState();
}

class _ClubAnnouncementScreenState extends State<ClubAnnouncementScreen> {
  var _isinit = true;
  @override
  void didChangeDependencies() {
    final club = ModalRoute.of(context)!.settings.arguments as Club;
    // final announcements = Provider.of<AnnouncementList>(context);
    if (_isinit) {
      Provider.of<AnnouncementList>(context).clubannouncements(club.id);
      Provider.of<UserList>(context).getallusers();
    }
    _isinit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double widthofscreen = MediaQuery.of(context).size.width;
    double heightofscreen = MediaQuery.of(context).size.height;
    final announcements = Provider.of<AnnouncementList>(context).items;
    final club = ModalRoute.of(context)!.settings.arguments as Club;
    final clubannouncements =
        announcements.where((element) => element.clubid == club.id).toList();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: widthofscreen * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, heightofscreen * 0.15,
                    widthofscreen * 0.4, heightofscreen * 0.04),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Notifications',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              clubannouncements.isEmpty
                  ? const Center(
                      child: Text(
                        'No Announcements',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  : Column(
                      children: [
                        ...clubannouncements.map(
                          (item) => ChangeNotifierProvider.value(
                            value: item,
                            child: AnnouncementCard(owner: club.owner),
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
