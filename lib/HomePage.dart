// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart'; // Import the flutter_icons library

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context , value, child) => Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          title: Text(
            'Notes',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          centerTitle: true, // Center the title within the AppBar
          backgroundColor: Colors.white,
          actions: [
             Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(
                Ionicons.ellipsis_horizontal_circle_outline,
                size: 30, // Replace this with the Ionicon you want to use
                color: Color.fromARGB(255, 238, 204, 104),
                 // Change the color of the icon as needed
              ),
            ),
          ],
        ),
        
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Text('Notes',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ),
          ),
        //List of Notes 

        CupertinoListSection(
          children:[
            CupertinoListTile(title: Text('Hello'),)
          ],
        ),


        ],
      ),
    )
    );  
  }
}
