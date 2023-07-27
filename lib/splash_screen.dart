import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:noteapp/HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 @override
 void initState(){
  super.initState();
  _Navigate();
 }

 Future<void> _Navigate() async {
  await Future.delayed(Duration(seconds: 11 ));
  _NavigateHomepage();
 }

 void _NavigateHomepage(){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homepage()),
  );
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
        child: Lottie.network('https://lottie.host/8bcb8b77-7a1e-4bc4-80ce-10277567fd8d/oX4WMDup5w.json',
        
        ),
       ),

    );
  }
}
