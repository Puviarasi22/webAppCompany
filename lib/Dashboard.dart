
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:puvitest/wave.dart';

class Dashboardpage extends StatefulWidget {
  @override
  _DashboardpageState createState() => _DashboardpageState();
  Dashboardpage() {
    timeDilation = 6;
  }
}

class _DashboardpageState extends State<Dashboardpage> {
  @override
  bool fontAnimation=true;

  getdata()async{
    var database=FirebaseDatabase().reference().child("data");
    DataSnapshot king=await database.once();
     print(king);
  }

  Widget build(BuildContext context) {
    getdata();
    Size size = Size(MediaQuery.of(context).size.width, 750.0);
    double fontSize = 20.0;
    double elevation = 20.0;
    double heightSpace = 10.0;
    EdgeInsetsGeometry paddingin = EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0);
// Future.delayed(Duration(seconds: 1),(){
//   setState(() {
//     fontAnimation=false;
//   });
// });
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        return Scaffold(
          body: ListView(
            children: [
              Stack(
                children: [
                  DemoBody(
                      size: size,
                      xOffset: 0,
                      yOffset: 0,
                      color: Color.fromRGBO(0, 10, 37, 1)),
                  Opacity(
                    opacity: 0.9,
                    child: DemoBody(
                      size: size,
                      xOffset: 50,
                      yOffset: 10,
                    ),
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.height/2.3,
                      left: MediaQuery.of(context).size.width/2,
                      child: Text("Personal care for you healthy living",style: TextStyle(color: Colors.white,fontSize: 45),)),
                ],
              ),

              Padding(
                padding: paddingin,
                child: Container(
                  height: 300,

                  child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 1.2,
                          mainAxisSpacing: 50,
                          crossAxisSpacing: 50),
                      children: [
                        GestureDetector(
                          child: Padding(
                            padding: paddingin,
                            // ignore: deprecated_member_use
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: elevation,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Image.asset(
                                      "assets/emp.png",
                                      width: 250,
                                    ),
                                  ),
                                  SizedBox(
                                    height: heightSpace,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Employees",
                                      style: TextStyle(
                                          fontSize: fontSize,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pushReplacementNamed(context, "/nav");
                          },
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: paddingin,
                            // ignore: deprecated_member_use
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: elevation,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Image.asset(
                                      "assets/sect.png",
                                      width: 200,
                                    ),
                                  ),
                                  SizedBox(
                                    height: heightSpace,
                                  ),
                                  Flexible(
                                    child: Text("Sector",
                                        style: TextStyle(
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: (){
                            Navigator.pushReplacementNamed(context, "/sec");
                          },
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: paddingin,
                            // ignore: deprecated_member_use
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: elevation,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Image.asset(
                                      "assets/nor.png",
                                      width: 250,
                                    ),
                                  ),
                                  SizedBox(
                                    height: heightSpace,
                                  ),
                                  Flexible(
                                    child: Text("Normal",
                                        style: TextStyle(
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: (){
                            Navigator.pushReplacementNamed(context, "/Norgraph");
                          },
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: paddingin,
                            // ignore: deprecated_member_use
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: elevation,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Image.asset(
                                      "assets/ubnor.png",
                                      width: 250,
                                    ),
                                  ),
                                  SizedBox(
                                    height: heightSpace,
                                  ),
                                  Flexible(
                                    child: Text("Abnormal",
                                        style: TextStyle(
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: (){
                            Navigator.pushReplacementNamed(context, "/abNorgraph");
                          },
                        )
                      ]),
                ),
              ),


            ],
          ),
        );
      }
    );
  }
}
