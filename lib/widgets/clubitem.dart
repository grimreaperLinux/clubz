import 'package:clubz/models/club.dart';
import 'package:provider/provider.dart';

import '../screens/details_screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClubItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final clubitem = Provider.of<Club>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailsScreen.routename,
            arguments: clubitem);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        height: 200.h,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.r),
            ),
          ),
          elevation: 8.0,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                width: 200.w,
                height: 200.h,
                child: ClipRRect(
                  child: Image.network(
                    clubitem.clubpic,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.r),
                  ),
                ),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    clubitem.name,
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp),
                  ),
                  Text(
                    clubitem.type,
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
                  ),
                ],
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
