import 'package:flutter/material.dart';
import 'package:kyu_q/widgets/order_card.dart';
import 'package:kyu_q/widgets/order.dart';
import 'package:kyu_q/widgets/bottom_nav_bar.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _activeTabIndex = 0;

  int _selectedBottomIndex = 1; // Set default active index for orders page

  void _onBottomNavTap(int index) {
    if (index != _selectedBottomIndex) {
      setState(() {
        _selectedBottomIndex = index;

        // Navigate based on selected index
        if (index == 0) {
          Navigator.pushNamed(context, '/home_page');
        } else if (index == 1) {
          // current page
        } else if (index == 2) {
          Navigator.pushNamed(context, '/statistics_page');
        } else if (index == 3) {
          Navigator.pushNamed(context, '/inventory_page');
        }
      });
    }
  }

  // Data Structure for List of orders
  final List<Order> originalOrders = [
    Order(
      orderId: '0381/61',
      username: 'Rohit Bamnawat',
      items: {
        'Cold Coffee': 'x1',
        'Sandwich': 'x2',
        'Burger': 'x1',
      },
    ),
    Order(
      orderId: '0382/62',
      username: 'Aarav Patel',
      items: {
        'Masala Chai': 'x2',
        'Paneer Tikka': 'x1',
        'Naan': 'x3',
        'Cold Coffee': 'x1',
        'Sandwich': 'x2',
        'Burger': 'x1',
        'Biryani': 'x1',
        'Raita': 'x1',
        'Gulab Jamun': 'x2',
      },
    ),
    Order(
      orderId: '0383/63',
      username: 'Isha Sharma',
      items: {
        'Biryani': 'x1',
        'Raita': 'x1',
        'Gulab Jamun': 'x2',
      },
    ),
    Order(
      orderId: '0384/64',
      username: 'Ayush Bharadwaj',
      items: {
        'Chole Bhature': 'x2',
        'Lassi': 'x2',
        'Kachori': 'x3',
      },
    ),
    Order(
      orderId: '0385/65',
      username: 'Diya Mehta',
      items: {
        'Butter Chicken': 'x1',
        'Jeera Rice': 'x2',
        'Roti': 'x4',
      },
    ),
    Order(
      orderId: '0386/66',
      username: 'Ravi Kumar',
      items: {
        'Dosa': 'x2',
        'Sambar': 'x1',
        'Coconut Chutney': 'x3',
        'Butter Chicken': 'x1',
        'Jeera Rice': 'x2',
        'Roti': 'x4',
      },
    ),
    Order(
      orderId: '0387/67',
      username: 'Sanya Gupta',
      items: {
        'Pav Bhaji': 'x2',
        'Pani Puri': 'x6',
        'Sev': 'x1',
      },
    ),
    Order(
      orderId: '0388/68',
      username: 'Amit Joshi',
      items: {
        'Dal Makhani': 'x2',
        'Butter Naan': 'x2',
        'Kheer': 'x1',
      },
    ),
  ];

  // Three list per order states
  List<Order> newOrders = [];
  List<Order> inProgressOrders = [];
  List<Order> deliveredOrders = [];

  // order management
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      setState(() {
        _activeTabIndex = _tabController.index;
      });
    });

    newOrders = List.from(originalOrders);
    inProgressOrders = [];
    deliveredOrders = [];
  }

  // main widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFD8D8D8),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFFF1D1D1D),
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
                      'Manage Orders',
                      style: TextStyle(
                        fontFamily: 'Sen',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 35.0,
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        // go to settings page
                        Navigator.pushNamed(context, '/settings_page');
                      },
                      icon: Icon(
                        Icons.account_circle_rounded,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18.0),

                // slide to reveal the tabs when screen size is less
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTabButton('New Orders', 0),
                      SizedBox(width: 16.0),
                      _buildTabButton('In Progress', 1),
                      SizedBox(width: 16.0),
                      _buildTabButton('Delivered', 2),
                    ],
                  ),
                ),
              ],
            ),
          ),
          toolbarHeight: 150.0,
          elevation: 0.0,
        ),
      ),


      // Show Lists
      body: TabBarView(
        controller: _tabController,
        children: [
          // New Orders Tab
          _buildOrderList(newOrders, 'new', inProgressOrders),
          // In Progress Orders Tab
          _buildOrderList(inProgressOrders, 'in-progress', deliveredOrders),
          // Delivered Orders Tab
          _buildOrderList(deliveredOrders, 'delivered', []),
        ],
      ),

      // Bottom NavBar
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedBottomIndex,
        onTap: _onBottomNavTap,
      ),
    );
  }

  Widget _buildBottomNavIcon(IconData icon, int index) {
    bool isActive = _selectedBottomIndex == index;
    return Stack(
      alignment: Alignment.center,
      children: [
        if (isActive) // Show yellow circle only if active
          Container(
            width: 36.0, // Adjust size as needed
            height: 36.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellow, // Background color
            ),
          ),
        Icon(
          icon,
          color: isActive ? Colors.black : Colors.grey, // Icon color
        ),
      ],
    );
  }

  Widget _buildTabButton(String label, int index) {
    return Container(
      width: 120.0,
      child: TextButton(
        onPressed: () {
          setState(() {
            _activeTabIndex = index;
            _tabController.index = index;
          });
        },
        style: TextButton.styleFrom(
          backgroundColor: _activeTabIndex == index
              ? Color(0xFFFFFEC48)
              : Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  // List of cards
  Widget _buildOrderList(List<Order> orders, String currentTab, List<Order> nextTabOrders) {
    return ListView(
      children: <Widget>[
        Column(
          children: orders.map((order) => OrderCard(
            order: order,
            cancel: () {
              setState(() {
                orders.remove(order);
              });
            },
            ready: () {
              setState(() {
                orders.remove(order);
                nextTabOrders.add(order);
              });
            },
            currentTab: currentTab,
          )).toList(),
        ),
      ],
    );
  }
}