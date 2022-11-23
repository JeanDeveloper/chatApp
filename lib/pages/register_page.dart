import 'package:chat/widgets/form_register.dart';
import 'package:chat/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

  const RegisterPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),

          child: SizedBox(
            height: size.height * .9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ImageLogin(titulo: 'Registro',),
          
                FormRegister(),
          
                const Label(
                  ruta: 'login',
                  titulo: '¿Tienes una cuenta?',
                  subtitulo: 'Ingresa ahora',
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