import 'package:flutter/material.dart';
import 'package:climatehere/services/loading.dart';
import 'package:native_notify/native_notify.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  NativeNotify.initialize(1415, 'LzgvMprbpgN67j7WHovCWj', null, null);
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
