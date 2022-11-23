import 'package:flutter/material.dart';


class ButtonAzul extends StatelessWidget {

  final String text;
  final Function()? onPressed;

  const ButtonAzul({
    required this.text, 
    required this.onPressed
  });


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(2),
        backgroundColor: MaterialStateProperty.all(Colors.blue),
        shape: MaterialStateProperty.all(const StadiumBorder())
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 17),),
        ),
      ),
    );
    
  }
}