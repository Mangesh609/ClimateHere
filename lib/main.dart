import 'package:flutter/material.dart';
import 'package:climatehere/services/loading.dart';

void main(){
  runApp(
    MaterialApp(
      home:Main() ,
    )
  );
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}
