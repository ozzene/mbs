import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildProfileHeader(),
            const Divider(),
            _buildEditableInfoTile(Icons.person, 'Name', 'Molnah'),
            _buildEditableInfoTile(Icons.business, 'Catelog', 'Haircuts, ''Everyday Makeup'),
            _buildEditableInfoTile(Icons.location_on, 'Business address', ''),
            _buildEditableInfoTile(Icons.language, 'Website', ''),
            _buildAddAnotherWebsite(),
            _buildEditableInfoTile(Icons.email, 'Email', ''),
            _buildEditableInfoTile(Icons.info, 'About', ''),
            _buildEditableInfoTile(Icons.access_time, 'Business hours', 'Open 24 hours'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey,
          backgroundImage: AssetImage('assets/profile.jpg'), // Placeholder for profile image
        ),
        const SizedBox(height: 10),
        IconButton(
          icon: const Icon(Icons.edit, color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: () {
            // Add edit functionality
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildEditableInfoTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: const Color.fromARGB(255, 0, 0, 0)),
      title: Text(title, style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      subtitle: Text(subtitle, style: const TextStyle(color: Color.fromARGB(179, 56, 56, 56))),
      trailing: const Icon(Icons.edit, color: Color.fromARGB(255, 0, 0, 0)),
      onTap: () {
        // Add edit functionality
      },
    );
  }

  Widget _buildAddAnotherWebsite() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              // Add functionality to add another website
            },
            child: const Text(
              'Add another website',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ],
      ),
    );
  }
}

