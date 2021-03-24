import 'package:chatoline/screens/home/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());

 

//  QuerySnapshot snapshot = await Firestore.instance.collection('message').getDocuments();
//   snapshot.documents.forEach((d) {
//     d.reference.updateData({'lido': false});
//    });

// firestore.collection('message').snapshots().listen((dado) {
//   dado.documents.forEach((d) { print(d.data);
//    });
//  });

  // firestore
  //     .collection('message')
  //     .document('WxcVOCZ29K3udjzjb837')
  //     .snapshots()
  //     .listen((dado) {
  //   print(dado.data);
  // });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: ChatScreen()
      );
  }
}
