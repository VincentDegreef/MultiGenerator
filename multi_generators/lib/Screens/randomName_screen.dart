// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

import '../dataInfo/namesLists.dart';

class RandomNameScreen extends StatefulWidget {
  const RandomNameScreen({super.key});

  @override
  State<RandomNameScreen> createState() => _RandomNameScreenState();
}

class _RandomNameScreenState extends State<RandomNameScreen> {
  late String fantasyName = '';

  @override
  void initState() {
    super.initState();
    fantasyName = '';
  }
  void generateFantasyName() {
    fantasyName = '';
    fantasyName += NamesList.beginnings[Random().nextInt(NamesList.beginnings.length)];
    fantasyName += NamesList.middles[Random().nextInt(NamesList.middles.length)];
    fantasyName += NamesList.endings[Random().nextInt(NamesList.endings.length)];
    setState(() {
      fantasyName = fantasyName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Random Fantasy Name Generator', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(fantasyName.isEmpty)
            Text(
              'Press the button below to generate a fantasy name',
              style: TextStyle(fontSize: 20.0, color: Colors.grey[700]),
              textAlign: TextAlign.center,),
            if(fantasyName.isNotEmpty)
            Card(
              color: Colors.amberAccent,
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(fantasyName,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 100), // Add some spacing
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.black,
              ),
              onPressed: generateFantasyName, 
              child: const Text('Generate Fantasy Name', style: TextStyle(color: Colors.amberAccent),),),
          ],
        ),
      ),
    );
  }
}