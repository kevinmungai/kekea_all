import 'package:flutter/material.dart';
import 'package:kekea_merchant/ui/business/business_page.dart';
import 'package:kekea_merchant/ui/personal/personal_page.dart';
import 'package:kekea_merchant/ui/sale/sale_page.dart';
import 'package:kekea_merchant/ui/store/store_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePage extends StatelessWidget {
  final List<Widget> screens = [
    SalePage(),
    StorePage(),
    BusinessPage(),
    PersonalPage(),
  ];

  final List<PersistentBottomNavBarItem> persistentBottomNavBarItems = [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home),
      title: "Home",
      activeColor: Colors.amber,
      inactiveColor: Colors.blueGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.location_on),
      title: "Store",
      activeColor: Colors.amber,
      inactiveColor: Colors.blueGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.business),
      title: "Business",
      activeColor: Colors.amber,
      inactiveColor: Colors.blueGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.person),
      title: "Personal",
      activeColor: Colors.amber,
      inactiveColor: Colors.blueGrey,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: screens,
      items: persistentBottomNavBarItems,
      handleAndroidBackButtonPress: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      navBarStyle: NavBarStyle.style8,
      popActionScreens: PopActionScreensType.once,
    );
  }
}
