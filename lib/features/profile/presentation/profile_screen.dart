import 'package:blog_app/constants/app_constants.dart';
import 'package:blog_app/features/auth/Login/data/api_login.dart';
import 'package:blog_app/features/auth/Login/presentation/login_screen.dart';
import 'package:blog_app/features/home/presentation/home_screen.dart';
import 'package:blog_app/features/profile/data/log_out_api.dart';
import 'package:blog_app/features/profile/data/profile_data_api.dart';
import 'package:blog_app/features/profile/presentation/change_password_screen.dart';
import 'package:blog_app/features/profile/presentation/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetStorage();
    ProfileDataApi api = ProfileDataApi();
    LogOutApi logOutApi = LogOutApi();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          // onTap: () {
          //   Navigator.pop(context);
          // },
          // child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text("Profile"),
        titleTextStyle: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: api.fetchProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  SizedBox(height: 20.h),
                  CircleAvatar(
                    radius: 64,
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(100),
                      child: Image.network(
                        "https://avatar.iran.liara.run/public/${snapshot.data!.data.user.id % 5 + 1}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      snapshot.data!.data.user.name,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Text(
                      snapshot.data!.data.user.email,
                      style: GoogleFonts.inter(
                        color: Colors.white54,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Text(
                      snapshot.data!.data.user.phone,
                      style: GoogleFonts.inter(
                        color: Colors.white54,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfile(
                          name: snapshot.data!.data.user.name,
                          Id: snapshot.data!.data.user.id,
                          phone: snapshot.data!.data.user.phone,
                        ),
                      ),
                    ),
                    child: SizedBox(
                      height: 56.h,
                      width: 390.w,
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: formColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20.dg,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Edit Profile",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangePasswordScreen(),
                      ),
                    ),
                    child: SizedBox(
                      height: 56.h,
                      width: 390.w,
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: formColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.lock_outline,
                              color: Colors.white,
                              size: 20.dg,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Update Password",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 230.h),
                  InkWell(
                    onTap: () async {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Loggin out....',
                            style: GoogleFonts.inter(color: Colors.white),
                          ),
                          backgroundColor: buttonColor,
                          duration: Duration(seconds: 1),
                        ),
                      );
                      var data = await logOutApi.logoutPost();
                      if (data["success"]) {
                        store.erase();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'SuccessFully Logged Out!',
                              style: GoogleFonts.inter(color: Colors.white),
                            ),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                    },
                    child: Container(
                      constraints: BoxConstraints(minHeight: 50),
                      height: 50.h,
                      width: 358.w,
                      decoration: BoxDecoration(
                        color: formColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Text(
                          "Logout",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
