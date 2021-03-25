

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {

  TextComposer(this.sendMessage);

  Function({ String text, PickedFile file}) sendMessage;

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {

  final TextEditingController _controller = TextEditingController();

   
  final ImagePicker picker = ImagePicker();
  



  bool _isComposing = false;

  void _reset() {
     _controller.clear();
      setState(() {
        _isComposing = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[

          IconButton(
            icon:  Icon(Icons.photo_camera,),
            color: Colors.blue.shade300,
            onPressed: () async{
             final PickedFile file = await picker.getImage(source: ImageSource.camera);
             if(file == null) return;
             widget.sendMessage(file: file);
            },

          ),

          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration.collapsed(hintText: 'Enviar uma mensagem'),
              onChanged: (text){
                 setState(() {
                   _isComposing = text.isNotEmpty;
                 });
              },
              onSubmitted: (text){
                 widget.sendMessage(text: text);
                 _reset();
              },
            ),
          ),

          IconButton(
            icon: _isComposing 
            ?  Icon(Icons.send, color: Colors.blue,) :  Icon(Icons.send),
        
            onPressed: _isComposing ? (){
               widget.sendMessage(text: _controller.text);
                _reset();
            }: null,
          ),

        ],
      ),
    );
  }
}