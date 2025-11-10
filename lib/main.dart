import 'package:blog_app/features/Onboarding/presentation/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: (context, child) => MaterialApp(
        title: 'Blog App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          textTheme: GoogleFonts.interTextTheme(),
          scaffoldBackgroundColor: Colors.black,
        ),
        debugShowCheckedModeBanner: false,
        home: OnboardingScreen(),
      ),
    );
  }
}
