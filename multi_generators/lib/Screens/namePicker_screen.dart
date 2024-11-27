// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

class NamePickerScreen extends StatefulWidget {
  const NamePickerScreen({super.key});

  @override
  State<NamePickerScreen> createState() => _NamePickerScreenState();
}

class _NamePickerScreenState extends State<NamePickerScreen> {
  late TextEditingController nameController;
  String pickedName = '';
  Map<String, int> result = {};
  bool isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(); 
    result = {};
    nameController.addListener(() {
      setState(() {
        isButtonDisabled = nameController.text.isEmpty;
      });
    });
  }

  void pickNameWithAnimation() {
    final names = nameController.text.split(',').map((e) => e.trim()).toList();
    if (names.isNotEmpty) {
      final random = Random();
      final totalNames = names.length;
      int index = 0;
      Future<void> animate() async {
        await Future.delayed(const Duration(milliseconds: 200), () {
          setState(() {
            pickedName = names[index];
          });
        });
        index++;
        if (index < totalNames) {
          await animate();
        } else {
          setState(() {
            final randomIndex = random.nextInt(totalNames);
            pickedName = names[randomIndex];
            result.update(pickedName, (value) => value + 1, ifAbsent: () => 1);
          });
        }
      }
      animate();
    } else {
      setState(() {
        pickedName = '';
        
      });
    }
  }

  void clearTextField() {
    nameController.clear();
    setState(() {
      pickedName = '';
      isButtonDisabled = true;
      result.clear(); // Reset button state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Name Picker', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (pickedName.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black,
                ),
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  pickedName,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: nameController,
                onChanged: (value) {
                  setState(() {
                    isButtonDisabled = value.isEmpty;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter names separated by commas',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Text("Example: John, Dave, Steve, Nicole, Karen", style: TextStyle(color: Colors.grey[700])),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: isButtonDisabled ? null : pickNameWithAnimation,
                  child: Text('Pick a Name'),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: clearTextField,
                  child: Text('Clear'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: result.length,
                itemBuilder: (context, index) {
                  final key = result.keys.elementAt(index);
                  final value = result[key];
                  return Card(
                    color: Colors.amberAccent,
                    child: ListTile(
                      title: Center(child: Text(key, style: TextStyle(fontWeight: FontWeight.bold),)),
                      subtitle: Center(child: Text('Picked: $value times', style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}