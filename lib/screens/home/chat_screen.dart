import 'package:chatoline/text_composer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final Firestore firestore = Firestore.instance;

  void _sendMessage(String text){
    firestore.collection('message').add({
      'text': text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Hello'),
         centerTitle: true,
       ),
       body: TextComposer(
         _sendMessage
       ),
    );
  }
}