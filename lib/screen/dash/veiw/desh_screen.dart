import 'package:flutter/material.dart';
import 'package:news_app/screen/apple/view/apple_screen.dart';
import 'package:news_app/screen/dash/provider/dash_provider.dart';
import 'package:news_app/screen/news/veiw/news_screen.dart';
import 'package:news_app/screen/tesla/veiw/tesla_screen.dart';
import 'package:provider/provider.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  DashProvider? providerr;
  DashProvider? providerw;
  List<Widget> dashList=[
    const NewsScreen(),
    const AppleScreen(),
    const TeslaScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    providerr = context.read<DashProvider>();
    providerw = context.watch<DashProvider>();
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: providerw!.dashIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "News"),
              BottomNavigationBarItem(icon: Icon(Icons.apple), label: "apple"),
              BottomNavigationBarItem(icon: Icon(Icons.local_car_wash_rounded), label: "Tesla"),
            ],
            onTap: (value) {
              int i=value;
              providerr!.changeIndex(i);
            },
          ),
          body: dashList[providerw!.dashIndex],
        ),
      ),
    );
  }
}
