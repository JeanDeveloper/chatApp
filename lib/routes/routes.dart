import 'package:chat/pages/pages.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {

  'user'    : ( _ ) => UserPage(),
  'chat'    : ( _ ) => ChatPage(),
  'loading' : ( _ ) => LoadingPage(),
  'login'   : ( _ ) => LoginPage(),
  'register': ( _ ) => RegisterPage(),

};