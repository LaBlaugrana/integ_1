import 'package:Hush/register.dart';
import 'package:flutter/material.dart';
import 'login.dart';


class Authpage extends StatefulWidget {
  const Authpage({Key? key}) : super(key: key);

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {

  //INITIALLY,SHOW THE LOGIN PAGE
  bool showLoginPage=true;
  void toggleScreens(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return Login(showRegisterpage: toggleScreens);
    }
    else{
      return RegisterPage(showLoginPage:toggleScreens );
    }
  }
}
