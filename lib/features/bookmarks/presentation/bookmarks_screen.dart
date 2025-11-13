import 'package:blog_app/features/home/data/api_data_home.dart';
import 'package:blog_app/helpers/provider/bookmark_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiDataHome api = ApiDataHome();
    return Consumer<BookmarkProvider>(
      builder: (context, bookmark, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: InkWell(),
          title: Text("Bookmarks"),
          centerTitle: true,
          titleTextStyle: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        body: bookmark.bookmarkse.isEmpty
            ? Center(
                child: Text(
                  "No Bookmarks!",
                  style: GoogleFonts.inter(color: Colors.white),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FutureBuilder(
                  future: api.dataFetcher(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        itemCount: bookmark.bookmarkse.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 90.h,
                            width: 390.w,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 56.h,
                                  width: 100.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      10,
                                    ),
                                    child: Image.network(
                                      snapshot
                                          .data!
                                          .data
                                          .posts[bookmark.bookmarkse[index]]
                                          .featuredImage,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot
                                            .data!
                                            .data
                                            .posts[bookmark.bookmarkse[index]]
                                            .title,
                                        maxLines: 1,
                                        style: GoogleFonts.inter(
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        snapshot
                                            .data!
                                            .data
                                            .posts[bookmark.bookmarkse[index]]
                                            .excerpt,
                                        maxLines: 2,
                                        style: GoogleFonts.inter(
                                          color: Colors.white54,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
      ),
    );
  }
}
