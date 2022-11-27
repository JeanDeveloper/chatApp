import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {

  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  
  final _textController = TextEditingController();
  final _focusNode      = FocusNode();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        elevation: 1,  
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
              child: const Text('Te', style: TextStyle(fontSize: 12)),
            ),
            const SizedBox( height: 3),
            const Text('Meliisa Flores', style: TextStyle(color: Colors.black87, fontSize: 10)),
          ],
        ),
      ),
      
      body: Column(
        children: [

          Flexible(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: ( _ , i) => Text('$i'),
              reverse: true,
            )
          ),
          const Divider( height: 1 ),

          //TODO: CAJA DE TEXTO
          Container(
            color: Colors.white,
            height: 70,
            child: _inputChat(),
          )

        ],
      )

    );
  }

  Widget _inputChat(){

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric( horizontal: 8 ),
        child: Row(
          children: [

            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: ( String texto ){
                  // TODO: CUANDO HAY UN VALOR, PARA PODER POSTEAR
                },
                decoration: const InputDecoration.collapsed(
                  hintText: 'Enviar Mensaje',
                ),
                focusNode: _focusNode,
              )
            ),

            //BOTON DE ENVIAR

            Container(
              margin: const EdgeInsets.symmetric( horizontal: 4 ),
              child: 
                Platform.isIOS 
                  ? CupertinoButton(
                    onPressed: () {},
                    child: const Text('Enviar'),
                  
                  )
                  : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: IconButton(
                      onPressed: (){
                        print(_textController.text);
                      }, 
                      icon: Icon( Icons.send, color: Colors.blue[400] )
                    ),
                  )
            )

          ],
        ),

      ) 
    
    );

  }

  _handleSubmit(String texto){
    print(texto);
    _textController.clear();
    _focusNode.requestFocus();
  }

}