import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      height: 130.0,
      child: BottomNavigationBar(
        backgroundColor: const Color(0xFFF1D1D1D),

        selectedItemColor: const Color(0xFFFFFEC48),
        unselectedItemColor: Colors.white,

        currentIndex: selectedIndex,
        onTap: onTap,

        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w400),

        items: [
          _buildNavBarItem(Icons.home_outlined, 'Home', 0),
          _buildNavBarItem(Icons.receipt_long_rounded, 'Orders', 1),
          _buildNavBarItem(Icons.add_chart_rounded, 'Stats', 2),
          _buildNavBarItem(Icons.inventory_rounded, 'Inventory', 3),
        ],
        elevation: 0.0,
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem(IconData icon, String label, int index) {
    bool isActive = selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 50.0, // Circle size
                height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? const Color(0xFFFFFEC48) : Colors.white,
                ),
              ),
              Icon(icon, color: Colors.black, size: 25),
            ],
          ),
          const SizedBox(height: 3.0),
        ],
      ),
      label: label,
    );
  }
}