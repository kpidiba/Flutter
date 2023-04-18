import 'package:flutter/material.dart';

class NavigationDrawerTest extends StatelessWidget {
  const NavigationDrawerTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Navigation Drawer")),
      drawer: Drawer(
        elevation: 0,
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("KPIDIBA"),
              accountEmail: Text("kpidibadavid1@gmail.com"),
              currentAccountPicture: CircleAvatar(
                foregroundImage: AssetImage("images/image.png"),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  foregroundImage: AssetImage("images/image.png"),
                ),
                CircleAvatar(
                  foregroundImage: AssetImage("images/image.png"),
                ),
                CircleAvatar(
                  foregroundImage: AssetImage("images/image.png"),
                )
              ],
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text("Home"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text("Home"),
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text("LABELS"),
            ),
            ListTile(
              leading: const Icon(Icons.label),
              title: const Text("Red"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.label),
              title: const Text("Blue"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.label),
              title: const Text("Green"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
