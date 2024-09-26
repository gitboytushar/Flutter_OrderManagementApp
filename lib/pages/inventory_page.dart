import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kyu_q/widgets/bottom_nav_bar.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  int _selectedBottomIndex = 3;

  // Dummy inventory
  List<Map<String, dynamic>> _inventoryItems = [
    {'title': 'Breads', 'value': 10},
    {'title': 'Tomato Sauce', 'value': 20},
    {'title': 'Lettuce', 'value': 15},
    {'title': 'Cheese Slices', 'value': 25},
    {'title': 'Onions', 'value': 10},
    {'title': 'Potatoes', 'value': 18},
    {'title': 'Carrots', 'value': 12},
    {'title': 'Bell Peppers', 'value': 8},
    {'title': 'Mushrooms', 'value': 6},
    {'title': 'Rice', 'value': 40},
    {'title': 'Pasta', 'value': 30},
    {'title': 'Cold Drinks', 'value': 50},
    {'title': 'Coffee Beans', 'value': 20},
    {'title': 'Milk', 'value': 15},
    {'title': 'Butter', 'value': 10},
    {'title': 'Spinach', 'value': 12},
    {'title': 'Tofu', 'value': 8},
    {'title': 'Olive Oil', 'value': 18},
    {'title': 'Garlic', 'value': 22},
    {'title': 'Ginger', 'value': 12},
    {'title': 'Chickpeas', 'value': 16},
    {'title': 'Paneer', 'value': 14},
  ];

  // Variable To show error message
  bool _showErrorMessage = false;

  void _onBottomNavTap(int index) {
    if (index != _selectedBottomIndex) {
      setState(() {
        _selectedBottomIndex = index;

        if (index == 0) {
          Navigator.pushNamed(context, '/home_page');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/orders_page');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/statistics_page');
        } else if (index == 3) {
          // Current page
        }
      });
    }
  }

  // Function to modify item count
  void _modifyItemCount(int index, int change) {
    setState(() {
      int newValue = _inventoryItems[index]['value'] + change;

      if (newValue < 0) {
        _showErrorMessage = true;
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            _showErrorMessage = false;
          });
        });
      } else {
        _inventoryItems[index]['value'] = newValue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalItems = _inventoryItems.fold<int>(0, (sum, item) => sum + item['value'] as int);

    return Scaffold(
      backgroundColor: const Color(0xFFFD8D8D8),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFFF1D1D1D),
          scrolledUnderElevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Inventory',
                      style: TextStyle(
                        fontFamily: 'Sen',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 35.0,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/settings_page');
                      },
                      icon: const Icon(
                        Icons.account_circle_rounded,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18.0),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                  width: double.infinity,  // Stretch to the full width of the parent
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFEC48),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Items',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Sen',
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '$totalItems',  // Display the total item count on the right
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Sen',
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          toolbarHeight: 150.0,
          elevation: 0.0,
        ),
      ),

      // List of items
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 0.0),
            child: ListView.builder(
              itemCount: _inventoryItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: _buildStatsCard(
                    _inventoryItems[index]['title'],
                    _inventoryItems[index]['value'],
                    index,
                  ),
                );
              },
            ),
          ),

          // Error message popup
          if (_showErrorMessage)
            Stack(
              children: [
                // Blurred background
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0), // Blur intensity
                  child: Container(
                    color: Colors.black.withOpacity(0.1), // Optional dark overlay for the blur effect
                  ),
                ),

                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20.0), // Added border radius
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 50.0),
                    child: const Text(
                      "Warning! Minimum Value",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),

      // Bottom NavBar
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedBottomIndex,
        onTap: _onBottomNavTap,
      ),
    );
  }

  // inventory card widget
  Widget _buildStatsCard(String title, int value, int index) {
    return Card(
      margin: const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 0.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Item name
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10.0),

              Row(
                children: [
                  Container(
                    width: 25.0,
                    height: 25.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFFC4C4),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.remove, color: Colors.black),
                      padding: EdgeInsets.zero,  // Remove internal padding to center the icon
                      iconSize: 16.0,  // Adjust the icon size if needed
                      onPressed: () => _modifyItemCount(index, -1),
                    ),
                  ),

                  // Per item value
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      '$value',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  Container(
                    width: 25.0,
                    height: 25.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFC7FFBE),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.black),
                      padding: EdgeInsets.zero,  // Remove internal padding to center the icon
                      iconSize: 16.0,  // Adjust the icon size if needed
                      onPressed: () => _modifyItemCount(index, 1),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}