import 'package:flutter/material.dart';
import 'navigation_widget_drawer.dart';
class ContactForm extends StatelessWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF363567),
        centerTitle: true,
        title: Text("Quick Guides",style: TextStyle(color: Theme.of(context).colorScheme.onSurface),),
      ),
      backgroundColor: const Color(0xFF363567),
      body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  <Widget>[
           const SizedBox(height: 30,),
          const Text('Contact Us',textAlign: TextAlign.center,style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),),
          const SizedBox(height: 10,),
          const Text('Please share your valuable feedback with us',style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children:  <Widget>[
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Name:',
                    border: InputBorder.none,
                  ),
                ),
                 const SizedBox(height: 10,),
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Email:',
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 10,),
                const TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Message:',
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 7,),
                MaterialButton(minWidth: double.infinity,color:Colors.black,onPressed: (){ },child: const Text('Submit',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),)
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }

}
