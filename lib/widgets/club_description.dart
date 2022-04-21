import 'package:flutter/material.dart';

import 'package:expandable_text/expandable_text.dart';

class club_desc extends StatelessWidget {
  const club_desc({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              //color: Colors.amberAccent,
              margin:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
              height: 80,
              width: 330,
              child: Center(
                child: ExpandableText(
                  
                    'So welcome to the club description. So this club is ... Iris is a robotics club. We know that Viplu is working inside this club. He the one doing nothing but just creating posters and that\'s it. In this project we r 4 people workinng together as a team.',
                    expandText: 'show more',
                    collapseText: 'show less',
                    maxLines: 2,
                    linkColor: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 10,),


          ],
        ),
      ),
    );
}
}