import 'package:flutter/material.dart';

const KSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18,
);
 const KMesageTextFielddecoration = InputDecoration(
   contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
   hintText: 'Type Your Message here...',
   border: InputBorder.none
 );
 const KMessageContainerDecoration = BoxDecoration(
   border: Border(
     top: BorderSide(color: Colors.lightBlueAccent,width: 2)
   ),
 );