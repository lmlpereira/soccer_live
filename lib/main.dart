import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:soccer_live/app_home_screen.dart';
import 'package:soccer_live/patterns.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoccerLive',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   int currentTab = 0;
    final List<Widget> screens = [
      const AppHomeScreen(),
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
    ];
    final icons = [
      Iconsax.home,
      Iconsax.calendar_1,
      Iconsax.chart,
      Icons.person_outline
    ];
    final titles = [
      "Home",
      "Calendar",
      "Standing",
      "Account",
    ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration( color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.012),
            blurRadius: 8,
            spreadRadius: 5,
            ),
          ],
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30)
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) => MyBottomNavBarItems(
            title: titles[index], 
            isActive: currentTab == index, 
            onTab: () => setState(() => currentTab = index),
            icon: icons[index]
          )),
        ),
        ),
        body: screens[currentTab],
    );
  }
}

class MyBottomNavBarItems extends StatelessWidget{
  final String title;
  final bool isActive;
  final Function() onTab;
  final IconData icon;


  const MyBottomNavBarItems({super.key, required this.title, required this.isActive, required this.onTab, required this.icon});

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isActive ? kprimaryColor:Colors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20)
          )
        ),
        child: Column(
          children: [
            Icon(icon, color: isActive? Colors.white: Colors.grey.shade400,),
            if(isActive) 
              Text(title, style: const TextStyle(
                color: Colors.white, 
                fontSize: 14,
                ),
              )
          ],
        ),
      ),
    );
  }
}


