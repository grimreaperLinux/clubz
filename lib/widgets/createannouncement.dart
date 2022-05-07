import 'package:clubz/models/anouncement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../models/club.dart';

class AnnouncementForm extends StatefulWidget {
  @override
  State<AnnouncementForm> createState() => _AnnouncementFormState();
}

class _AnnouncementFormState extends State<AnnouncementForm> {
  var description = TextEditingController();
  bool _isloading = false;

  Widget _createwidget(String text, TextEditingController name) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
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
    final announcements = Provider.of<AnnouncementList>(context);
    final users = Provider.of<UserList>(context);
    final club = Provider.of<Club>(context);
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      content: Container(
        height: 210.h,
        width: MediaQuery.of(context).size.width,
        child: _isloading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const Text('Creating your announcement'),
                ],
              )
            : Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Create Your Announcement',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                _createwidget(
                                  'Announcement',
                                  description,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      _isloading = true;
                                    });
                                    final token =
                                        await users.getzepresentuser();
                                    // await clubs
                                    //     .addclub(
                                    //         _imageFile,
                                    //         name.text,
                                    //         description.text,
                                    //         type.text,
                                    //         token['token'] as String)
                                    //     .then((_) {
                                    //   Navigator.of(context).pop();
                                    // });
                                    announcements
                                        .addAnnouncement(description.text,
                                            token['token'] as String, club.id)
                                        .then((_) {
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: const Text('Submit'),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    )),
                                    elevation: MaterialStateProperty.all(10.0),
                                    shadowColor:
                                        MaterialStateProperty.all(Colors.black),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            horizontal: 20)),
                                    minimumSize: MaterialStateProperty.all(
                                        const Size(150, 40)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
