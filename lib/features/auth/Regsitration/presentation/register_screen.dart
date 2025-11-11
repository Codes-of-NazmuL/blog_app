// ignore_for_file: use_build_context_synchronously

import 'package:blog_app/common_widgets/custom_button.dart';
import 'package:blog_app/common_widgets/custom_textform.dart';
import 'package:blog_app/constants/app_constants.dart';
import 'package:blog_app/features/auth/Login/presentation/login_screen.dart';
import 'package:blog_app/features/auth/Regsitration/data/api_register.dart';
import 'package:blog_app/features/home/presentation/home_screen.dart';
import 'package:blog_app/features/home/presentation/navigation_home.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetStorage();
    ApiRegister apiRegister = ApiRegister();
    final formkey = GlobalKey<FormState>();
    TextEditingController username = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController phone = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text("Create Acccount"),
        centerTitle: true,
        titleTextStyle: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 20.h),
            Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                  SizedBox(height: 5.h),
                  CustomTextform(
                    validateText: "Enter your userName",
                    controller: username,
                    hintext: "Enter your username",
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 5.h),
                  CustomTextform(
                    controller: email,
                    hintext: "Enter Your email",
                    validateText: "Enter Your email",
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                  SizedBox(height: 5.h),
                  CustomTextform(
                    validateText: "Enter Your password",
                    controller: password,
                    hintext: "Password",
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Phone",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                  SizedBox(height: 5.h),
                  CustomTextform(
                    controller: phone,
                    hintext: "phone",
                    validateText: "Enter your password again",
                  ),
                  SizedBox(height: 20.h),
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
                        "Creating Account Pleas wait.",
                        style: GoogleFonts.inter(color: Colors.white),
                      ),
                      backgroundColor: buttonColor,
                    ),
                  );
                  await apiRegister.registerAcc(
                    name: username.text,
                    email: email.text,
                    password: password.text,
                    phone: phone.text,
                  );
                  String? token = store.read("token");
                  if (token != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Register Success",
                          style: GoogleFonts.inter(color: Colors.white),
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => NavigationHome()),
                      (Route<dynamic> route) => false,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Registration Faild. \n Try Again or Check you Details Again!.",
                          style: GoogleFonts.inter(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              },
              child: CustomButton(text: "Register"),
            ),
            SizedBox(height: 240.h),
            Center(
              child: Text(
                "Alrady Have an account?",
                style: TextStyle(color: Colors.white54, fontSize: 12.sp),
              ),
            ),
            SizedBox(height: 10.h),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              ),
              child: Center(
                child: Text(
                  "Log in",
                  style: TextStyle(color: buttonColor, fontSize: 12.sp),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
