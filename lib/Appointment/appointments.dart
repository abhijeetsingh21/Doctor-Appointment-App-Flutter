import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  bool onRescheduleTap = false;
  bool onCancelTap = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                  SizedBox(width: 15.0),
                  Text('Appointment',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              SizedBox(height: 25),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: size.height * 0.07,
                          width: size.width * 0.3,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              border: Border.all(
                                  color: Colors.blueAccent, width: 1.7),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Text(
                            'Upcoming',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        SizedBox(width: 5),
                        Container(
                          height: size.height * 0.07,
                          width: size.width * 0.3,
                          decoration: BoxDecoration(
                              // color: Colors.blueAccent,
                              border:
                                  Border.all(color: Colors.black38, width: 1.7),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Text('Completed',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                        ),
                        SizedBox(width: 5),
                        Container(
                          height: size.height * 0.07,
                          width: size.width * 0.3,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black26, width: 1.7),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              'Cancelled',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dr. Ramya',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Dentist',
                              style: TextStyle(color: Colors.black54),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  'Mode :',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.2),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Video Consult',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.2),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 30,
                          child: Image.network(
                              'https://st2.depositphotos.com/2931363/6569/i/450/depositphotos_65699901-stock-photo-black-man-keeping-arms-crossed.jpg'),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.calendar_month),
                        SizedBox(width: 5),
                        Text('22/03/2023'),
                        SizedBox(width: 14),
                        Icon(Icons.watch_later_outlined),
                        SizedBox(width: 5),
                        Text('10:00 AM'),
                        SizedBox(width: 24),
                        Icon(
                          CupertinoIcons.circle_fill,
                          size: 10,
                          color: Colors.green,
                        ),
                        SizedBox(width: 5),
                        Text('Confirmed')
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              onCancelTap = true;
                            });
                            Timer(Duration(milliseconds: 100 ), ()=> Navigator.pop(context));
                          },
                          child: Container(
                            height: size.height * 0.06,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                                color:onCancelTap == false ? Colors.black12 : Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          
                          onTap: () { 
                            setState(() {
                              onRescheduleTap = true;
                            });
                            Timer(Duration(milliseconds:10 ), ()=> Navigator.pop(context));
                            // Navigator.pop(context);
                            },

                          child: Container(
                            height: size.height * 0.06,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                                color: onRescheduleTap == false ? Colors.black12 : Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'Reschedule',
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
