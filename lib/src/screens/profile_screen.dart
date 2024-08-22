import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            _buildProfileHeader(),
            const Divider(),
            _buildInfoTile(Icons.edit, 'Edit Profile', 'Profile Name, ''Category, ''Address'),
            _buildInfoTile(Icons.business, 'Business tools', 'Cateloge'''),
            _buildInfoTile(Icons.business, 'Categories', 'Make Up, French Cut, Braiding'),
            _buildInfoTile(Icons.info_outline, 'About', 'This is your business description.'),
            _buildInfoTile(Icons.call, 'Phone', '+1 234 567 890'),
            _buildInfoTile(Icons.email, 'Email', 'business@example.com'),
            const Divider(),
            _buildSettingsTile(Icons.settings, 'Settings'),
            _buildSettingsTile(Icons.help_outline, 'Help'),
            _buildSettingsTile(Icons.privacy_tip, 'Privacy Policy'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return const Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey,
          backgroundImage: AssetImage('assets/profile.jpg'), // Placeholder for profile image
        ),
        SizedBox(height: 10),
        Text(
          'Molnah',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          'Business Owner',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: const Color.fromARGB(255, 0, 0, 0)),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  Widget _buildSettingsTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: const Color.fromARGB(255, 0, 0, 0)),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Implement navigation to settings page
      },
    );
  }
}