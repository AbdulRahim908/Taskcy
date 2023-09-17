import 'package:flutter/material.dart';
import 'package:hackathon/screens/loginView.dart';

class HomeView3 extends StatelessWidget {
  const HomeView3({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
              child: Stack(
              children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/images/Group3.png",
              // height: 1000,
              width: double.infinity,
              // fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        '  Task management ',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            color: Colors.purpleAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      // Text(
                      //   '1 ',
                      //   style: TextStyle(
                      //       fontFamily: 'AbrilFatface',
                      //       color: Colors.white,
                      //       fontSize: 51.0),
                      // ),
                    ],
                  ),
                  Text(
                    '  Manage your ',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                  Text(
                    ' Tasks quickly for ',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                  Text(
                    '  Results',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),SizedBox(height: 40,),
                  
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => LoginView(),
                            //   ),
                            // );
                          },
                          child: Text(
                            "  skip",
                            style: TextStyle(
                                // fontFamily: 'Raleway',
                                color: Colors.black,
                                // fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                          
                        ),SizedBox(width: 280,),ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginView(),
                              ),
                            );
                          },
                          child: Icon(Icons.arrow_forward
                            
                            
                          ),
                          
                        ),
                      ],
                    ),
                  
                ]),
          ),
              ],
            )),
        ));
  }
}
