// import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/module/Activity%20-%20Reports/view/activity_screen.dart';
import 'package:airpay/module/bottombar/custom_line_indicator_bottom_navbar.dart';
import 'package:airpay/module/home_module/view/home_screen.dart';
import 'package:airpay/module/my_bank_module/my_bank_screen.dart';
import 'package:airpay/module/my_bank_module/my_card_screen.dart';
import 'package:airpay/module/profile_module/view/profile_screen.dart';
import 'package:airpay/uitily/color_uitily.dart';

RxInt selectedIndex = 0.obs;
List<Widget> screens = [
  const HomeScreen(),
  const MyCardScreen(),
  const ActivityScreen(),
  const ProfileScreen(),
];

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
          stream: selectedIndex.stream,
          builder: (context, snapshot) {
            return Scaffold(
              body: screens[selectedIndex.value],
              bottomNavigationBar: CustomLineIndicatorBottomNavbar(
                currentIndex: selectedIndex.value,
                onTap: onItemTapped,
                selectedColor: colorPrimary,
                unSelectedColor: Colors.black54,
                customBottomBarItems: [
                  CustomBottomBarItems(
                    icon: Image.asset("assets/images/bottom_bar_icon/home.png", height: 27, color: selectedIndex.value == 0 ? colorPrimary : null),
                    label: '',
                  ),
                  CustomBottomBarItems(
                    icon: Image.asset("assets/images/bottom_bar_icon/wallet.png", height: 27, color: selectedIndex.value == 1 ? colorPrimary : null),
                    label: '',
                  ),
                  CustomBottomBarItems(
                    icon:
                        Image.asset("assets/images/bottom_bar_icon/activity.png", height: 27, color: selectedIndex.value == 2 ? colorPrimary : null),
                    label: '',
                  ),
                  CustomBottomBarItems(
                    icon: Image.asset("assets/images/bottom_bar_icon/profile.png", height: 27, color: selectedIndex.value == 3 ? colorPrimary : null),
                    label: '',
                  ),
                ],
              ),
            );
          }),
    );
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
