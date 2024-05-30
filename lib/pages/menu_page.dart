import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:badges/badges.dart' as badges;

import 'fragment/home_fragment.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>
    with SingleTickerProviderStateMixin {
  int indexFragment = 0;
  bool showMenu = false;
  late final AnimationController animationController;
  late Animation slideAnimation;
  late Animation scaleAnimation;

  List menuFragment = [
    {
      'icon': 'assets/ic_home.png',
      'title': 'Home',
      'view': const HomeFragment(),
    },
    {
      'icon': 'assets/ic_profile.png',
      'title': 'Profile',
      'view': const Center(child: Text('Profile')),
    },
    {
      'icon': 'assets/ic_location.png',
      'title': 'Nearby',
      'view': const Center(child: Text('Nearby')),
    },
    {},
    {
      'icon': 'assets/ic_bookmark.png',
      'title': 'Bookmark',
      'view': const Center(child: Text('Bookmark')),
    },
    {
      'icon': 'assets/ic_notification.png',
      'title': 'Notification',
      'view': const Center(child: Text('Notification')),
    },
    {
      'icon': 'assets/ic_message.png',
      'title': 'Message',
      'view': const Center(child: Text('Message')),
    },
    {},
    {
      'icon': 'assets/ic_setting.png',
      'title': 'Setting',
      'view': const Center(child: Text('Setting')),
    },
    {
      'icon': 'assets/ic_help.png',
      'title': 'Help',
      'view': const Center(child: Text('Help')),
    },
    {
      'icon': 'assets/ic_logout.png',
      'title': 'Logout',
      'view': const Center(child: Text('Logout')),
    },
  ];

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..addListener(() {
        setState(() {});
      });

    slideAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        // showMenu = true;
        // setState(() {});
        animationController.forward();
      },
      child: Scaffold(
        backgroundColor: const Color(0xff0A8ED9),
        body: Stack(
          children: [
            buildLeftMenu(),
            buildContent(),
          ],
        ),
      ),
    );
  }

  Widget buildLeftMenu() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 2 / 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(menuFragment.length, (index) {
          Map item = menuFragment[index];
          if (item.isEmpty) {
            return Divider(
              color: Colors.white.withOpacity(0.5),
              height: 30,
              thickness: 1,
            );
          }
          bool isActive = indexFragment == index;
          bool showBadge = index == 5 || index == 6;
          return GestureDetector(
            onTap: () {
              indexFragment = index;
              // showMenu = false;
              animationController.reverse();
              setState(() {});
            },
            child: Container(
              height: 40,
              padding: const EdgeInsets.only(left: 24),
              margin: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: isActive ? const Color(0xffFFFFFF) : Colors.transparent,
              ),
              child: Row(
                children: [
                  badges.Badge(
                    showBadge: showBadge,
                    position: badges.BadgePosition.topEnd(
                      end: 3,
                      top: 3,
                    ),
                    badgeStyle: const badges.BadgeStyle(
                      badgeColor: Color(0xffFA0E0E),
                      padding: EdgeInsets.all(4),
                    ),
                    child: ImageIcon(
                      AssetImage(item['icon']),
                      size: 24,
                      color: isActive ? const Color(0xff0A8ED9) : Colors.white,
                    ),
                  ),
                  const Gap(16),
                  Text(
                    item['title'],
                    style: TextStyle(
                      fontWeight:
                          isActive ? FontWeight.w500 : FontWeight.normal,
                      fontSize: 16,
                      color: isActive ? const Color(0xff0A8ED9) : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget buildContent() {
    return Transform.translate(
      // offset: Offset(
      //   showMenu ? MediaQuery.of(context).size.width * 3 / 5 : 0,
      //   0,
      // ),
      offset: Offset(
        slideAnimation.value * MediaQuery.of(context).size.width * 3 / 5,
        0,
      ),
      child: Transform.scale(
        // scale: showMenu ? 0.8 : 1,
        scale: scaleAnimation.value,
        child: Container(
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(showMenu ? 20 : 0),
            borderRadius: BorderRadius.circular(slideAnimation.value * 20),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: menuFragment[indexFragment]['view'] as Widget,
        ),
      ),
    );
  }
}
