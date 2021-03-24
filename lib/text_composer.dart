import 'package:flutter/material.dart';

class TextComposer extends StatefulWidget {
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {

  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[

          IconButton(
            icon:  Icon(Icons.photo_camera,),
            color: Colors.blue.shade300,
            onPressed: (){

            },

          ),

          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(hintText: 'Enviar uma mensagem'),
              onChanged: (text){
                 setState(() {
                   _isComposing = text.isNotEmpty;
                 });
              },
              onSubmitted: (text){

              },
            ),
          ),

          IconButton(
            icon: _isComposing 
            ?  Icon(Icons.send, color: Colors.blue,) :  Icon(Icons.send,),
        
            onPressed: _isComposing ? (){

            }: null,
          ),

        ],
      ),
    );
  }
}