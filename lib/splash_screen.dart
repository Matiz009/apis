import 'package:flutter/material.dart';
import 'package:quiz_app/users.dart';
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
          builder: (context) => const Users(),
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
          color: Colors.blueAccent
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
                backgroundImage: NetworkImage('https://img.freepik.com/free-vector/cute-panda-with-bamboo_138676-3053.jpg?w=740&t=st=1679485578~exp=1679486178~hmac=66dd112edfe085422aa880200a35adffd963c4aad153987783929950a5c4fa33'),
              ),
            )),
            SizedBox(height: 200,),
            CircularProgressIndicator(color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
