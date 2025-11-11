import 'package:blog_app/common_widgets/custom_button.dart';
import 'package:blog_app/common_widgets/custom_textform.dart';
import 'package:blog_app/constants/app_constants.dart';
import 'package:blog_app/features/search/data/search_api.dart';
import 'package:blog_app/helpers/provider/bookmark_provider.dart';
import 'package:blog_app/models/search_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchDataModel? data;
  SearchApi api = SearchApi();
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text("Search Blogs"),
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
              "Search",
              style: TextStyle(fontSize: 16.sp, color: Colors.white),
            ),

            SizedBox(height: 10.h),
            CustomTextform(
              validateText: "Enter what you want to search",
              controller: search,
              hintext: "search text requierd",
            ),
            SizedBox(height: 20.h),
            Consumer<BookmarkProvider>(
              builder: (context, value, child) => InkWell(
                onTap: () async {
                  if (search.text.isEmpty || search.text == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Write Something to search",
                          style: GoogleFonts.inter(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Searching data Please wait",
                          style: GoogleFonts.inter(color: Colors.white),
                        ),
                        backgroundColor: buttonColor,
                      ),
                    );
                    data = await api.searchData(searchtext: search.text);
                    if (data != null) {
                      setState(() {
                        value.state = false;
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Data Not Found",
                            style: GoogleFonts.inter(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                child: CustomButton(text: "Search"),
              ),
            ),
            SizedBox(height: 20),
            Consumer<BookmarkProvider>(
              builder: (context, value, child) => value.state
                  ? Center()
                  : data!.data.posts.isEmpty
                  ? Center(
                      child: Text(
                        "No Data Found!",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: data!.data.posts.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 90.h,
                          width: 390.w,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 80.h,
                                width: 100.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    10,
                                  ),
                                  child: Image.network(
                                    "https://picsum.photos/600/400?random=${data!.data.posts[index].id}",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data!.data.posts[index].title,
                                      maxLines: 1,
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      data!.data.posts[index].excerpt,
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
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
