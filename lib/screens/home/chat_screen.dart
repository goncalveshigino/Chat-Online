import 'dart:io';

import 'package:chatoline/text_composer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final Firestore firestore = Firestore.instance;

  final FirebaseStorage storage = FirebaseStorage.instance;
  

  Future<void> _sendMessage({String text, PickedFile file }) async {

    Map<String, dynamic> data = {};

    if(file != null){
      StorageUploadTask task = storage.ref().child(
        DateTime.now().millisecondsSinceEpoch.toString()
      ).putFile(file as File);

     StorageTaskSnapshot taskSnapshot  = await task.onComplete;
     String url = await taskSnapshot.ref.getDownloadURL();
     data['imgUrl'] = url;
    }
     
     if(text != null) data['text'] = text;


    firestore.collection('message').add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Hello'),
         centerTitle: true,
       ),
       body: Column(
         children: [
           Expanded(
            child: StreamBuilder<QuerySnapshot>(
             stream: firestore.collection('message').snapshots(),
              builder: (context,snapshot){
                switch (snapshot.connectionState) {
                  case  ConnectionState.none:
                  case ConnectionState.waiting:
                     return Center(
                       child: CircularProgressIndicator(

                       ),
                     );
                    break;
                  default:
                 List<DocumentSnapshot> documents = snapshot.data.documents.reversed.toList();

                 return ListView.builder(
                   itemCount: documents.length,
                   reverse: true,
                   itemBuilder: (context, index){
                     return ListTile(
                        title: Text(documents[index].data['text']),
                     );
                   },
                 );
                }
              },
             )
           ),
           TextComposer(
             _sendMessage
           ),
         ],
       ),
    );
  }
}