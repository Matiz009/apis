import 'package:flutter/material.dart';
import 'package:quiz_app/comments.dart';
import 'package:quiz_app/contact_us_form.dart';
import 'package:quiz_app/my_home_page.dart';
import 'package:quiz_app/posts.dart';
import 'package:quiz_app/splash_screen.dart';
import 'package:quiz_app/users.dart';
import 'dart:math';

import 'change_theme_button_widget.dart';
class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);
  final padding=const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    const name = 'Mati ul Rehman';
    const email='iammatiz00@gmail.com';
    const imageUrl='http://iammatiz.me/imgs/pic-2.jpeg';
    return Drawer(
      child: Material(
        color: const Color(0xFF363567),
        child: ListView(
          children: <Widget>[
            buildHeader(
              name:name,
              email:email,
              imageUrl:imageUrl
            ),
            ChangeThemeButtonWidget(),
            const SizedBox(height: 5,),
            const Divider(color: Colors.white,),
            const SizedBox(height: 10,),
            buildMenuItem(
              text:'Home',
              icon:Icons.home,
              onClicked:()=>selectedItem(context,0),
            ),
            buildMenuItem(
                text: 'Comments',
                icon: Icons.comment_rounded,
                onClicked:()=>selectedItem(context,1),
            ),
            buildMenuItem(
                text: 'Posts',
                icon: Icons.post_add_rounded,
                onClicked:()=>selectedItem(context,2),
            ),
            buildMenuItem(
                text: 'Users',
                icon: Icons.people_alt_outlined,
                onClicked:()=>selectedItem(context,3),
            ),
            const SizedBox(height: 20,),
            const Divider(color: Colors.white,),
            const SizedBox(height: 20,),
            buildMenuItem(
                text: 'Notifications',
                icon: Icons.notification_important,
                onClicked:()=>selectedItem(context,5),
            ),
            buildMenuItem(
                text: 'Updates',
                icon: Icons.update_outlined,
                onClicked:()=>selectedItem(context,6),
            ),
            buildMenuItem(
                text: 'Contact Us',
                icon: Icons.contact_page_outlined,
                onClicked:()=>selectedItem(context,7),
            ),
            buildMenuItem(
                text: 'About Us',
                icon: Icons.roundabout_right_outlined,
                onClicked:()=>selectedItem(context,8),
            ),
          ],
        ),
      ),
    );
  }

  buildMenuItem({required String text, required IconData icon, VoidCallback? onClicked}) {
    const color=Colors.white;
    const hoverColor=Colors.blue;
    return ListTile(
      leading: Icon(icon,color:color),
      title: Text(text,style: const TextStyle(color: color),),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  Widget buildHeader({
    required String imageUrl,
    required String name,
    required String email,
  }) =>
       Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(imageUrl)),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        );

  void selectedItem(BuildContext context, int index) {
    Random random = Random();
    int randomNumber = random.nextInt(10);
    Navigator.of(context).pop();
    switch(index){
      case 0:{
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>const HomePage(),)
        );
        break;
      }
      case 1:{
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>Comments(postId: randomNumber,),)
        );
        break;
      }
      case 2:{
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>Posts(userId: randomNumber),)
        );
        break;
      }
      case 3:{
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>const Users(),)
        );
        break;
      }
      case 7:{
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=> const ContactForm(),)
        );
        break;
      }
      default:{
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>const SplashScreen(),)
        );
        break;
      }
    }
  }
}
