import 'package:flutter/material.dart';

import 'login.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('ABCD'),
            accountEmail: Text('abd@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Icon(Icons.icecream_rounded,
                    color: Color.fromARGB(255, 243, 255, 253), size: 40),
              ),
            ),
            decoration: BoxDecoration(
              //color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage('assets/images/nav_header_temp.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile Link'),
            onTap: () => print('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => print('settings'),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () => print('upload file'),
          ),
          ListTile(
            leading: Icon(Icons.recommend),
            title: Text('Recommendations'),
            onTap: () => print('Recommendations'),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('My Listing'),
            onTap: () => print('My Listing'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () => <Future>{
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => login()),
              ),
            },
          ),
        ],
      ),
    );
  }
}