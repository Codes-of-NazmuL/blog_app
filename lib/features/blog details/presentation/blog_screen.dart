import 'package:blog_app/features/home/data/api_data_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogScreen extends StatelessWidget {
  final int index;
  const BlogScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    ApiDataHome api = ApiDataHome();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          Icon(Icons.bookmark_border, color: Colors.white),
          SizedBox(width: 15),
        ],
      ),
      body: FutureBuilder(
        future: api.apidata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView(
              children: [
                SizedBox(
                  height: 320.h,
                  width: 390.w,
                  child: Image.network(
                    "https://picsum.photos/600/400?random=$index",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data![index].title,
                        maxLines: 1,
                        style: GoogleFonts.newsreader(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          SizedBox(width: 15.w),
                          CircleAvatar(
                            radius: 28.r,
                            child: Image.network(
                              "https://avatar.iran.liara.run/public/${index + 1}",
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Author",
                                    style: GoogleFonts.newsreader(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "Nazmul Islam",
                                    style: GoogleFonts.newsreader(
                                      color: Colors.white54,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        snapshot.data![index].body,
                        style: GoogleFonts.newsreader(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        children: [
                          Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white54,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "123",
                            style: GoogleFonts.newsreader(
                              color: Colors.white54,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Icon(
                            Icons.chat_bubble_outline_outlined,
                            color: Colors.white54,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "123",
                            style: GoogleFonts.newsreader(
                              color: Colors.white54,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Comments",
                        style: GoogleFonts.newsreader(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 137 * 10,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    child: Image.network(
                                      "https://avatar.iran.liara.run/public/${index + 1}",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nazmul Islam",
                                    style: GoogleFonts.newsreader(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Great article! I'm particularly interested in the section on renewable energy. Do you have any recommendations for further reading on the topic?",
                                    maxLines: 5,
                                    overflow: TextOverflow.clip,

                                    style: GoogleFonts.newsreader(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
