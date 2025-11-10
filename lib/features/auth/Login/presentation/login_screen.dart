import 'package:blog_app/common_widgets/custom_button.dart';
import 'package:blog_app/common_widgets/custom_textform.dart';
import 'package:blog_app/constants/app_constants.dart';
import 'package:blog_app/features/auth/Regsitration/presentation/register_screen.dart';
import 'package:blog_app/features/home/presentation/navigation_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text("Sign in"),
        centerTitle: true,
        titleTextStyle: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Text(
              "wellcom Back!",
              style: GoogleFonts.inter(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Form(
              key: formkey,
              child: Column(
                children: [
                  CustomTextform(
                    controller: email,
                    hintext: "Email or username",
                    validateText: "Enter your email ",
                  ),
                  SizedBox(height: 20.h),
                  CustomTextform(
                    validateText: "Enter a Password",
                    controller: password,
                    hintext: "password",
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            InkWell(
              onTap: () {
                if (formkey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NavigationHome()),
                  );
                }
              },
              child: CustomButton(text: "Sign Up "),
            ),
            Spacer(),
            Text(
              "Dont Have an account?",
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
            SizedBox(height: 10.h),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              ),
              child: Text(
                "Sign Up",
                style: TextStyle(color: buttonColor, fontSize: 12),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
