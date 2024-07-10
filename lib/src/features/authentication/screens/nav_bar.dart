import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vhara_hobe_v1/src/features/authentication/screens/messenger.dart';

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
          const UserAccountsDrawerHeader(
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
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile Link'),
            onTap: () => print('Profile'),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () =>  print('settings'),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () => print('upload file'),
          ),
          ListTile(
            leading: const Icon(Icons.recommend),
            title: const Text('Recommendations'),
            onTap: () => print('Recommendations'),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('My Listing'),
            onTap: () => print('My Listing'),
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Messages'),
            onTap: ()  {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const messenger()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () => <Future>{
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const login()),
              ),
            },
          ),
        ],
      ),
    );
  }
}