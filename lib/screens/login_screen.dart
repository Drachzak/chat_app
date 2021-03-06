import 'dart:html';

import 'package:chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LOGIN_SCREEN';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                child: Image.asset('image/chatlogo.png'),
              ),
              SizedBox(
                height: 48,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                onChanged: (newValue){
                  email = newValue;
                },
                //Do something with the user input
                decoration: InputDecoration(
                  hintText: 'Input Your Email',
                  contentPadding:
                    EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent,width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlueAccent,width: 2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(32))
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                onChanged: (newValue){
                  password = newValue;
                },
                //Do something with the user input
                decoration: InputDecoration(
                  hintText: 'Input Your Password',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent,width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlueAccent,width: 2,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(32))
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 16),
                child: Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  elevation: 5,
                  child: MaterialButton(
                    onPressed: ()async{
                      setState(() {
                        showSpinner = true;
                      });
                      //implement login functioniality
                     try{
                       var loginUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
                       if(loginUser != null) {
                         Navigator.pushNamed(context, ChatScreen.id);
                       }
                     }catch(e){
                       print(e);
                     }
                    },
                    minWidth: 200,
                    height: 42,
                    child: Text('Log in'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
