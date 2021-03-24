import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


 
void main() {
  
  runApp(MyApp());

Firestore firestore = Firestore.instance;

 firestore.collection('message').document('WxcVOCZ29K3udjzjb837').collection('arquivos').document().setData({
  'arqname': 'foto.png'
 });
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