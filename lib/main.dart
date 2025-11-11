import 'package:blog_app/features/Onboarding/presentation/onboarding_screen.dart';
import 'package:blog_app/features/home/presentation/navigation_home.dart';
import 'package:blog_app/helpers/provider/bookmark_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookmarkProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetStorage();
    String? token = store.read('token');
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
        home: token == null ? OnboardingScreen() : NavigationHome(),
      ),
    );
  }
}
