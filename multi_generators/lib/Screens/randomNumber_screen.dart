// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RandomNumberScreen extends StatefulWidget {
  const RandomNumberScreen({Key? key});

  @override
  State<RandomNumberScreen> createState() => _RandomNumberScreenState();
}

class _RandomNumberScreenState extends State<RandomNumberScreen> {
  late TextEditingController minController;
  late TextEditingController maxController;
  int randomNumber = 0;

  @override
  void initState() {
    super.initState();
    minController = TextEditingController();
    maxController = TextEditingController();
  }

  @override
  void dispose() {
    minController.dispose();
    maxController.dispose();
    super.dispose();
  }

  void generateRandomNumber() {
    final min = int.tryParse(minController.text) ?? 0;
    final max = int.tryParse(maxController.text) ?? 100;
    setState(() {
      randomNumber = -1;
    });
    Future.delayed(Duration(seconds: 1), () {
      final random = Random();
      setState(() {
        randomNumber = min + random.nextInt(max - min + 1);
      });
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Generate Random Number',
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'Enter Min and Max values to generate a random number',
                style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
              ),
              Text(
                'Min: 0, Max: 100 by default',
                style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
              ),
              const SizedBox(height: 10.0),
              minMaxFields(),
              const SizedBox(height: 50.0),
              SizedBox(
                width: 200,
                height: 100,
                child: Card(
                  color: Colors.black,
                  child: Padding(
                    padding: EdgeInsets.all(20.0), // Adjust padding as needed
                    child: Center(
                      child: randomNumber == -1 ? CircularProgressIndicator(color: Colors.white, strokeWidth: 6,) :
                       Text(
                        '$randomNumber',
                        style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[300],
                  ),
                  onPressed: generateRandomNumber,
                  child: Text(
                    'Generate Number',
                    style: TextStyle(color: Colors.black, fontSize: 14.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container minMaxFields() {
    return Container( // Providing constraints
              constraints: BoxConstraints(maxWidth: 500), // Adjust max width as needed
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: minController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Min',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: maxController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Max',
                      ),
                    ),
                  ),
                ],
              ),
            );
  }
}