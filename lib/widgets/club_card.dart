import 'package:flutter/material.dart';
import 'package:clubz/club_profile.dart';

class Club_card extends StatelessWidget {
  /*const*/ //Club_card({ Key? key }) : super(key: key);
  final profile;
  
  Club_card(this.profile);

  
  @override

  Widget build(BuildContext context) {
    return Container(
      
              margin:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 20.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                elevation: 10.0,
                child: Column(
                  children: [
                    //SizedBox(height: 10,),
                    //Gesture detector
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>profile),);
                      },
                      child: AnimatedContainer(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        duration: Duration(milliseconds: 250),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
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
                      padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                      
                      child: ClipRRect(
                        child: Column(
                          children: [
                            //
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                
                                Text(
                                  'Iris',
                                  //textAlign: TextAlign.start,
                                  style: TextStyle(
                                    
                                    
                                    fontSize: 25,
                                  ),
                                ),

                                //SizedBox(width: 140,),
                                
                                /*Text(
                                  'Robotics Club   ',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 68, 68, 68),
                                    
                                    fontSize: 20,
                                  ),
                                ),*/
                                

                              ],
                            ),

                            Row(
                              children: const [
                                //SizedBox(width: 20,),
                                Text(
                                  'Robotics Club',
                                  //textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    

                                    color: Color.fromARGB(255, 68, 68, 68),
                                    
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),


                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            
      
    );
  }
}