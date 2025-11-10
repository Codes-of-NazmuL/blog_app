import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
