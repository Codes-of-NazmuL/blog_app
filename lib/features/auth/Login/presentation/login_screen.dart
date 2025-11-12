// ignore_for_file: use_build_context_synchronously

import 'package:blog_app/common_widgets/custom_button.dart';
import 'package:blog_app/common_widgets/custom_textform.dart';
import 'package:blog_app/constants/app_constants.dart';
import 'package:blog_app/features/auth/Login/data/api_login.dart';
import 'package:blog_app/features/auth/Regsitration/presentation/register_screen.dart';
import 'package:blog_app/features/home/presentation/navigation_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetStorage();
    ApiLogin apiLogin = ApiLogin();
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
                    hintext: "Email",
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
              onTap: () async {
                if (formkey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Logging In pleas wait...",
                        style: GoogleFonts.inter(color: Colors.white),
                      ),
                      backgroundColor: buttonColor,
                    ),
                  );
                  if (formkey.currentState!.validate()) {
                    await apiLogin.loginAcc(
                      email: email.text,
                      password: password.text,
                    );
                    String? token = store.read("token");
                    if (token != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Login Success",
                            style: GoogleFonts.inter(color: Colors.white),
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavigationHome(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Login Faild.\n Try Again.",
                            style: GoogleFonts.inter(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                }
              },
              child: CustomButton(text: "Sign in "),
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
