import 'package:blog_app/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const CustomButton({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 48),
      height: 48.h,
      width: 358.w,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Text(
          text,
          style:
              style ??
              GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
