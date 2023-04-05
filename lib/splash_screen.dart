import 'package:flutter/material.dart';
import 'package:quiz_app/my_home_page.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 10),(){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      ); // Prints after 1 second.
    });
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color(0xFF363567),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Center(child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 120,
              child: CircleAvatar(
                radius: 110,
                backgroundImage: NetworkImage('https://img.freepik.com/free-vector/learning-concept-illustration_114360-6186.jpg?w=740&t=st=1680637984~exp=1680638584~hmac=0275c987703c466942859aaabaee936921121b242e57b0f873045ecf55477c8b'),
              ),
            )),
            SizedBox(height: 50,),
            Text('Welcome to Quick Guides',textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Britanic Bold',fontSize: 25,color: Colors.white),),
            SizedBox(height: 100,),
            CircularProgressIndicator(color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
