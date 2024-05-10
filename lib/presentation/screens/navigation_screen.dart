import 'package:expanse_app/presentation/screens/add_page.dart';
import 'package:expanse_app/presentation/screens/home_page.dart';
import 'package:expanse_app/presentation/screens/notification_page.dart';
import 'package:expanse_app/presentation/screens/profile_page.dart';
import 'package:expanse_app/presentation/screens/statics_page.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {


  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  var selectedItem=0;
  List<Widget> allPages=[
    MyHomePage(),
    StaticsPage(),
    AddPage(),
    NotificationPage(),
    ProfilePage(),
  ];
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(),
        title: Row(
          children: [
            Text("MK"),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.logout))
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body: allPages[selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.auto_graph),label: "Statics"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box),label: "Add"),

          BottomNavigationBarItem(icon: Icon(Icons.notifications),label: "Notification"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: "Profile")
        ],
        elevation: 22.0,
        currentIndex: selectedItem,
        unselectedItemColor: Colors.grey,
        selectedItemColor:Colors.purple,
        showUnselectedLabels: true,
        onTap: (value){
          setState(() {
            selectedItem=value;
          });
        },
      ),
    );
  }
}
