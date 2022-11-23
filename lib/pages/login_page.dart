import 'package:chat/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: SizedBox(
            height: size.height * .9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ImageLogin(titulo: 'Messenger',),
          
                FormLogin(),
          
                const Label(
                  ruta: 'register',
                  titulo: '¿No tienes cuenta?',
                  subtitulo: 'Crea una ahora',
                ),
          
                const Text('Términos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200))
          
              ],
          
              ),
          ),
        ),
      ),
    );
  }
}