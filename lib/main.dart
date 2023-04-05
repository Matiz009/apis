import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/theme_provider.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF363567), // navigation bar color
    statusBarColor: Color(0xFF363567), // status bar color
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)=>ChangeNotifierProvider(
      create: (context)=>ThemeProvider(),
      builder: (context,_) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: themeProvider.themeMode,
          darkTheme: MyThemes.darkTheme,
          theme: MyThemes.lightTheme,
          home: const SplashScreen(),
        );
      }
    );
  }


