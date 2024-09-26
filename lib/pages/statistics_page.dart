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
  int _selectedBottomIndex = 2;

  final List<String> tabs = ['Order History', 'Financials'];

  void _onBottomNavTap(int index) {
    if (index != _selectedBottomIndex) {
      setState(() {
        _selectedBottomIndex = index;

        if (index == 0) {
          Navigator.pushNamed(context, '/home_page');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/orders_page');
        } else if (index == 2) {
          // current page
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
                      'Statistics',
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

      // appbar tabs
      body: TabBarView(
        controller: _tabController,
        children: [
          // Order History Tab
          _buildOrderHistoryTab(),
          // Financial Stats Tab
          _buildFinancialStatsTab(),
        ],
      ),

      // Bottom NavBar
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedBottomIndex,
        onTap: _onBottomNavTap,
      ),
    );
  }

  // ---------- Custom Widgets -------------

  Widget _buildTabButton(String label, int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
      width: 125.0,
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

  // Financials Tab
  Widget _buildFinancialStatsTab() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildStatsCard('Net Profit', '₹9,000'),
            SizedBox(height: 30.0),
            _buildStatsCard('Orders Completed', '150'),
            SizedBox(height: 10.0),
            _buildStatsCard('Pending Payments', '₹500'),
            SizedBox(height: 10.0),
            _buildStatsCard('Refunds Issued', '₹300'),
            SizedBox(height: 10.0),
            _buildStatsCard('Total Revenue', '₹12,300'),
          ],
        ),
      ),
    );
  }

  // Order History Tab
  Widget _buildOrderHistoryTab() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the cards vertically
          crossAxisAlignment: CrossAxisAlignment.stretch, // Cards will take up the full width
          children: [
            _buildStatsCard('Total Orders', '300'),
            SizedBox(height: 30.0),
            _buildStatsCard('Total Cancelled Orders', '20'),
            SizedBox(height: 10.0),
            _buildStatsCard('Last Order Date', '21/09/2024'),
            SizedBox(height: 10.0),
            _buildStatsCard('Most Ordered Item', 'Veg Burger'),
            SizedBox(height: 10.0),
            _buildStatsCard('Average Order Value', '₹80'),
          ],
        ),
      ),
    );
  }

  // statistics cards
  Widget _buildStatsCard(String title, String value) {
    return Card(
      margin: const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 0.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                value,
                textAlign: TextAlign.center, // Center value
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}