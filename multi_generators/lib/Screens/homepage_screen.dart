

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:multi_generators/Screens/coinToss_screen.dart';
import 'package:multi_generators/Utils/appStyles.dart';

import 'home_screen.dart';
import 'namePicker_screen.dart';
import 'randomName_screen.dart';
import 'randomNumber_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    
    Widget page;
    switch(selectedPage){
      case 0:
        page = HomeScreen();
      break;
      case 1:
        page = RandomNumberScreen();
      break;
      case 2:
        page = RandomNameScreen();
      break;
      case 3:
        page = NamePickerScreen();
      break;
      case 4:
        page = CoinTossScreen();
      default:
        page = HomeScreen();
    }
    return LayoutBuilder(
      builder: (context, constraints){
        return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber[300],
          title: Animate(effects: [FadeEffect()],
            child: Text('Multi Generator', style: AppStyles.appBarStyle,)
            ),
          leading: Builder(
              builder: (context) => IconButton( // Use Builder here
                icon: Icon(Icons.menu, size: 30,),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.amber[300],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.settings, size: 100, color: Colors.black,),
                    Text('Multi Generator', style: AppStyles.drawerHeaderStyle,)
                  ],
                )
              ),
              ListTile(
                title: Text('Home', style: AppStyles.drawerItemStyle,),
                leading: Icon(Icons.home),
                onTap: (){
                  setState(() {
                    selectedPage = 0;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Random Number', style: AppStyles.drawerItemStyle,),
                leading: Icon(Icons.looks_one),
                onTap: (){
                  setState(() {
                    selectedPage = 1;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Fantasy Name', style: AppStyles.drawerItemStyle,),
                leading: Icon(Icons.person),
                onTap: (){
                  setState(() {
                    selectedPage = 2;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Name Picker', style: AppStyles.drawerItemStyle,),
                leading: Icon(Icons.people),
                onTap: (){
                  setState(() {
                    selectedPage = 3;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Coin Toss', style: AppStyles.drawerItemStyle,),
                leading: Icon(Icons.monetization_on),
                onTap: (){
                  setState(() {
                    selectedPage = 4;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Row(
          children: [
            Expanded(
              child: Container(
                color: AppStyles.appTheme.hoverColor,
                child: page,
              ))
          ],
        ),
        );
      },
    );
  }
}