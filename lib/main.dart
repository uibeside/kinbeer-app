import 'package:flutter/material.dart';
import 'package:kinbeer_app/pages/history.dart';
import 'package:kinbeer_app/pages/homePage.dart';
import 'package:kinbeer_app/pages/splashpage.dart';
import 'package:kinbeer_app/widgets/emptyState.dart';

void main() {
  runApp(KinbeerGameApp());
}

class KinbeerGameApp extends StatefulWidget {
  const KinbeerGameApp({super.key});

  @override
  State<KinbeerGameApp> createState() => _KinbeerGameAppState();
}

class _KinbeerGameAppState extends State<KinbeerGameApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: 'MiSansLao'
      ),

      home: SplashPage(),
    );
  }
}

