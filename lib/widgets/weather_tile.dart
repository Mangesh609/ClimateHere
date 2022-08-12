import 'package:flutter/material.dart';

class WeatherTile extends StatelessWidget {
  IconData icon ;
  String title ;
  String subtitle ;

  WeatherTile({required this.icon ,required this.title , required this.subtitle });

  //const WeatherTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:1,
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15,3,15,3),
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                color: Colors.purple,
                size: 28,
              ),
            ],
          ),
          title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w800,

            ),
          ),
          subtitle: Text(subtitle,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
