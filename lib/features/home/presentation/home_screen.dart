import 'package:blog_app/features/blog%20details/presentation/blog_screen.dart';
import 'package:blog_app/features/home/data/api_data_home.dart';
import 'package:blog_app/features/search/presentation/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiDataHome api = ApiDataHome();
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: Colors.black,
        title: Text("Blog"),
        titleTextStyle: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchScreen()),
            ),
            child: Icon(Icons.search, color: Colors.white),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: FutureBuilder(
        future: api.dataFetcher(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.data.posts.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlogScreen(index: index),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 164.h,
                    width: 390.w,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot
                                        .data!
                                        .data
                                        .posts[index]
                                        .categories[0],
                                    style: GoogleFonts.inter(
                                      color: Colors.white54,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.data.posts[index].title,
                                    maxLines: 2,
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.data.posts[index].excerpt,
                                    maxLines: 3,
                                    style: GoogleFonts.inter(
                                      color: Colors.white54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 132.h,
                                  width: 130.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      10,
                                    ),
                                    child: Image.network(
                                      // "https://picsum.photos/600/400?random=$index",
                                      snapshot
                                          .data!
                                          .data
                                          .posts[index]
                                          .featuredImage,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
