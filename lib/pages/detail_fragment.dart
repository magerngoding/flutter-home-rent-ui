// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:home_rent_ui/models/home.dart';
import 'package:readmore/readmore.dart';

class DetailFragment extends StatelessWidget {
  const DetailFragment({
    Key? key,
    required this.home,
  }) : super(key: key);
  final Home home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          Gap(20 + MediaQuery.of(context).padding.top),
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            child: Stack(
              children: [
                buildImage(),
                Positioned.fill(
                  child: buildGradient(),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 20,
                  child: buildMainInfo(),
                ),
                Positioned(
                  left: 18,
                  right: 18,
                  top: 18,
                  child: buildHeader(context),
                ),
              ],
            ),
          ),
          Gap(24),
          buildDescription(),
          // buildOwner(),
          // buildGallery(),
          // buildMap(),
        ],
      ),
    );
  }

  Widget buildImage() {
    return Image.asset(
      home.imageRaw,
      width: double.infinity,
      height: 304.0,
      fit: BoxFit.cover,
    );
  }

  Widget buildGradient() {
    return DecoratedBox(
        decoration: BoxDecoration(
      gradient: LinearGradient(
        stops: [0.32, 0.76],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.black.withOpacity(0),
          Colors.black.withOpacity(0.6),
        ],
      ),
    ));
  }

  Widget buildMainInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          home.name,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        Gap(20),
        Text(
          '${home.address}, ${home.city}',
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            color: Color(0XFFD4D4D4),
          ),
        ),
        Gap(16),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    child: ImageIcon(
                      AssetImage('assets/ic_bed.png'),
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                  Gap(8),
                  Text(
                    "${home.bedroom} Bedroom",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0XFFD4D4D4),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    child: ImageIcon(
                      AssetImage('assets/ic_bath.png'),
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                  Gap(8),
                  Text(
                    "${home.bathroom} bathroom",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0XFFD4D4D4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton.filled(
          // pakai .filled gausah diwarp container lagi
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.black.withOpacity(0.24),
            ),
          ),
          onPressed: () => Navigator.pop(context),
          icon: ImageIcon(
            AssetImage('assets/ic_nav_back.png'),
            size: 24,
            color: Colors.white,
          ),
        ),
        IconButton.filled(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.black.withOpacity(0.24),
            ),
          ),
          onPressed: () => Navigator.pop(context),
          icon: ImageIcon(
            AssetImage('assets/ic_bookmark.png'),
            size: 24,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Gap(20),
        ReadMoreText(
          // buat buka tutup text panjang
          home.description,
          trimLength: 100,
          trimCollapsedText: ' Show More',
          trimExpandedText: ' Show Less',
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            color: Color(0XFF858585),
          ),
          lessStyle: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            color: Color(0XFF0A8ED9),
          ),
          moreStyle: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            color: Color(0XFF858585),
          ),
        ),
      ],
    );
  }
}
