import 'package:flutter/material.dart';

class AnnouncementCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        elevation: 8.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  radius: 15,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset('images/irisB.jpeg'),
                  )


                  //foregroundImage: Image(Image.asset('images/irisB.jpeg')),
                  //child: Align(
                    
                  //  child: Image.asset('images/irisB.jpeg')),
                  
                ),

                SizedBox(width: 10,),

                Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'A club name',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              ]),
              
              SizedBox(
                height: 10,
              ),
              Text(
                'The announcement about some club event and very urgent notices and dajhfuigfuihfuha fuqugd uqguigfuagaafugaudgasudfdgauifgaufuiahfuigfudfud',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
