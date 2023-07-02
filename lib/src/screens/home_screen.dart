import 'package:bilkent_tinder/controllers/auth_controller.dart';
import 'package:bilkent_tinder/src/screens/app/profile/profile_screen.dart';
import 'package:bilkent_tinder/src/utils/app_constants.dart';
import 'package:bilkent_tinder/src/utils/colors.dart';
import 'package:bilkent_tinder/src/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          AppConstants.APP_NAME,
          style: TextStyle(
              color: AppColors.pink2,
              fontFamily: "Tinder",
              fontSize: Dimensions.font26),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "lib/assets/icons/tinder_icon.svg",
            semanticsLabel: 'Acme Logo',
            width: Dimensions.font20 * 1.5,
            height: Dimensions.font20 * 1.5,
            color: AppColors.pink2,
          ),
        ),
      ),
      body: GetBuilder<AuthController>(builder: (authController) {
        final List<Widget> _widgetOptions = <Widget>[
          Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  print(authController.getUserInfo());
                  print(await authController.getToken());
                  },
                child: const Text("Show User"),
              ),
              ElevatedButton(
                  onPressed: () => {
                        authController.clearSharedData(),
                        Get.toNamed("/welcome")
                      },
                  child: const Text("Logout")),
            ],
          ),
          const Text(
            'Index 1: Business',
            style: optionStyle,
          ),
          const ProfileScreen(),
        ];

        return Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 131, 131, 131),
        selectedIconTheme: const IconThemeData(color: AppColors.pink2),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset("lib/assets/icons/tinder_icon.svg",
                  semanticsLabel: 'Acme Logo',
                  width: Dimensions.font20 * 1.5,
                  height: Dimensions.font20 * 1.5,
                  color: _selectedIndex == 0
                      ? AppColors.pink2
                      : Color.fromARGB(255, 131, 131, 131)),
              label: "home"),
          const BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: "messages",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "profile",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
