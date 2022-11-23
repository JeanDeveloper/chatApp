import 'package:chat/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FormRegister extends StatefulWidget {

  @override
  State<FormRegister> createState() => _FormRegisterState();

}

class _FormRegisterState extends State<FormRegister> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding:  const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [

          CustomInput(
            hinttext: 'Nombre',
            icon:const  Icon(Icons.person),
            isPassword: false,
            keyboradType: TextInputType.emailAddress,
            textController: nameController,
          ),

          CustomInput(
            hinttext: 'Email',
            icon:const  Icon(Icons.email_outlined),
            isPassword: false,
            keyboradType: TextInputType.emailAddress,
            textController: emailController,
          ),

          CustomInput(
            hinttext: 'Password',
            icon: const Icon(Icons.lock_outline),
            isPassword: true,
            keyboradType: TextInputType.visiblePassword,
            textController: passController,
          ),

          //TODO: Crear Boton

          ButtonAzul(
            onPressed: (){
              print(emailController.text);
              print(passController.text);
            },
            text: 'Ingrese',
          ),

        ],
      ),
    );
  }
}