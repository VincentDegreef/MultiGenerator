// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:multi_generators/Utils/CustomCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Multi Generator',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20), // Add some spacing
            Text(
              'What would you like to generate today?',
              style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth < 800) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildCards(),
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _buildCards(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCards() {
    return [
      CustomCard(
          generatorName: 'Random Number', generatorIcon: Icons.format_list_numbered),
      CustomCard(generatorName: 'Random Name', generatorIcon: Icons.person),
      CustomCard(generatorName: 'Name Picker', generatorIcon: Icons.group),
      CustomCard(generatorName: 'Coin Toss', generatorIcon: Icons.monetization_on),
    ];
  }
}