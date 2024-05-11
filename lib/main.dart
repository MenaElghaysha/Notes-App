import'package:flutter/material.dart';
import 'package:todo_app/screens/add_note.dart';
import 'package:todo_app/screens/home.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
@override
Widget build (BuildContext context){
  return MaterialApp(
    debugShowCheckedModeBanner:false,
    home:Home(),
    routes:{
      "addnotes":(context)=>AddNotes()
    },
  );
}
}



