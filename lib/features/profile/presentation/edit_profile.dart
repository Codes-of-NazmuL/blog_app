import 'package:blog_app/common_widgets/custom_button.dart';
import 'package:blog_app/common_widgets/custom_textform.dart';
import 'package:blog_app/constants/app_constants.dart';
import 'package:blog_app/features/home/presentation/navigation_home.dart';
import 'package:blog_app/features/profile/data/edit_profile_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatelessWidget {
  final String name;
  final int Id;
  final String phone;

  const EditProfile({
    super.key,
    required this.name,
    required this.phone,
    required this.Id,

  });

  @override
  Widget build(BuildContext context) {
    EditProfileApi api = EditProfileApi();
    TextEditingController namecontroller = TextEditingController(text: "$name");

    TextEditingController phonecontroller = TextEditingController(
      text: "$phone",
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text("Edit Profile"),
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
            SizedBox(height: 30.h),
            Center(
              child: CircleAvatar(
                radius: 64,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(100),
                  child: Image.network(
                    "https://avatar.iran.liara.run/public/${Id % 5 + 1}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.h),
            Text(
              "Name",
              style: TextStyle(fontSize: 16.sp, color: Colors.white),
            ),
            SizedBox(height: 5.h),
            CustomTextform(
              validateText: "Enter your userName",
              controller: namecontroller,
              hintext: "Enter your username",
            ),

            SizedBox(height: 20.h),
            Text(
              "Phone",
              style: TextStyle(fontSize: 16.sp, color: Colors.white),
            ),
            SizedBox(height: 5.h),
            CustomTextform(
              validateText: "Enter your email",
              controller: phonecontroller,
              hintext: "Enter your email",
            ),
            Spacer(),
            InkWell(
              onTap: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Updating Profile....',
                      style: GoogleFonts.inter(color: Colors.white),
                    ),
                    backgroundColor: buttonColor,
                    duration: Duration(seconds: 2),
                  ),
                );
                var data = await api.putProfile(
                  name: namecontroller.text,
                  phone: phonecontroller.text,
                );
                if (data == String) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Update profile Faild.\n Try Again.",
                        style: GoogleFonts.inter(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Update profile Successfully!",
                        style: GoogleFonts.inter(color: Colors.white),
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NavigationHome()),
                  );
                }
              },
              child: CustomButton(text: "Save Changes"),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
