import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth

const Color customColor = Color(0xFF763A12); // Hex value for #763a12

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              _buildProfileHeader(),
              const SizedBox(height: 30),
              _buildProfileOption(
                context,
                icon: Icons.person,
                title: 'Edit Profile',
                subtitle: 'Update your personal details',
                onTap: () {
                  // Handle Edit Profile tap
                },
              ),
              _buildProfileOption(
                context,
                icon: Icons.help,
                title: 'Help & Support',
                subtitle: 'Get assistance and FAQs',
                onTap: () {
                  // Handle Help & Support tap
                },
              ),
              _buildProfileOption(
                context,
                icon: Icons.logout,
                title: 'Logout',
                subtitle: 'Sign out of your account',
                onTap: () {
                  // Handle Logout tap
                  _showLogoutDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        const SizedBox(height: 16),
        const Text(
          'John Doe', // Replace with the user’s name
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'johndoe@example.com', // Replace with the user’s email
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileOption(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        required VoidCallback onTap,
      }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: customColor, size: 30), // Set icon color to customColor
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _logoutUser(context); // Call logout function
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _logoutUser(BuildContext context) async {
    try {
      // Sign out the user from Firebase
      await FirebaseAuth.instance.signOut();

      // Navigate to the login screen
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      // Handle logout error if any
      print("Logout error: $e");
    }
  }
}
