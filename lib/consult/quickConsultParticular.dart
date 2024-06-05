// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'package:doctors_appointment/Models/userModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ParticularDoctor extends StatefulWidget {
  const ParticularDoctor({super.key});

  @override
  State<ParticularDoctor> createState() => _ParticularDoctorState();
}

class _ParticularDoctorState extends State<ParticularDoctor> {
  bool onVideoConsult = false;
  bool onAudioConsult = false;
  TextEditingController problemController = TextEditingController();

  Future getDoctorName() async {}

  @override
  Widget build(BuildContext context) {
    final aboutDoctor = ModalRoute.of(context)!.settings.arguments
        as QuickConsultParticularScreenArguments;
    print(aboutDoctor.name);
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus,
      child: Scaffold(
        //
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(Icons.arrow_back_ios_new_outlined)),
                      SizedBox(width: 15.0),
                      Text('Quick Consult',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                            aboutDoctor.img,
                            // 'https://images.hindustantimes.com/rf/image_size_640x362/HT/p2/2016/07/01/Pictures/_04695dbe-3f6d-11e6-86cd-639e2418d1d4.jpg'
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            aboutDoctor.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          // SizedBox(height:0.1),
                          Text(
                            aboutDoctor.type,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            aboutDoctor.workAt,
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
                  SizedBox(height: 7),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.21,
                      ),
                      InkWell(
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
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        height: size.height * 0.14,
                        width: size.width * 0.28,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black26, width: 1.7),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black12,
                              child: Icon(
                                color: Colors.blue,
                                Icons.people_alt,
                              ),
                            ),
                            Text(
                              'patitent',
                              style: TextStyle(
                                fontSize: 14,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black38,
                              ),
                            ),
                            Text(
                              '180+',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        height: size.height * 0.14,
                        width: size.width * 0.28,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black26, width: 1.7),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black12,
                              child: Icon(
                                Icons.star,
                                color: Colors.blue,
                              ),
                            ),
                            Text(
                              'Rating',
                              style: TextStyle(
                                fontSize: 14,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black38,
                              ),
                            ),
                            Text(
                              '4.8',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        height: size.height * 0.14,
                        width: size.width * 0.28,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black26, width: 1.7),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black12,
                              child: Icon(
                                Icons.watch_later_outlined,
                                color: Colors.blue,
                              ),
                            ),
                            Text(
                              'experience',
                              style: TextStyle(
                                fontSize: 14,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black38,
                              ),
                            ),
                            Text(
                              '10 Yr',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'About Doctors',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('Bla bla bla'),
                  SizedBox(height: 16),
                  Text(
                    'Consult Type',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                onVideoConsult = !onVideoConsult;
                                if (onAudioConsult)
                                  onAudioConsult = !onAudioConsult;
                              });
                            },
                            child: Container(
                              height: size.height * 0.08,
                              width: size.width * 0.37,
                              decoration: BoxDecoration(
                                  color: onVideoConsult == true
                                      ? Colors.blueAccent
                                      : Colors.white70,
                                  border: Border.all(
                                      color: onVideoConsult == true
                                          ? Colors.blueAccent
                                          : Colors.black26,
                                      width: 1.7),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                  child: Text(
                                'Video Consult\nrs 400',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: onVideoConsult == true
                                        ? Colors.white
                                        : Colors.black),
                              )),
                            ),
                          ),
                          SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                onAudioConsult = !onAudioConsult;
                                if (onVideoConsult)
                                  onVideoConsult = !onVideoConsult;
                              });
                            },
                            child: Container(
                              height: size.height * 0.08,
                              width: size.width * 0.37,
                              decoration: BoxDecoration(
                                  color: onAudioConsult == true
                                      ? Colors.blueAccent
                                      : Colors.white70,
                                  border: Border.all(
                                      color: onAudioConsult == true
                                          ? Colors.blueAccent
                                          : Colors.black26,
                                      width: 1.7),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                  child: Text(
                                'Audio Consult\nrs 300',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: onAudioConsult == true
                                        ? Colors.white
                                        : Colors.black),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Your Problem',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                          maxLines: (size.width * 0.1).toInt(),
                          textAlign: TextAlign.start,
                          maxLength: 5000,
                          controller: problemController,
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
                        if (onAudioConsult || onVideoConsult) {
                          Navigator.pushNamed(
                            context,
                            '/Appointments',
                            arguments: GetToAppointmentScreen(
                                doctorName: aboutDoctor.name,
                                doctorType: aboutDoctor.type,
                                workAt: aboutDoctor.workAt,
                                consultType: onVideoConsult
                                    ? 'Videos Consult'
                                    : 'Audio Consult',
                                id: aboutDoctor.id),
                          );
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Message'),
                                  content: Text('Please Select Consult Mode'),
                                );
                              });
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
