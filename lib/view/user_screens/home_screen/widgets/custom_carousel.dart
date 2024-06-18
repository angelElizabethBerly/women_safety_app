// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:women_safety_app/utils/color_constants.dart';
import 'package:women_safety_app/utils/women_database.dart';

class CustomCarousalWidget extends StatelessWidget {
  const CustomCarousalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: List.generate(
            WomenDatabase.article.length,
            (index) => InkWell(
                  onTap: () async {
                    Uri uri =
                        Uri.parse(WomenDatabase.article[index]["url"] ?? "");
                    await launchUrl(uri);
                  },
                  child: Card(
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  ColorConstants.primaryBlack,
                                  BlendMode.softLight),
                              fit: BoxFit.cover,
                              image: NetworkImage(WomenDatabase.article[index]
                                      ["image"] ??
                                  ""))),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          WomenDatabase.article[index]["title"] ?? "",
                          style: TextStyle(
                              color: ColorConstants.primaryWhite,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05),
                        ),
                      ),
                    ),
                  ),
                )),
        options: CarouselOptions(
            aspectRatio: 3, autoPlay: true, enlargeCenterPage: true));
  }
}
