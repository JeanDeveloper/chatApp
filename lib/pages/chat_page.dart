import 'dart:io';

import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {

  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  
  final _textController = TextEditingController();
  final _focusNode      = FocusNode();
  bool _isWritting     = false;

  List<ChatMessage> _messages = [
    // ChatMessage(texto: 'Hola Mundo', uid: '123'),
    // ChatMessage(texto: 'Hola Mundo', uid: '123'),
    // ChatMessage(texto: 'Hola Mundo', uid: '123'),
    // ChatMessage(texto: 'Hola Mundo', uid: '123123123'),
    // ChatMessage(texto: 'Hola Mundo', uid: '123422'),
    // ChatMessage(texto: 'Hola Mundo', uid: '123'),
    // ChatMessage(texto: 'Hola Mundo', uid: '12324242'),
    // ChatMessage(texto: 'Hola Mundo', uid: '123'),

  ];


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
              child: const Text('MF', style: TextStyle(fontSize: 12)),
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
              itemCount: _messages.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: ( _ , i) => _messages[i],
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

                  setState(() {
                    if( texto.trim().isNotEmpty ){
                      _isWritting = true;
                    }else{
                      _isWritting = false;
                    }
                  });

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
                    child: IconTheme(
                      data: IconThemeData(color: Colors.blue[400]),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: _isWritting
                          ? () => _handleSubmit( _textController.text.trim() )
                          : null,
                        // onPressed: (){
                        //   print(_textController.text);
                        // }, 
                        icon: const Icon( Icons.send )
                    
                      ),
                    ),
                  )
            )

          ],
        ),

      ) 
    
    );

  }

  _handleSubmit(String texto){

    if( texto.isEmpty ) return ; 

    print(texto);
    _textController.clear();
    _focusNode.requestFocus();

    final _newMessage = ChatMessage(
      texto: texto, 
      uid: '123',
      animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 400)),
    );
    _messages.insert(0, _newMessage);
    _newMessage.animationController.forward();

    setState(() {
      _isWritting = false;
    });
  }

}