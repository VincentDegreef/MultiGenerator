import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomCard extends StatelessWidget {
  final String generatorName;
  final IconData generatorIcon;
  
  const CustomCard({
    Key? key,
    required this.generatorName,
    required this.generatorIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      color: Colors.amberAccent,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(
              generatorIcon,
              size: 50.0,
              color: Colors.grey[800],
            ),
            SizedBox(height: 10),
            Text(
              generatorName,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms);
  }
}