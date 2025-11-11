import 'package:blog_app/common_widgets/custom_button.dart';
import 'package:blog_app/common_widgets/custom_textform.dart';
import 'package:blog_app/constants/app_constants.dart';
import 'package:blog_app/features/home/presentation/navigation_home.dart';
import 'package:blog_app/features/profile/data/change_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ChangePassword api = ChangePassword();
    TextEditingController currentPassword = TextEditingController();
    TextEditingController newPassword = TextEditingController();
    TextEditingController renewPassword = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text("Update Password"),
        titleTextStyle: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              "Current Password",
              style: TextStyle(fontSize: 16.sp, color: Colors.white),
            ),

            SizedBox(height: 5.h),
            CustomTextform(
              validateText: "Enter your Current Password",
              controller: currentPassword,
              hintext: "Enter your Current Password",
            ),

            SizedBox(height: 20.h),
            Text(
              "New password",
              style: TextStyle(fontSize: 16.sp, color: Colors.white),
            ),
            SizedBox(height: 5.h),
            CustomTextform(
              validateText: "Enter your new Password",
              controller: newPassword,
              hintext: "Enter your new Password",
            ),
            SizedBox(height: 20.h),
            Text(
              "Confirm New Password",
              style: TextStyle(fontSize: 16.sp, color: Colors.white),
            ),
            SizedBox(height: 5.h),
            CustomTextform(
              validateText: "Confirm your new Password",
              controller: renewPassword,
              hintext: "Confirm your new Password",
            ),
            Spacer(),
            InkWell(
              onTap: () async {
                if (newPassword.text != renewPassword.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "New password and Confirm New password are not same!",
                        style: GoogleFonts.inter(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "changing your password.....",
                        style: GoogleFonts.inter(color: Colors.white),
                      ),
                      backgroundColor: buttonColor,
                    ),
                  );
                  var data = await api.chagepass(
                    oldpass: currentPassword.text,
                    newPass: newPassword.text,
                  );
                  if (data["success"] == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Password Change Success!",
                          style: GoogleFonts.inter(color: Colors.white),
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NavigationHome()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Pleas try again Later.",
                          style: GoogleFonts.inter(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              },
              child: CustomButton(text: "update Password"),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
