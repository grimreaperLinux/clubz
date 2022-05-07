import 'package:clubz/screens/settings.dart';
import 'package:clubz/widgets/clubitem.dart';
import 'package:clubz/widgets/form_for_club_creation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../models/club.dart';
import '../models/user.dart';

class Homepage extends StatefulWidget {
  static const routename = '/homepage';

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _isinit = true;

  @override
  void didChangeDependencies() {
    var clubs = Provider.of<ClubList>(context, listen: false);

    if (_isinit && clubs.items.isEmpty) {
      Provider.of<ClubList>(context).getclubs();
    }
    _isinit = false;
    super.didChangeDependencies();
  }

  TextEditingController searchbar = TextEditingController();

  Widget _createwidget(String text, TextEditingController name) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.black12, width: 2.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(
              5.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please provide a value.';
          }
          return null;
        },
        controller: name,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: const TextStyle(fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final clublist = Provider.of<ClubList>(context);
    final users = Provider.of<UserList>(context);
    return SafeArea(
      child: FutureBuilder<Object>(
          future: users.getzepresentuser(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final loggeduser = snapshot.data as Map;
              return Scaffold(
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return FormForClub();
                      },
                    );
                  },
                  isExtended: true,
                  label: Text('Create Your Club'),
                  backgroundColor: Colors.green,
                ),
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20)
                          .r,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Good Morning ,',
                                  style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(loggeduser['name'],
                                    style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            IconButton(
                              iconSize: 25.r,
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Settings.routeName);
                              },
                              icon: const Icon(Icons.settings),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        _createwidget('Search for Clubs', searchbar),
                        SizedBox(
                          height: 20.h,
                        ),
                        clublist.items.isEmpty
                            ? const Center(
                                child: Text(
                                  'No CLubs',
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            : Column(
                                children: [
                                  ...clublist.items.map(
                                    (item) => ChangeNotifierProvider.value(
                                      value: item,
                                      child: ClubItem(),
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
          }),
    );
  }
}
