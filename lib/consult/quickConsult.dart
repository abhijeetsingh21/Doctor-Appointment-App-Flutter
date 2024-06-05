import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_appointment/Models/userModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class QuickConsult extends StatefulWidget {
  const QuickConsult({super.key});

  @override
  State<QuickConsult> createState() => _QuickConsultState();
}

class _QuickConsultState extends State<QuickConsult> {
  List topDoctorsList = [
    [
      'https://st2.depositphotos.com/2931363/6569/i/450/depositphotos_65699901-stock-photo-black-man-keeping-arms-crossed.jpg',
      'Dr. Maria',
      'Neurologist | Max Clinic'
    ],
    [
      'https://st2.depositphotos.com/2931363/6569/i/450/depositphotos_65699901-stock-photo-black-man-keeping-arms-crossed.jpg',
      'Dr. Stevi Jessi',
      'Dentist | King Hospital'
    ],
    [
      'https://st2.depositphotos.com/2931363/6569/i/450/depositphotos_65699901-stock-photo-black-man-keeping-arms-crossed.jpg',
      'Dr. Monica',
      'psychiatrist | Kp Clinic'
    ],
    [
      'https://st2.depositphotos.com/2931363/6569/i/450/depositphotos_65699901-stock-photo-black-man-keeping-arms-crossed.jpg',
      'Dr. Soumiya',
      'orthopedic | Valley Hospital'
    ],
    [
      'https://st2.depositphotos.com/2931363/6569/i/450/depositphotos_65699901-stock-photo-black-man-keeping-arms-crossed.jpg',
      'Dr. Praveen',
      'Neurologist | Max Clinic'
    ],
    [
      'https://st2.depositphotos.com/2931363/6569/i/450/depositphotos_65699901-stock-photo-black-man-keeping-arms-crossed.jpg',
      'Dr. Ramya',
      'Dentist | King Hospital'
    ],
    [
      'https://st2.depositphotos.com/2931363/6569/i/450/depositphotos_65699901-stock-photo-black-man-keeping-arms-crossed.jpg',
      'Dr. Priya',
      'psychiatrist | Kp Clinic'
    ],
    [
      'https://st2.depositphotos.com/2931363/6569/i/450/depositphotos_65699901-stock-photo-black-man-keeping-arms-crossed.jpg',
      'Dr. Soumiya',
      'orthopedic | Valley Hospital'
    ],
  ];

  var availableDoctors = {
    'all': [],
    'general': [],
    'dentist': [],
    'ortho': [],
    'herbal': [],
    'neuro' : []
  };
  Set vis = {};
  String doctorTypeClicked = 'all';

  var firestore = FirebaseFirestore.instance;
  List allDoctorAvailableTypes = ['dentist', 'general', 'herbal', 'ortho','neuro'];
  // List generalDorctors = [];
  // List herbalDoctors = [];
  // List dentistDoctors = [];
  // List orthoDoctors = [];
  // changeNeed(String e){
  //   setState(() {
  //     doctorTypeClicked = e;
  //   });
  // }
  Future forAllDoctors(String doctorTypeClicked) async {
    for (String tmp in allDoctorAvailableTypes) {
      getAllDoctors(tmp);
    }
  }

