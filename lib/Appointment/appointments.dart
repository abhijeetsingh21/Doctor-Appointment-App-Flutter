// ignore_for_file: prefer_const_constructors
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/date_symbol_data_file.dart';

import 'dart:async';
import 'dart:developer';

import 'package:doctors_appointment/Models/userModel.dart';
import 'package:doctors_appointment/schedule/schedulePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    final tmp =
        ModalRoute.of(context)!.settings.arguments as GetToAppointmentScreen;
    log('${[
      tmp.id,
      tmp.doctorName,
      tmp.consultType,
      tmp.patitentId,
      tmp.time,
      tmp.date,
      tmp.doctorType,
      tmp.workAt,
    ]}');
    // log(tmp.toString());
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
                              // 'Dr. Ramya',
                              tmp.doctorName.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(height: 5),
                            Text(
                              // 'Dentist',
                              tmp.doctorType.toString(),
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
                                  // 'Video Consult',
                                  tmp.consultType.toString(),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                'https://st2.depositphotos.com/2931363/6569/i/450/depositphotos_65699901-stock-photo-black-man-keeping-arms-crossed.jpg'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Icon(Icons.calendar_month),
                          SizedBox(width: 5),
                          Text(
                            // '${tmp.date!.day}/${tmp.date!.month}/${tmp.date!.year}',
                            DateFormat('dd/MM/yyyy')
                                .format(tmp.date ?? DateTime.now()),
                          ),
                          SizedBox(width: 14),
                          Icon(Icons.watch_later_outlined),
                          SizedBox(width: 5),
                          // Text(tmp.time.toString()),
                          Text(DateFormat('hh:mm a')
                              .format(tmp.time ?? DateTime.now())),
                          // Text(
                          // "${tmp.time!.hour.toString()}:${tmp.time!.minute}:${tmp.time!.timeZoneName}"),
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
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              onCancelTap = true;
                            });
                            Timer(
                                Duration(milliseconds: 100),
                                () => Navigator.pushNamed(
                                    context, '/homeScreen'));
                          },
                          child: Container(
                            height: size.height * 0.06,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                                color: onCancelTap == false
                                    ? Colors.black12
                                    : Colors.blue,
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
                            Timer(Duration(milliseconds: 10),
                                () => Navigator.pop(context));
                            // Navigator.pop(context);
                          },
                          child: Container(
                            height: size.height * 0.06,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                                color: onRescheduleTap == false
                                    ? Colors.black12
                                    : Colors.blue,
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
