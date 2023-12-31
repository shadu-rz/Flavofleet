import 'package:flavofleet_main/Pages/order/orders_page.dart';
import 'package:flavofleet_main/Pages/Home/main_food_page.dart';
import 'package:flavofleet_main/Utils/colors.dart';
import 'package:flavofleet_main/firebase/firebase_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  final bool isGuest;
  const HomePage({super.key, required this.isGuest});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseMethods firebase = Get.put(FirebaseMethods());
  late PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
    if (!widget.isGuest) {
      firebase.getCartDetails();
    }
  }

  List<Widget> _buildScreens() {
    return [
      MainFoodPage(isGuest: widget.isGuest),
      // CartPage(isGuest: widget.isGuest),
      OrderPage(isGuest: widget.isGuest),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: AppColors.mainColor,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.archivebox),
        title: ("orders"),
        activeColorSecondary: Colors.white,
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style10,
    );
  }
}
