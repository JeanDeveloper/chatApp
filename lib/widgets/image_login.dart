import 'package:flutter/material.dart';

class ImageLogin extends StatelessWidget {

  final String titulo;




  const ImageLogin({Key? key, required this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(

        width: 170,
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            const Image(image: AssetImage('assets/tag-logo.png'), height: 200, width: 200,),
            const SizedBox(height: 10),
            Text(titulo)
          ],
        ),

      ),
    );
  }
}