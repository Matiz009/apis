import 'package:flutter/material.dart';
import 'package:quiz_app/navigation_widget_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Quick Guides',textAlign: TextAlign.center,style: TextStyle(
          fontFamily: 'Times New Roman',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        ),
        backgroundColor: const Color(0xFF363567),
        centerTitle: true,
      ),
      body:  const Card(child: Text(' '),),

    );
  }
}
