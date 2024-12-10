import 'package:flutter/material.dart';
import 'package:islami_app/Hadeth/hadeth_tab.dart';
import 'package:islami_app/Quran/quran_tab.dart';
import 'package:islami_app/Radio/radio_tab.dart';
import 'package:islami_app/Sebha/sebha_tab.dart';
import 'package:islami_app/Time/time_tab.dart';
import 'package:islami_app/color_data.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab =0;
  Widget BottomNavTabBuilder({required int index,required String imagePath }){
      return selectedTab == index
          ?Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorData.lightBlack),
        child: ImageIcon(
          AssetImage(imagePath),
        ),
      )
          : ImageIcon(
        AssetImage(imagePath),
      );
  }
  List<Widget> tabs=[
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedTab],

      bottomNavigationBar: BottomNavigationBar(

          onTap: (index) {
            selectedTab = index;
            setState(() {});
          },
          currentIndex: selectedTab,
          showUnselectedLabels: false,
          unselectedItemColor: ColorData.black,
          selectedItemColor: ColorData.white,
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorData.gold,
          items: [
            BottomNavigationBarItem(
                label: "Quran",
                icon: BottomNavTabBuilder(index: 0, imagePath: 'assets/images/quran_icon.png')
            ),
            BottomNavigationBarItem(
                label: "Hadeth",
                icon: BottomNavTabBuilder(index: 1, imagePath: 'assets/images/hadeth_icon.png')
            ),
            BottomNavigationBarItem(
                label: "Sebha",
                icon: BottomNavTabBuilder(index: 2, imagePath: 'assets/images/sebha_icon.png')
            ),
            BottomNavigationBarItem(
                label: "Radio",
                icon: BottomNavTabBuilder(index: 3, imagePath: 'assets/images/radio_icon.png')
            ),
            BottomNavigationBarItem(
                label: "Time",
                icon: BottomNavTabBuilder(index: 4, imagePath: 'assets/images/time_icon.png')),
          ]),
    );
  }
}
