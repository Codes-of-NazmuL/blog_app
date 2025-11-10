import 'package:blog_app/common_widgets/custom_button.dart';
import 'package:blog_app/features/auth/Login/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 320.h,
            width: 390.w,
            child: Center(
              child: Image.asset(
                "assets/images/home_screen_image.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Wellcome to your Personal Blog Space",
              style: GoogleFonts.newsreader(
                fontSize: 28.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Discover articles, save your favorites, and engage with the community.",
              style: GoogleFonts.newsreader(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 260.h),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: CustomButton(
              text: "Get Started",
              style: GoogleFonts.newsreader(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
