import 'package:clubz/screens/club_announcements_screen.dart';
import 'package:clubz/widgets/createannouncement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../models/club.dart';
import '../../models/user.dart';

class DetailsScreen extends StatelessWidget {
  static const routename = '/details';

  Widget button(onpress, String text) {
    return ElevatedButton(
      onPressed: onpress,
      child: Text(text),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          )),
          elevation: MaterialStateProperty.all(10.0),
          shadowColor: MaterialStateProperty.all(Colors.black),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 20)),
          minimumSize: MaterialStateProperty.all(const Size(300, 40)),
          backgroundColor: MaterialStateProperty.all(Colors.green)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final club = ModalRoute.of(context)!.settings.arguments as Club;
    final users = Provider.of<UserList>(context);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<Object>(
            future: users.getzepresentuser(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final loggeduser = snapshot.data as Map;
                // final loggeduser = userinfo['loggeduser'];
                // final userlist = userinfo['userlist'];
                return Container(
                  padding: const EdgeInsets.all(10.0).r,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 40.h,
                              width: 40.h,
                              child: FlatButton(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(Icons.arrow_back_ios_new),
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                icon: Icon(Icons.people_alt_rounded),
                                onPressed: () {},
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          width: 320.w,
                          height: 200.h,
                          child: ClipRRect(
                            child: Image.network(
                              club.clubpic,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 10.w),
                          child: Text(
                            club.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.sp,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 10.w),
                          child: Text(
                            club.type,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 10.w),
                          child: Text(
                            club.description,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        if (loggeduser['id'] == club.owner)
                          Column(children: [
                            button(() {
                              showDialog(
                                context: context,
                                builder: (
                                  BuildContext context,
                                ) {
                                  return ChangeNotifierProvider.value(
                                    value: club,
                                    child: AnnouncementForm(),
                                  );
                                },
                              );
                            }, 'Create a new Announcement'),
                            SizedBox(
                              height: 15.h,
                            ),
                            button(() {
                              Navigator.pushNamed(
                                  context, ClubAnnouncementScreen.routename,
                                  arguments: club);
                            }, 'View All Announcements'),
                            SizedBox(
                              height: 15.h,
                            ),
                          ]),
                        if (loggeduser['id'] != club.owner)
                          // userlist.contains(loggeduser['id'])
                          //     ? Column(
                          //         children: [
                          //           button(() {
                          //             Navigator.pushNamed(context,
                          //                 ClubAnnouncementScreen.routename,
                          //                 arguments: club);
                          //           }, 'View All Announcements'),
                          //           SizedBox(
                          //             height: 15.h,
                          //           ),
                          //         ],
                          //       )
                          Column(
                            children: [
                              button(() async {
                                try {
                                  final token = await users.getzepresentuser();
                                  await users.userjoinsclub(
                                      club.id, token['token'] as String);
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'You are now a member of this club')),
                                  );
                                } catch (e) {
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'You are already a member of this club')),
                                  );
                                }
                              }, 'Join the Club'),
                              SizedBox(
                                height: 15.h,
                              ),
                              button(() {
                                Navigator.pushNamed(
                                    context, ClubAnnouncementScreen.routename,
                                    arguments: club);
                              }, 'View All Announcements'),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
