import 'package:flutter/material.dart';
import 'package:news_flutter/api/api_manager.dart';
import 'package:news_flutter/models/user_model.dart';
import 'package:news_flutter/screens/contact_page.dart';
import 'package:news_flutter/screens/detail_post_page.dart';
import 'package:news_flutter/screens/settings_page.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  late Future<UserModel> _user;

  @override
  void initState() {
    super.initState();
    _user = _fetchUser(); // Memanggil metode untuk mendapatkan detail pengguna
  }

  Future<UserModel> _fetchUser() async {
    // Gantilah ini dengan metode yang sesuai untuk mendapatkan informasi pengguna
    return await ApiManager.getUserDetails(); // Pastikan metode ini ada di ApiManager
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          FutureBuilder<UserModel>(
            future: _user,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const UserAccountsDrawerHeader(
                  accountName: Text('Loading...'),
                  accountEmail: Text('Loading...'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Text(
                      'UP',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return const UserAccountsDrawerHeader(
                  accountName: Text('Error'),
                  accountEmail: Text('Error'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Text(
                      'UP',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                );
              } else if (snapshot.hasData) {
                UserModel user = snapshot.data!;
                return UserAccountsDrawerHeader(
                  accountName: Text(user.name),
                  accountEmail: Text(user.email),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Text(
                      user.name[0], // Inisial dari nama pengguna
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                );
              } else {
                return const UserAccountsDrawerHeader(
                  accountName: Text('No data'),
                  accountEmail: Text('No data'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Text(
                      'UP',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                );
              }
            },
          ),
          const ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
          ListTile(
            leading: const Icon(Icons.contact_page),
            title: const Text('Contact Person'),
            onTap: () {
              try {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactPage()),
                );
              } catch (error) {
                // Handle navigation errors here
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_sharp),
            title: const Text('Post Detail'),
            onTap: () {
              try {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailPostPage()),
                );
              } catch (error) {
                // Handle navigation errors here
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              try {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              } catch (error) {
                // Handle navigation errors here
              }
            },
          ),
        ],
      ),
    );
  }
}
