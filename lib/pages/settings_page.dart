import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFD8D8D8),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFFF1D1D1D),
          elevation: 0.0,
          toolbarHeight: 100.0,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

                Expanded(
                  child: Center(
                    child: Text(
                      'Account Settings',
                      style: const TextStyle(
                        fontFamily: 'Sen',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 28.0,
                      ),
                    ),
                  ),
                ),

                // Empty space to balance the IconButton on the left
                const SizedBox(width: 40.0),
              ],
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 20.0),
        child: ListView(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Name Surname',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              'sampleuser@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: Colors.grey[700],
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 18),
            const Divider(),
            _buildSettingsOption(Icons.history, 'Previous Orders'),
            const Divider(),
            _buildSettingsOption(Icons.shopping_cart_outlined, 'Update Inventory'),
            const Divider(),
            _buildSettingsOption(Icons.location_pin, 'Saved Addresses'),
            const Divider(),
            _buildSettingsOption(Icons.settings, 'App Settings'),
            const Divider(),
            _buildSettingsOption(Icons.help_outline_rounded, 'Customer Support'),
            const Divider(),
            _buildSettingsOption(Icons.logout_rounded, 'Logout'),
          ],
        ),
      ),
    );
  }

  // Different actions buttons
  Widget _buildSettingsOption(IconData icon, String title) {
    return ListTile(

      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Roboto',
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: () {
        // Add the respective navigation logic for each option
      },
    );
  }
}