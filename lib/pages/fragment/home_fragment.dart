// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:badges/badges.dart' as badges;

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
        // buildNearFromYou(),
        // buildBestForYou(),
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
}
