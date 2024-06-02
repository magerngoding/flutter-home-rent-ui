// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:home_rent_ui/models/home.dart';
import 'package:intl/intl.dart';
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
          Gap(24),
          buildOwner(),
          Gap(30),
          buildGallery(),
          Gap(30),
          buildMap(),
          Gap(150), // samakan tinggi dengan ukuran map di bawah
        ],
      ),
      extendBody: true, // wilayah belakang botnavbar jadi keliatan
      bottomNavigationBar: buildPrice(),
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

  Widget buildOwner() {
    return Row(
      children: [
        ClipOval(
          child: Image.asset(
            home.profile,
            width: 40.0,
            height: 40.0,
            fit: BoxFit.cover,
          ),
        ),
        Gap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                home.owner,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Text(
                'Siraj Hafizh',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFF858585),
                ),
              ),
            ],
          ),
        ),
        Row(
          children:
              ['assets/ic_phone.png', 'assets/ic_message_filled.png'].map((e) {
            return Container(
              height: 28.0,
              width: 28,
              margin: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                color: Color(0XFF0A8ED9).withOpacity(0.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    5.0,
                  ),
                ),
              ),
              child: Image.asset(
                e,
                width: 24.0,
                height: 24.0,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget buildGallery() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gallery",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            home.gallery.length,
            (index) {
              return ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      home.gallery[index],
                      width: 72.0,
                      height: 72.0,
                      fit: BoxFit.cover,
                    ),
                    if (index == 3)
                      Container(
                        height: 72.0,
                        width: 72,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "+5",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
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

  Widget buildMap() {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
      child: Image.asset(
        "assets/map.png",
        width: double.infinity,
        height: 150.0,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildPrice() {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 150.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [0.28, 0.62],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.white.withOpacity(0),
            Colors.white,
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF858585),
                  ),
                ),
                Gap(8),
                Text(
                  '${NumberFormat.currency(decimalDigits: 0, locale: 'id_ID', symbol: 'Rp. ').format(home.price)}/Year',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                stops: [0.14, 1],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xffa0dafb),
                  Color(0xff0A8ED9),
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10.0,
                ),
              ),
            ),
            child: Text(
              "Rent Now",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
