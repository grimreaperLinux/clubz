
import 'package:clubz/widgets/club_desc2.dart';
import 'package:expandable_text/expandable_text.dart';

import 'package:clubz/widgets/post_card.dart';
import 'package:clubz/widgets/club_description.dart';
import 'package:flutter/material.dart';


class Club_profile1v extends StatefulWidget {
  const Club_profile1v({Key? key}) : super(key: key);

  

  @override
  State<Club_profile1v> createState() => _Club_profileState();
}

class _Club_profileState extends State<Club_profile1v> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.blueGrey,
                  )),
              Expanded(
                  flex: 6,
                  child: Container(
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60), //.all(18.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      elevation: 8.0,
                      child: ClipRRect(
                        child: Image.asset('images/velo.jpeg'),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(00, 0, 0, 0),
                child: ClipRRect(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 160,),
                          Text(
                              'Velocity',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          SizedBox(width: 80,),
                          IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.people_alt_outlined),
                                    iconSize: 35,
                                    tooltip: 'Members',
                                    color: Color.fromARGB(255, 51, 81, 97),
                                    hoverColor: Color.fromARGB(221, 113, 81, 81),
                                    //splashRadius: 100,
                                    //splashColor: Color.fromARGB(255, 0, 0, 0),
                                    //highlightColor: Color.fromARGB(254, 194, 194, 194),    
                              ),
        
                            
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              'Web dev Club',
                              //textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Color.fromARGB(255, 68, 68, 68),
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            
      //Club Description
            //club_desc(),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(child: Center(child: Text('Velocity is the web development club regulated within Indian Institute Of Information Technology Dharwad. It is managed by club members and constantly guided by faculty Mr/Ms ...So anyone who is dev enthusiast can join the club ')),),
            ),

            //ClubDesc(),
             
        
              //SizedBox(height: 15,),
              Container(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Join the club',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 50),
                      textStyle: TextStyle(fontSize: 20),
                      primary: Colors.blueGrey, //background
                      onPrimary: Color.fromARGB(255, 228, 228, 228) //foreground
        
                      ),
                  //style: ButtonStyle(
                  //backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 83, 83, 83))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Add new Announcement',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 50),
                      textStyle: TextStyle(fontSize: 20),
                      primary: Colors.blueGrey, //background
                      onPrimary: Color.fromARGB(255, 228, 228, 228) //foreground
        
                      ),
                ),
              ),
        
              SizedBox(
                height: 30,
              ),

              Row(
                children: [
                  SizedBox(width: 330,),
                  FloatingActionButton(onPressed: (){},child: Icon(Icons.chat_bubble_outline),),
                ],
              ),

              /*IconButton(
                    onPressed: () {},
                    icon: Image.asset('images/pngChat.png'),
                    iconSize: 60,
                    tooltip: 'Chat with community',
                    color: Color.fromARGB(255, 51, 81, 97),
                    hoverColor: Color.fromARGB(221, 113, 81, 81),
                                      
              ),*/

              SizedBox(height: 30,),

              Row(children: [
                SizedBox(width: 100,),
                IconButton(onPressed: (){}, icon: Icon(Icons.facebook_outlined)),
                SizedBox(width: 10,),
                IconButton(onPressed: (){}, icon: Icon(Icons.linked_camera_outlined)),
                SizedBox(width: 10,),
                IconButton(onPressed: (){}, icon: Icon(Icons.web_sharp)),
                SizedBox(width: 10,),
                IconButton(onPressed: (){}, icon: Icon(Icons.bubble_chart_outlined)),
              ],)
        
              //Floating Button
              /*Container(
                  child: FloatingActionButton(
                onPressed: null,
                child: Icon(Icons.chat_bubble_sharp),
              )
              ),*/
        
            ],
          ),
        ),


      ],
    ));
  }
}