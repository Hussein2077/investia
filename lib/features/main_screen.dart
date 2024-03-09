import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/resource_manager/routes.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/coming_soon.dart';
import 'package:investa/features/cart%20and%20orders/presentation/cart_screen.dart';
import 'package:investa/features/cart%20and%20orders/presentation/orders.dart';
import 'package:investa/features/home/presentation/home_screen.dart';


import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static int mainIndex = 0;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller;

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      CartScreen(),
      OrdersScreen(),
      SizedBox(),

    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: Icon(
            Icons.home_outlined,
            size: AppSize.defaultSize!*3,
          ),
        ),

        title: StringManager.home.tr(),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon:   Padding(
          padding: const EdgeInsets.only(bottom: 3),

          child: Icon(
            Icons.shopping_cart,
            size: AppSize.defaultSize!*3,
          ),
        ),
        title: StringManager.cart.tr(),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon:   Icon(
          Icons.add_card_outlined,
          size: AppSize.defaultSize!*3,
        ),
        title: StringManager.orders.tr(),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon:   Icon(
          Icons.sticky_note_2_outlined,
          size: AppSize.defaultSize!*3,
        ),
        // title: StringManager.blog.tr(),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),

    ];
  }

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: MainScreen.mainIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return Scaffold(

      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,

        backgroundColor: Colors.white,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true,
        // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(AppSize.defaultSize!),
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
            NavBarStyle.style6, // Choose the nav bar style with this property.
      ),
    );
  }
}
