import 'package:flutter/material.dart';
import 'package:kyu_q/widgets/bottom_nav_bar.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _activeTabIndex = 0;
  int _selectedBottomIndex = 2; // Set default active index for statistics page

  // Tabs data for statistics
  final List<String> tabs = ['Revenue', 'Order Insights', 'Top Customers', 'Order History'];

  void _onBottomNavTap(int index) {
    if (index != _selectedBottomIndex) {
      setState(() {
        _selectedBottomIndex = index;

        if (index == 0) {
          Navigator.pushNamed(context, '/home_page');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/orders_page');
        } else if (index == 2) {
          // Already on statistics page, no need to navigate
        } else if (index == 3) {
          Navigator.pushNamed(context, '/inventory_page');
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabs.length, vsync: this);

    _tabController.addListener(() {
      setState(() {
        _activeTabIndex = _tabController.index;
      });
    });
  }

  // Main widget
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
                      'Vendor Statistics',
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
                      icon: Icon(
                        Icons.account_circle_rounded,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18.0),
                // Slide to reveal the tabs when screen size is less
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: tabs.map((tab) {
                      int index = tabs.indexOf(tab);
                      return _buildTabButton(tab, index);
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          toolbarHeight: 150.0,
          elevation: 0.0,
        ),
      ),
      // TabBar content
      body: TabBarView(
        controller: _tabController,
        children: [
          // Revenue Tab
          _buildRevenueTab(),
          // Order Insights Tab
          _buildOrderInsightsTab(),
          // Top Customers Tab
          _buildTopCustomersTab(),
          // Order History Tab
          _buildOrderHistoryTab(),
        ],
      ),
      // Bottom NavBar
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedBottomIndex,
        onTap: _onBottomNavTap,
      ),
    );
  }

  // Tab buttons for the appbar
  Widget _buildTabButton(String label, int index) {
    return Container(
      width: 140.0,
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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

  // Revenue Tab Content
  Widget _buildRevenueTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Total Revenue: \$12,300', style: _statsTextStyle()),
          SizedBox(height: 10.0),
          Text('Orders Completed: 150', style: _statsTextStyle()),
          SizedBox(height: 10.0),
          Text('Pending Payments: \$500', style: _statsTextStyle()),
        ],
      ),
    );
  }

  // Order Insights Tab Content
  Widget _buildOrderInsightsTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Average Order Value: \$82', style: _statsTextStyle()),
          SizedBox(height: 10.0),
          Text('Peak Order Time: 6:00 PM - 9:00 PM', style: _statsTextStyle()),
          SizedBox(height: 10.0),
          Text('Most Ordered Item: Pizza (x40)', style: _statsTextStyle()),
        ],
      ),
    );
  }

  // Top Customers Tab Content
  Widget _buildTopCustomersTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Top Customer: John Doe - 20 orders', style: _statsTextStyle()),
          SizedBox(height: 10.0),
          Text('Total Spent: \$2,000', style: _statsTextStyle()),
          SizedBox(height: 10.0),
          Text('Repeat Customers: 35%', style: _statsTextStyle()),
        ],
      ),
    );
  }

  // Order History Tab Content
  Widget _buildOrderHistoryTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Total Orders: 200', style: _statsTextStyle()),
          SizedBox(height: 10.0),
          Text('Last Order Date: 21st Sept 2024', style: _statsTextStyle()),
          SizedBox(height: 10.0),
          Text('Total Revenue from Orders: \$10,000', style: _statsTextStyle()),
        ],
      ),
    );
  }

  // Helper Text Style
  TextStyle _statsTextStyle() {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
  }
}