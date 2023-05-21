import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    var token = box.read('userToken');
    return Scaffold(
      backgroundColor: HexColor('#4A5568'),
      //Appbar
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        // title: Text(widget.title),
        backgroundColor: HexColor('#4A5568'),
        title: Center(
          child: Image.asset(
            'asset/image/logo.png', // Replace with your logo asset path
            width: 60,
            height: 60,
          ),
        ),
      ),

      //Body
      body: Container(
        padding: const EdgeInsets.all(16.0), // Add padding to the container
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align items at the top
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'asset/image/usman.jpg', // Replace with your image asset path
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  child: Text("What's on your mind?"),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),

      //Bottom Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          backgroundColor: HexColor('#4A5568'),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 30),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add, size: 30),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications, size: 30),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
