import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settings extends StatelessWidget {
  static const routeName = "/settings";

  Widget profilepic() {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/profilepic.jpg"),
          ),
        ],
      ),
    );
  }

  Widget profileMenu(IconData icon, String text, void press) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
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
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFF5F6F9),
        onPressed: () {
          press;
        },
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0).r,
        child: Column(
          children: [
            Center(
                child: Text(
              'Settings',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
            )),
            SizedBox(
              height: 20.h,
            ),
            profilepic(),
            SizedBox(
              height: 20.h,
            ),
            Center(
                child: Text(
              'Aniket Raj',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            )),
            Center(
                child: Text(
              'ani9431619703@gmail.com',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            )),
            SizedBox(
              height: 15.h,
            ),
            profileMenu(Icons.account_circle, 'Account', null),
            SizedBox(
              height: 20.h,
            ),
            profileMenu(Icons.bookmark, 'Saved Posts', null),
            SizedBox(
              height: 20.h,
            ),
            profileMenu(Icons.timelapse, 'Your Posts', null),
            SizedBox(
              height: 20.h,
            ),
            profileMenu(Icons.logout_outlined, 'Logout', null),
          ],
        ),
      )),
    );
  }
}
