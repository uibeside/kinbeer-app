import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kinbeer_app/pages/homePage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>{
    @override
      void initstate(){
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), (){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
    return Scaffold(

      body: Stack(
        children: [
          Container(
            width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF2F80ED), Color(0xFF4D55F0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                )
              ),
          ),
          Container(
            child: Image.asset("assets/images/bg.png") ,
          ),
          Center(
            child: Image.asset("assets/images/kinbeer_logo.png", height: 106)
          ),
        ],
      ),




      // body: Container(
      //   width: double.infinity,
      //   decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //         colors: [Color(0xFF2F80ED), Color(0xFF4D55F0)],
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight
      //     )
      //   ),
      //
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Image.asset("assets/images/kinbeer_logo.png", height: 106)
      //     ],
      //   ),
      // ),
    );
  }
}
