import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 500,
            decoration: BoxDecoration(color: Colors.pinkAccent.withOpacity(0.09),
                border: Border.all(color: Colors.pink)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile...png'),
                    radius: 70,
                    child: Padding(
                      padding: EdgeInsets.only(left: 125),
                      child: Icon(Icons.edit),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 75),
                  child: Column(
                    children: [
                      Text('Minha khan'),
                      Text('03100012345'),
                      Text('xyz102@g'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(onTap: () {
              print('profile tapped');
            },
              child:
              Row(
                children: [
                  Icon(Icons.person),

                  Text('Profile'),
                ],

            ),

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.favorite_border),
                Text('Favorite'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.lock),
                Text('Privacy Policy'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.settings),
                Text('Settings'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.help),
                Text('Help'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.logout),
                Text('Logout'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
