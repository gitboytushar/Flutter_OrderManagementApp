import 'package:flutter/material.dart';
import 'package:kyu_q/widgets/order_card.dart';
import 'package:kyu_q/widgets/order.dart';

void main() {
  runApp(const MaterialApp(
    home: OrderPage(),
  ));
}

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _activeTabIndex = 0;

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
      orderId: '0382/61',
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
      orderId: '0383/61',
      username: 'Isha Sharma',
      items: {
        'Biryani': 'x1',
        'Raita': 'x1',
        'Gulab Jamun': 'x2',
      },
    ),
    Order(
      orderId: '0384/61',
      username: 'Ayush Bharadwaj',
      items: {
        'Chole Bhature': 'x2',
        'Lassi': 'x2',
        'Kachori': 'x3',
      },
    ),
    Order(
      orderId: '0385/61',
      username: 'Diya Mehta',
      items: {
        'Butter Chicken': 'x1',
        'Jeera Rice': 'x2',
        'Roti': 'x4',
      },
    ),
    Order(
      orderId: '0386/61',
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
      orderId: '0387/61',
      username: 'Sanya Gupta',
      items: {
        'Pav Bhaji': 'x2',
        'Pani Puri': 'x6',
        'Sev': 'x1',
      },
    ),
    Order(
      orderId: '0388/61',
      username: 'Amit Joshi',
      items: {
        'Dal Makhani': 'x2',
        'Butter Naan': 'x2',
        'Kheer': 'x1',
      },
    ),
  ];

  // create different list on different tabs
  List<Order> newOrders = [];
  List<Order> inProgressOrders = [];
  List<Order> deliveredOrders = [];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      setState(() {
        _activeTabIndex = _tabController.index; // Update the active tab index when the tab changes
      });
    });

    newOrders = List.from(originalOrders); // new orders
    inProgressOrders = []; // orders confirmed
    deliveredOrders = []; // orders delivered
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFD8D8D8),

      // -------------- APP BAR TOP --------------
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
                const Text(
                  'Manage Orders',
                  style: TextStyle(
                    fontFamily: 'Sen',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 32.0,
                  ),
                ),
                const SizedBox(height: 24.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50.0,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context); // navigate back to home page
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white, // Background color
                          foregroundColor: Colors.black, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        icon: Icon(
                          Icons.home_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      width: 70.0,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _activeTabIndex = 0; // Set active index to 0
                            _tabController.index = 0; // Switch to the new orders tab
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: _activeTabIndex == 0
                              ? Color(0xFFFF5DB00)
                              : Colors.white, // Change bg color based on the active tab
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'New',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 120.0,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _activeTabIndex = 1; // Set active index to 1
                            _tabController.index = 1; // Switch to the in-progress tab
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: _activeTabIndex == 1
                              ? Color(0xFFFF5DB00)
                              : Colors.white, // Change bg color based on the active tab
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'In Progress',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 105.0,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _activeTabIndex = 2; // Set active index to 2
                            _tabController.index = 2; // Switch to the delivered tab
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: _activeTabIndex == 2
                              ? Color(0xFFFF5DB00)
                              : Colors.white, // Change bg color based on the active tab
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Delivered',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                // Additional buttons can be added here if needed
              ],
            ),
          ),

          toolbarHeight: 140.0,
          elevation: 0.0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(4.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFF000000), // Bottom border color
                    width: 3.0, // Bottom border width
                  ),
                ),
              ),
            ),
          ),
        ),
      ),


        // ---------- BODY ELEMENTS -----------
        body: TabBarView(
          controller: _tabController,
          children: [
            // New Orders
            ListView(
              children: <Widget>[
                Column(
                  children: newOrders.map((order) => OrderCard(
                    order: order,
                    cancel: () {
                      setState(() {
                        newOrders.remove(order); // remove from new orders list
                      });
                    },
                    ready: () {
                      setState(() {
                        newOrders.remove(order); // remove from new orders list
                        inProgressOrders.add(order); // add to in-progress orders list
                      });
                    },
                    currentTab: 'new', // Pass the current tab value
                  )).toList(),
                ),
              ],
            ),

            // In Progress Orders
            ListView(
              children: <Widget>[
                Column(
                  children: inProgressOrders.map((order) => OrderCard(
                    order: order,
                    cancel: () {
                      setState(() {
                        inProgressOrders.remove(order); // remove from in-progress orders list
                      });
                    },
                    ready: () {
                      setState(() {
                        inProgressOrders.remove(order); // remove from in-progress orders list
                        deliveredOrders.add(order); // add to delivered orders list
                      });
                    },
                    currentTab: 'in-progress', // Pass the current tab value
                  )).toList(),
                ),
              ],
            ),

            // Delivered Orders
            ListView(
              children: <Widget>[
                Column(
                  children: deliveredOrders.map((order) => OrderCard(
                    order: order,
                    cancel: () {}, // No action required here
                    ready: () {
                      setState(() {
                        deliveredOrders.remove(order); // clear the order from the list
                      });
                    },
                    currentTab: 'delivered', // Pass the current tab value
                  )).toList(),
                ),
              ],
            ),
          ],
      )
    );
  }
}