  Future getAllDoctors(String type) async {
    final snapshot = await firestore
        .collection('doctors')
        .doc('y1AANmZ4BD7EOtGCzI6Q')
        .collection(type)
        .get();
    final doctor =
        snapshot.docs.map((e) => DoctorModel.doctorFromSnapshot(e)).toList();
    for (var tmp in doctor) {
      if (!vis.contains(tmp.id)) {
        vis.add(tmp.id);
        availableDoctors['all']
            ?.add([tmp.img, tmp.name, tmp.type, tmp.workAt, tmp.id]);
        availableDoctors[type]
            ?.add([tmp.img, tmp.name, tmp.type, tmp.workAt, tmp.id]);

        // availableDoctors.add([tmp.img, tmp.name, tmp.type, tmp.workAt]);
      }
    }

    // print(availableDoctors);

    // return availableDoctors;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
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
                SizedBox(height: 15.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            doctorTypeClicked = 'all';

                            // forAllDoctors('all');
                          });
                        },
                        child: DoctorType(
                          containerColor: Color.fromARGB(255, 73, 76, 237),
                          containerName: 'All',
                          isActive: true,
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            doctorTypeClicked = 'general';
                            // getAllDoctors('general');
                          });
                        },
                        child: DoctorType(
                          containerColor: Colors.white,
                          containerName: 'General',
                          isActive: false,
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            doctorTypeClicked = 'neuro';
                            // getAllDoctors('general');
                          });
                        },
                        child: DoctorType(
                          containerColor: Colors.white,
                          containerName: 'Neuro',
                          isActive: false,
                        ),
                      ),
                      SizedBox(width: 10),
                      
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            doctorTypeClicked = 'dentist';

                            // getAllDoctors('dentist');
                          });
                        },
                        child: DoctorType(
                          containerColor: Colors.white,
                          containerName: 'Dentist',
                          isActive: false,
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            doctorTypeClicked = 'herbal';

                            // getAllDoctors('herbal');
                          });
                        },
                        child: DoctorType(
                          containerColor: Colors.white,
                          containerName: 'Herbal',
                          isActive: false,
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            doctorTypeClicked = 'ortho';
                            // getAllDoctors('ortho');
                          });
                        },
                        child: DoctorType(
                          containerColor: Colors.white,
                          containerName: 'Ortho',
                          isActive: false,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      'Available Doctors',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'See all',
                      style: TextStyle(fontSize: 17, color: Colors.blue),
                    ),
                  ],
                ),
                Expanded(
                    child: FutureBuilder(
                        future: forAllDoctors(doctorTypeClicked),
                        builder: (context, snapshot) {
                          print(availableDoctors);
                          if (availableDoctors[doctorTypeClicked]?.length !=
                              0) {
                            return ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount:
                                    availableDoctors[doctorTypeClicked]?.length,
                                itemBuilder: (context, idx) {
                                  // var data = snapshot.data!.docs.toList();
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context, '/ParticularDoctor',
                                          arguments: QuickConsultParticularScreenArguments(
                                              name : availableDoctors[
                                                  doctorTypeClicked]?[idx][1],
                                              id: availableDoctors[doctorTypeClicked]?[idx][4],
                                              type :availableDoctors[
                                                  doctorTypeClicked]?[idx][2],
                                              img : availableDoctors[
                                                  doctorTypeClicked]?[idx][0],
                                              workAt : availableDoctors[
                                                  doctorTypeClicked]?[idx][3]),
                                          // {
                                          //   'name': availableDoctors[doctorTypeClicked]?[idx][1],
                                          //   'img': availableDoctors[
                                          //       doctorTypeClicked]?[idx][0],
                                          //   'type': availableDoctors[doctorTypeClicked]?[idx][2],
                                          //   'workAt': availableDoctors[
                                          //       doctorTypeClicked]?[idx][3],
                                          // }
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            // color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: Colors.black38)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Text('${availableDoctors[doctorTypeClicked]?[idx][4]}'),
                                            CircleAvatar(
                                              radius: 30,
                                              backgroundColor: Colors.grey,
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  child: Image.network(
                                                    fit: BoxFit.cover,
                                                    height: double.infinity,
                                                    width: double.infinity,
                                                    availableDoctors[
                                                            doctorTypeClicked]
                                                        ?[idx][0],
                                                  )
                                                  // availableDoctors[idx][0]),
                                                  ),
                                            ),
                                            SizedBox(width: 15.0),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  availableDoctors[
                                                          doctorTypeClicked]
                                                      ?[idx][1],
                                                  style: TextStyle(
                                                      color: Colors.blue[800],
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(height: 5),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${availableDoctors[doctorTypeClicked]?[idx][2]} | ',
                                                    ),
                                                    SizedBox(width: 5),
                                                    Text(
                                                      '${availableDoctors[doctorTypeClicked]?[idx][3]}',
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                      size: 18,
                                                    ),
                                                    SizedBox(width: 3),
                                                    Text('4.3'),
                                                  ],
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: IconButton(
                                                onPressed: () {},
                                                icon:
                                                    Icon(CupertinoIcons.heart),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          } else {
                            return Center(child: Text('Not Available'));
                          }
                        })),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      'Top Doctors',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'See all',
                      style: TextStyle(fontSize: 17, color: Colors.blue),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: topDoctorsList.length,
                    itemBuilder: (context, idx) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          // height: 10,
                          // width: 150,
                          decoration: BoxDecoration(
                              // color: Colors.black12,
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(color: Colors.black12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                      fit: BoxFit.cover, topDoctorsList[idx][0]),
                                ),
                              ),
                              SizedBox(height: 7),
                              Text(topDoctorsList[idx][1]),
                              SizedBox(height: 7),
                              Text(topDoctorsList[idx][2]),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //  allDoctorsAvailable() {
  //   List doctorsName = [];
  //   List allDoctors = ['general', 'dentist', 'herbal', 'ortho'];
  //   for (String tmp in allDoctors) {
  //      return StreamBuilder(
  //     stream: firestore
  //         .collection('doctors')
  //         .doc('y1AANmZ4BD7EOtGCzI6Q')
  //         .collection(tmp)
  //         .snapshots(),
  //     builder: (context, snapshot) {
  //       var tmpAvailable = snapshot.data!.docs;
  //       if (snapshot.hasData) {
  //         return ListView.builder(
  //             scrollDirection: Axis.vertical,
  //             shrinkWrap: true,
  //             itemCount: snapshot.data!.docs.length,
  //             itemBuilder: (context, idx) {
  //               print('this is image address $tmpAvailable');
  //               // var data = snapshot.data!.docs.toList();
  //               return Padding(
  //                 padding: const EdgeInsets.only(top: 15.0),
  //                 child: GestureDetector(
  //                   onTap: () {
  //                     Navigator.pushNamed(context, '/ParticularDoctor');
  //                   },
  //                   child: Container(
  //                     padding: EdgeInsets.all(8.0),
  //                     decoration: BoxDecoration(
  //                         // color: Colors.blue,
  //                         borderRadius: BorderRadius.circular(15),
  //                         border: Border.all(color: Colors.black38)),
  //                     child: Row(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         CircleAvatar(
  //                           radius: 30,
  //                           backgroundColor: Colors.grey,
  //                           child: ClipRRect(
  //                               borderRadius: BorderRadius.circular(20),
  //                               child: Image.network(
  //                                 tmpAvailable[idx]['img'],
  //                               )
  //                               // availableDoctors[idx][0]),
  //                               ),
  //                         ),
  //                         SizedBox(width: 15.0),
  //                         Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text(
  //                               tmpAvailable[idx]['name'],
  //                               style: TextStyle(
  //                                   color: Colors.blue[800],
  //                                   fontSize: 16,
  //                                   fontWeight: FontWeight.bold),
  //                             ),
  //                             SizedBox(height: 5),
  //                             Row(
  //                               children: [
  //                                 Text(
  //                                   '${tmpAvailable[idx]['type']} | ',
  //                                 ),
  //                                 SizedBox(width: 5),
  //                                 Text(
  //                                   '${tmpAvailable[idx]['workAt']}',
  //                                 ),
  //                               ],
  //                             ),
  //                             Row(
  //                               children: [
  //                                 Icon(
  //                                   Icons.star,
  //                                   color: Colors.yellow,
  //                                   size: 18,
  //                                 ),
  //                                 SizedBox(width: 3),
  //                                 Text('4.3'),
  //                               ],
  //                             )
  //                           ],
  //                         ),
  //                         Spacer(),
  //                         CircleAvatar(
  //                           backgroundColor: Colors.white,
  //                           child: IconButton(
  //                             onPressed: () {},
  //                             icon: Icon(CupertinoIcons.heart),
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               );
  //             });

  //       } else {
  //         return Text('empty');
  //       }
  //     },

  //   );

  //   }

  // }
}

class DoctorType extends StatelessWidget {
  Color containerColor;
  String containerName;
  bool isActive;
  DoctorType(
      {required this.containerColor,
      required this.containerName,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 90,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 73, 76, 237), width: 2),
        color: isActive ? containerColor : Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(containerName,
            style: TextStyle(
              color: isActive ? Colors.white : Color.fromARGB(255, 73, 76, 237),
              fontSize: 17,
              // fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
