import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('My Account'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          const CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1568602471122-7832951cc4c5'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Jane Doe',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          buildProfileOption('Bookmarks', Icons.bookmark),
          buildProfileOption('My Comments', Icons.comment),
          buildProfileOption('Account Details', Icons.person),
          buildProfileOption('Change Password', Icons.lock),
          const Spacer(),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16), backgroundColor: Colors.green,
              ),
              onPressed: () {},
              child: const Text('Log Out'),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  ListTile buildProfileOption(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {},
    );
  }
}
