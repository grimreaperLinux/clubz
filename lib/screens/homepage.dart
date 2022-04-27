import 'package:clubz/widgets/clubitem.dart';
import 'package:flutter/material.dart';
import 'club_profile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage extends StatelessWidget {
  static const routename = '/homepage';

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
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          isExtended: true,
          label: Text('Create Your Club'),
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10).r,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Good Morning',
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      iconSize: 25.r,
                      onPressed: () {},
                      icon: const Icon(Icons.account_circle_rounded),
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
                ClubItem(),
                ClubItem(),
                ClubItem()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
