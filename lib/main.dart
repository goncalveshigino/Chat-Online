import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'pages/home/home.dart';
 
void main() {
  
  runApp(MyApp());

  Firestore.instance.collection("col").document('doc').setData({"texto": "gonza"});
} 
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Material App',
      home: Scaffold()
    );
  }
}