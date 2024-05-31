// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:badges/badges.dart' as badges;
import 'package:home_rent_ui/models/home.dart';
import 'package:intl/intl.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  String selectedCategory = 'House';

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Gap(24 + MediaQuery.of(context).padding.top),
        buildHeader(),
        Gap(20),
        buildSearch(),
        Gap(20),
        buildCategories(),
        Gap(20),
        buildNearFromYou(),
        Gap(20),
        buildBestForYou(),
      ],
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff838383)),
                ),
                Gap(8),
                Row(
                  children: [
                    Text(
                      "Jakarta",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Gap(4),
                    Image.asset(
                      "assets/ic_nav_down.png",
                      width: 24.0,
                      height: 24.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
          badges.Badge(
            position: badges.BadgePosition.topEnd(
              end: 3,
              top: 3,
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Color(0xffFA0E0E),
              padding: EdgeInsets.all(4),
            ),
            child: ImageIcon(
              AssetImage('assets/ic_notification.png'),
              size: 24,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 48.0,
              decoration: const BoxDecoration(
                color: Color(0xfff7f7f7),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10.0,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/ic_search.png",
                    width: 24.0,
                    height: 24.0,
                    fit: BoxFit.cover,
                  ),
                  Gap(16),
                  // joss search
                  Expanded(
                    child: TextField(
                      // style: , untuk styling bagian input
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                        hintText: 'Search address, or near you',
                        hintStyle: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF858585),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gap(16),
          Container(
            width: 48,
            height: 48.0,
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
            alignment: Alignment.center, // pake ini agar gambar mengecil
            child: Image.asset(
              "assets/ic_filter.png",
              width: 24.0,
              height: 24.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategories() {
    final list = [
      'House',
      'Apartement',
      'Hotel',
      'Villa',
      'Cotage',
    ];
    return SizedBox(
      height: 34,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(), // efek mantul saat di scroll
        itemCount: list.length,
        itemBuilder: (context, index) {
          String category = list[index];
          bool isActive = selectedCategory == category;

          return GestureDetector(
            onTap: () {
              selectedCategory = category;
              setState(() {});
            },
            child: Container(
              margin: EdgeInsets.only(
                left: index == 0 ? 20 : 10,
                right: index == list.length - 1 ? 20 : 10,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: isActive ? null : Color(0XFFF7F7F7),
                gradient: isActive
                    ? LinearGradient(
                        stops: [0.14, 1],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xffa0dafb),
                          Color(0xff0A8ED9),
                        ],
                      )
                    : null,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                category,
                style: TextStyle(
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 12.0,
                  color: isActive ? Color(0XFFF7F7F7) : Color(0XFF858585),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildNearFromYou() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Near from your",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                "See more",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFF858585),
                ),
              ),
            ],
          ),
        ),
        Gap(24),
        SizedBox(
          height: 272,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: listNearHome.length,
            itemBuilder: (context, index) {
              Home home = listNearHome[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 20 : 10,
                  right: index == listNearHome.length - 1 ? 20 : 10,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/detail', arguments: home);
                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          width: 222,
                          height: 272,
                          home.imageRaw,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: 222,
                        height: 272,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              20,
                            ),
                          ),
                          gradient: LinearGradient(
                            stops: [0.38, 1],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0XFF0D0D0D).withOpacity(0),
                              Color(0XFF000000).withOpacity(0.8),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              home.name,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Gap(7),
                            Text(
                              home.address,
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0XFFD7D7D7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(8, 4, 10, 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            children: [
                              ImageIcon(
                                AssetImage(
                                  'assets/ic_location.png',
                                ),
                                size: 16,
                                color: Colors.white,
                              ),
                              Text(
                                "1.8 km",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget buildBestForYou() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Best for your",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                "See more",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFF858585),
                ),
              ),
            ],
          ),
        ),
        Gap(24),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          itemCount: listNearHome.length,
          itemBuilder: (context, index) {
            Home home = listBestHome[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/detail', arguments: home);
              },
              child: Container(
                // padding tidak bisa diwrap gestur detector jadi ganti pakai container dan di tambah margin didalamnya agar kebaca serta kasih warna transpent
                color: Colors.transparent,
                margin: const EdgeInsets.only(bottom: 14),
                padding: EdgeInsets.only(bottom: 24),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      child: Image.asset(
                        home.imageCover,
                        width: 74.0,
                        height: 74.0,
                      ),
                    ),
                    Gap(24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            home.name,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Gap(4),
                          Text(
                            '${NumberFormat.currency(decimalDigits: 0, locale: 'id_ID', symbol: 'Rp. ').format(home.price)}/Year',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff0A8ED9),
                            ),
                          ),
                          Gap(4),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    ImageIcon(
                                      AssetImage('assets/ic_bed.png'),
                                      size: 24,
                                      color: Color(0xff858585),
                                    ),
                                    Gap(8),
                                    Text(
                                      "${home.bedroom} Bedroom",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff858585),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    ImageIcon(
                                      AssetImage('assets/ic_bath.png'),
                                      size: 24,
                                      color: Color(0xff858585),
                                    ),
                                    Gap(8),
                                    Text(
                                      "${home.bathroom} Bathroom",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff858585),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
