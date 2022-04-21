import './widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'club_profile.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  static const routename = '/homepage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //body: Center(child: Text('This is ze homepage'),)

      body: AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(
              height: 40,
            ),

        //Circular avtar profile
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,

                //mainAxisAlignment: const EdgeInsets.only(left: 0.3),radius: 25,
                children: [
                  CircleAvatar(
                    child: Icon(
                            Icons.account_circle_rounded,
                            size: 50,                            
                            ),
                        radius: 25,
                    ),

                  SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
          
        //TextField
          Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 30),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 57, 57, 57),
                  ),
                  hintText: "Search club",
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),

          Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                elevation: 8.0,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.black38),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      height: 100,
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 00, 0),
                        child: ClipRRect(
                          child: Image.network(
                              'https://images.unsplash.com/photo-1490730141103-6cac27aaab94?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
                              ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                    ),

                    /* Padding(
                              padding: const EdgeInsets.fromLTRB(2, 0, 2, 2),
                              child: ClipRRect(
                                child: Image.network(
                                   'https://images.unsplash.com/photo-1490730141103-6cac27aaab94?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80' 
                                  ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                            ),*/
                  ],
                ),
              ),
            ),


            
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                elevation: 8.0,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
          //Gesture datector
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Club_profile()),);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 250),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: ClipRRect(
                            child: Image.asset(
                              'images/irisB.jpeg',
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                      
                      child: ClipRRect(
                        child: Container(
                          child: Column(
                            children: [
                              //
                              Row(
                                children: [
                                  SizedBox(width: 20,),
                                  Text(
                                    'Iris',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      
                                      fontSize: 33,
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  SizedBox(width: 20,),
                                  Text(
                                    'Robotics Club',
                                    //textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 68, 68, 68),
                                      
                                      fontSize: 25,
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


                  ],
                ),
              ),
            ),


          Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                elevation: 8.0,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: ClipRRect(
                        child: Image.asset(
                          'images/velo.jpeg'
                                //'https://media.istockphoto.com/photos/business-man-pushing-large-stone-up-to-hill-business-heavy-tasks-and-picture-id825383494?k=20&m=825383494&s=612x612&w=0&h=tEqZ5HFZcM3lmDm_cmI7hOeceiqy9gYrkyLTTkrXdY4='
                            ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                    

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                      
                      child: ClipRRect(
                        child: Container(
                          child: Column(
                            children: [
                              //
                              Row(
                                children: [
                                  SizedBox(width: 20,),
                                  Text(
                                    'Velocity',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      
                                      fontSize: 33,
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  SizedBox(width: 20,),
                                  Text(
                                    'Web dev Club',
                                    //textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 68, 68, 68),
                                      
                                      fontSize: 25,
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


                  ],
                ),
              ),
            ),



         // PostCard(),



          Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                elevation: 8.0,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: ClipRRect(
                        child: Image.network(
                            'https://images.unsplash.com/photo-1490730141103-6cac27aaab94?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                    

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                      
                      child: ClipRRect(
                        child: Container(
                          child: Column(
                            children: [
                              //
                              Row(
                                children: [
                                  SizedBox(width: 20,),
                                  Text(
                                    'DSAI Society',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      
                                      fontSize: 33,
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  SizedBox(width: 20,),
                                  Text(
                                    'DS Club',
                                    //textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 68, 68, 68),
                                      
                                      fontSize: 25,
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


                  ],
                ),
              ),
            ),

            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                elevation: 8.0,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: ClipRRect(
                        child: Image.asset(
                          'images/irisB.jpeg',
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                      
                      child: ClipRRect(
                        child: Container(
                          child: Column(
                            children: [
                              //
                              Row(
                                children: [
                                  SizedBox(width: 20,),
                                  Text(
                                    'Iris',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      
                                      fontSize: 33,
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  SizedBox(width: 20,),
                                  Text(
                                    'Robotics Club',
                                    //textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 68, 68, 68),
                                      
                                      fontSize: 25,
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


                  ],
                ),
              ),
            ),




          ],
        ),
      ),
    ),


    );
  }
}
