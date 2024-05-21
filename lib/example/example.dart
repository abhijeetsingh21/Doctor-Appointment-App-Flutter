import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_appointment/Models/userModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LimitedListView extends StatefulWidget {
  @override
  _LimitedListViewState createState() => _LimitedListViewState();
}

class _LimitedListViewState extends State<LimitedListView> {
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
  ];

  PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Limited ListView Example'),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 1;
              if (_pageController.position.haveDimensions) {
                value = _pageController.page! - index;
                value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
              }
              return Center(
                child: SizedBox(
                  height: Curves.easeOut.transform(value) * 200,
                  width: Curves.easeOut.transform(value) * 300,
                  child: child,
                ),
              );
            },
            child: Card(
              elevation: 6,
              child: Center(
                child: Text(
                  items[index],
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class MyTextApp extends StatefulWidget {
  MyTextApp({super.key});

  @override
  State<MyTextApp> createState() => _MyTextAppState();
}

class _MyTextAppState extends State<MyTextApp> {
  List availableDoctors = [
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
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SafeArea(
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Column(
  //           children: [
  //             Expanded(
  //               child: ListView.builder(
  //                 shrinkWrap: true,
  //                 scrollDirection: Axis.vertical,
  //                 itemCount: availableDoctors.length,
  //                 itemBuilder: (context, idx) {
  //                   return Container(
  //                     padding: EdgeInsets.all(8),
  //                     height: 150,
  //                     width: 120,
  //                     decoration: BoxDecoration(
  //                         // color: Colors.black12,
  //                         borderRadius: BorderRadius.circular(15.0),
  //                         border: Border.all(color: Colors.black12)),
  //                     child: Column(
  //                       children: [
  //                         CircleAvatar(
  //                           radius: 30,
  //                           child: ClipRRect(
  //                             borderRadius: BorderRadius.circular(100),
  //                             child: Image.network(
  //                                 fit: BoxFit.cover, availableDoctors[idx][0]),
  //                           ),
  //                         ),
  //                         SizedBox(height: 7),
  //                         Text(availableDoctors[idx][1]),
  //                         SizedBox(height: 7),
  //                         Text(availableDoctors[idx][2]),
  //                       ],
  //                     ),
  //                   );
  //                 },
  //               ),
  //             ),
  //             SizedBox(height: 10),
  //             Text('NOt so funny'),
  //             SizedBox(height: 10),
  //             Expanded(
  //               child: ListView.builder(
  //                 shrinkWrap: true,
  //                 scrollDirection: Axis.horizontal,
  //                 itemCount: availableDoctors.length,
  //                 itemBuilder: (context, idx) {
  //                   return Container(
  //                     padding: EdgeInsets.all(8),
  //                     height: 150,
  //                     width: 120,
  //                     decoration: BoxDecoration(
  //                         // color: Colors.black12,
  //                         borderRadius: BorderRadius.circular(15.0),
  //                         border: Border.all(color: Colors.black12)),
  //                     child: Column(
  //                       children: [
  //                         CircleAvatar(
  //                           radius: 30,
  //                           child: ClipRRect(
  //                             borderRadius: BorderRadius.circular(100),
  //                             child: Image.network(
  //                                 fit: BoxFit.cover, availableDoctors[idx][0]),
  //                           ),
  //                         ),
  //                         SizedBox(height: 7),
  //                         Text(availableDoctors[idx][1]),
  //                         SizedBox(height: 7),
  //                         Text(availableDoctors[idx][2]),
  //                       ],
  //                     ),
  //                   );
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  var _firebaseFirestore = FirebaseFirestore.instance;
  List info = [];
  List doctorInfo = [];
  String image = '';
  Future<List<DoctorModel>> nameDoctor() async {
    final snapshot = await _firebaseFirestore.collection('doctors').get();
    final doctor =
        snapshot.docs.map((e) => DoctorModel.doctorFromSnapshot(e)).toList();
    for (var tmp in doctor) {
      doctorInfo.add([tmp.type, tmp.img]);
    }
    print('this is doctor info ${doctorInfo}');
    return doctor;
  }

  Future<List<UserModel>> getUserDetails() async {
    final snapshot = await _firebaseFirestore.collection('user').get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    // print('this is user Data${userData}');

    for (var tmp in userData) {
      info.add([tmp.email, tmp.name, tmp.img]);
      // print("this is tmp user ${tmp.email}");
    }
    // print('this is user info ${info}');
    return userData;
  }

  // StreamBuilder<QuerySnapshot<Map<String, dynamic>>> fetchDetails() {
  //   return StreamBuilder(
  //       stream: _firebaseFirestore.collection('doctors').snapshots(),
  //       builder: (context, snapshot) {
  //         return (!snapshot.hasData)
  //             ? CircularProgressIndicator()
  //             : ListView.builder(
  //                 itemCount: snapshot.data!.docs.length,
  //                 itemBuilder: (context, idx) {
  //                   var tmp = snapshot.data!.docs[idx]['img'];
  //                   // info.add(tmp);
  //                   print('This is tmp value of snapshot ${tmp}');
  //                   return Image.network(tmp);
  //                 });
  //       });
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   nameDoctor();

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // nameDoctor();
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          TextButton(
              child: Text('click'),
              onPressed: () async {
                nameDoctor();
              }),
          FutureBuilder(
            future: nameDoctor(),
            builder: (context, snapshot) {
              return doctorInfo.length == 0
                  ? CircularProgressIndicator()
                  : Image.network(doctorInfo[0][1]);
            },
          ),
        ]));
  // }
}
}

