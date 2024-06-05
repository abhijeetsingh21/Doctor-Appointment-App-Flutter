// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'dart:developer';

import 'package:doctors_appointment/Api/api.dart';
import 'package:doctors_appointment/Models/userModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';

class ScheduleAppointment extends StatefulWidget {
  const ScheduleAppointment({super.key});

  @override
  State<ScheduleAppointment> createState() => _ScheduleAppointmentState();
}

class _ScheduleAppointmentState extends State<ScheduleAppointment> {
  bool isVideoConsult = false;
  bool isOfflineConsult = false;
  bool isAudioConsult = false;
  String? selectedConsultType;
  DateTime? _selectedValue;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.arrow_back_ios_new_outlined)),
                      SizedBox(width: 15.0),
                      Text('Schedule Appointment',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: ClipRRect(
                          borderRadius:BorderRadius.circular(40),
                          child: Image.network(
                            fit : BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                              'https://st2.depositphotos.com/2931363/6569/i/450/depositphotos_65699901-stock-photo-black-man-keeping-arms-crossed.jpg'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr. Ramya',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          // SizedBox(height:0.1),
                          Text(
                            'Dentist',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Kings Hospital',
                            style: TextStyle(
                              fontSize: 13,
                              // fontWeight: FontWeight.bold,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.heart),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.21,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.blue, width: 1.7),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              'Chat Now',
                              style: TextStyle(
                                fontSize: 14,
                                // fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Select Patitent',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black45,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 28,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Icon(
                                CupertinoIcons.plus,
                                size: 35,
                                color: Colors.black45,
                              )),
                        ),
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        radius: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                              'https://www.shutterstock.com/image-photo/smiling-senior-man-eyeglasses-relaxing-260nw-552964729.jpg'),
                        ),
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        radius: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                              'https://img.freepik.com/free-photo/middle-aged-man-wearing-leaning-against-rusty-colored-background_150588-73.jpg'),
                        ),
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        radius: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                              'https://images.pexels.com/photos/35537/child-children-girl-happy.jpg?cs=srgb&dl=pexels-bess-hamiti-83687-35537.jpg&fm=jpg'),
                        ),
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        radius: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                              'https://parentingteensandtweens.com/wp-content/uploads/2022/11/9-things-teen-boys-need-1024x683.jpg'),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () async {
                          DateTime? curPickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2030),
                          );
                          if (curPickedDate != null) {
                            setState(() {
                              _selectedValue = curPickedDate;
                              log(_selectedValue.toString());
                            });
                          }
                        },
                        child: Text(
                          DateFormat('MMMM')
                              .format(_selectedValue ?? DateTime.now()),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        CupertinoIcons.right_chevron,
                        size: 12,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  DatePicker(
                    height: 90,
                    DateTime.now(),
                    selectionColor: Colors.blueAccent,
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      // New date selected
                      setState(() {
                        _selectedValue = date;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Time',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: size.height * 0.05,
                          width: size.width * 0.3,
                          decoration: BoxDecoration(
                              // color: Colors.blueAccent,
                              border:
                                  Border.all(color: Colors.black54, width: 1.7),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Text(
                            '09:00 AM',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: size.height * 0.05,
                          width: size.width * 0.3,
                          decoration: BoxDecoration(
                              // color: Colors.blueAccent,
                              border:
                                  Border.all(color: Colors.black54, width: 1.7),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Text(
                            '11:00 AM',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: size.height * 0.05,
                          width: size.width * 0.3,
                          decoration: BoxDecoration(
                              // color: Colors.blueAccent,
                              border:
                                  Border.all(color: Colors.black54, width: 1.7),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Text(
                            '01:00 PM',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Consult Type',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isVideoConsult = !isVideoConsult;
                                  selectedConsultType = 'Video Consult';
                                  if (isAudioConsult) 
                                  isAudioConsult = !isAudioConsult;
                                  if (isOfflineConsult)
                                    isOfflineConsult = !isOfflineConsult;

                                  log(isVideoConsult.toString());
                                  log(isAudioConsult.toString());
                                  log(isOfflineConsult.toString());
                                });
                              },
                              child: Container(
                                height: size.height * 0.08,
                                width: size.width * 0.37,
                                decoration: BoxDecoration(
                                    color: isVideoConsult
                                        ? Colors.blueAccent
                                        : Colors.white,
                                    border: Border.all(
                                        color: isVideoConsult
                                            ? Colors.blueAccent
                                            : Colors.black38,
                                        width: 1.7),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                    child: Text(
                                  'Video Consult\nrs 400',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: isVideoConsult
                                          ? Colors.white
                                          : Colors.black),
                                )),
                              ),
                            ),
                            SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isOfflineConsult = !isOfflineConsult;
                                  selectedConsultType = 'Offline Consult';
                                  if (isAudioConsult)
                                    isAudioConsult = !isAudioConsult;
                                  if (isVideoConsult)
                                    isVideoConsult = !isVideoConsult;

                                  log(isVideoConsult.toString());
                                  log(isAudioConsult.toString());
                                  log(isOfflineConsult.toString());
                                });
                              },
                              child: Container(
                                height: size.height * 0.08,
                                width: size.width * 0.37,
                                decoration: BoxDecoration(
                                    color: isOfflineConsult
                                        ? Colors.blueAccent
                                        : Colors.white,
                                    border: Border.all(
                                        color: isOfflineConsult
                                            ? Colors.blueAccent
                                            : Colors.black38,
                                        width: 1.7),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                    child: Text(
                                  'Offline \nConsult',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: isOfflineConsult
                                          ? Colors.white
                                          : Colors.black),
                                  // style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                            SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isAudioConsult = !isAudioConsult;
                                  selectedConsultType = 'Audio Consult';
                                  if (isVideoConsult)
                                    isVideoConsult = !isVideoConsult;
                                  if (isOfflineConsult)
                                    isOfflineConsult = !isOfflineConsult;

                                  log(isVideoConsult.toString());
                                  log(isAudioConsult.toString());
                                  log(isOfflineConsult.toString());
                                });
                              },
                              child: Container(
                                height: size.height * 0.08,
                                width: size.width * 0.37,
                                decoration: BoxDecoration(
                                    color: isAudioConsult
                                        ? Colors.blueAccent
                                        : Colors.white,
                                    border: Border.all(
                                        color: isAudioConsult
                                            ? Colors.blueAccent
                                            : Colors.black38,
                                        width: 1.7),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                  child: Text(
                                    'Audio Consult\nrs 300',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: isAudioConsult
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Your Problem',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        height: size.height * 0.2,
                        width: size.width * 0.77,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black26, width: 1.7),
                            borderRadius: BorderRadius.circular(8)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              label: Text('problems')),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        log(_selectedValue.toString());
                        if (_selectedValue != null &&
                            selectedConsultType != null) {
                          Navigator.pushNamed(context, '/Appointments',
                              arguments:
                                  GetToAppointmentScreen(
                                      doctorType: 'Dentist',
                                      time: DateTime(20) ,//DateTime.now(),
                                      consultType: selectedConsultType,
                                      doctorName: 'Dr. Ramya',
                                      date: _selectedValue,
                                      patitentId: Api.auth.currentUser!.uid));
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('message'),
                                  content: Text(
                                      'Please choose Date and Consult mode'),
                                );
                              });
                          log('Please choose Date');
                        }
                      },
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.77,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            border: Border.all(
                                color: Colors.blueAccent, width: 1.7),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                            child: Text(
                          'Book Consultation',
                          style: TextStyle(color: Colors.white, fontSize: 19),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
