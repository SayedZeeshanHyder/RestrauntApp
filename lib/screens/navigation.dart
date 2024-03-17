import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mprapp/controllerfiles/navigationcontroller.dart';
import 'package:mprapp/screens/home/home.dart';
import 'package:mprapp/screens/home/premiumscreen.dart';
import 'package:mprapp/screens/orders/myorders.dart';
import 'package:mprapp/screens/profile/me.dart';

import 'friends/friends.dart';

class Navigation extends StatefulWidget
{

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500),()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PremiumScreen())));
  }

  final navigationController = Get.put(NavigationController());

  final pages = [
    Home(),
    MyOrders(),
    Friends(),
    Me(),
  ];

  final bottomNavItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",backgroundColor: Colors.transparent),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: "Order",backgroundColor: Colors.transparent),
    BottomNavigationBarItem(icon: Icon(Icons.handshake),label: "Friends",backgroundColor: Colors.transparent),
    BottomNavigationBarItem(icon: Icon(Icons.person),label: "Me",backgroundColor: Colors.transparent),
  ];

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(()=> pages[navigationController.index.value]),
      bottomNavigationBar: Obx(
        ()=> BottomNavigationBar(
          onTap: (index){
            navigationController.changeIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          backgroundColor: Colors.brown,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(fontSize: size.width*0.04,fontWeight: FontWeight.bold),
          items: bottomNavItems,
          currentIndex: navigationController.index.value,
        ),
      ),
    );
  }
}