import 'package:flavour_fleet_main/Pages/Cart/orders.dart';
import 'package:flavour_fleet_main/Pages/Cart/cart_page.dart';
import 'package:flavour_fleet_main/Pages/Home/main_food_page.dart';
import 'package:flavour_fleet_main/Pages/accounts/account_page.dart';
import 'package:flavour_fleet_main/Widgets/Utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

  class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage> {


    late PersistentTabController _controller;

    @override
    void initState() {
      _controller = PersistentTabController(initialIndex: 0);
      super.initState();
    }

    List<Widget> _buildScreens() {
      return [
        const MainFoodPage(),
        const CartPage(),
        const CartHistory(),
        const AccountPage()
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.home),
          title: ("Home"),
          activeColorPrimary: AppColors.mainColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.shopping_cart),
          title: ("cart"),
          activeColorPrimary: AppColors.mainColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.archivebox),
          title: ("orders"),
          activeColorPrimary: AppColors.mainColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.person),
          title: ("me"),
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
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
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
        navBarStyle:
            NavBarStyle.style6, 
            
      );
    }
  }
