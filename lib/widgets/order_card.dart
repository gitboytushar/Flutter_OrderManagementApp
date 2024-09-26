import 'package:flutter/material.dart';
import 'order.dart';

class OrderCard extends StatefulWidget {
  final Order order;
  final VoidCallback cancel;
  final VoidCallback ready;
  final String currentTab;

  const OrderCard({
    super.key,
    required this.order,
    required this.cancel,
    required this.ready,
    required this.currentTab,
  });

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // Food items List widget
    List<MapEntry<String, String>> itemEntries = widget.order.items.entries.toList();

    List<Widget> itemWidgets = itemEntries.map((entry) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            entry.key, // Food item
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(width: 10.0),
          Text(
            entry.value, // Order count
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[800],
            ),
          ),
        ],
      );
    }).toList();

    // action buttons for order card changes based on current tab state
    String confirmButtonText = '';
    String cancelButtonText = '';

    if (widget.currentTab == 'new') {
      confirmButtonText = 'Confirm';
      cancelButtonText = 'Decline';
    } else if (widget.currentTab == 'in-progress') {
      confirmButtonText = 'Delivered';
      cancelButtonText = 'Failed';
    } else if (widget.currentTab == 'delivered') {
      confirmButtonText = 'Clear Me';
      cancelButtonText = ''; // Hide this button
    }

    // Main widget
    return SafeArea(
      child: Card(
        margin: const EdgeInsets.fromLTRB(14.0,14.0, 14.0, 0.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent, // Removes the top and bottom borders in expanded card
            ),
            child: ExpansionTile(
              collapsedBackgroundColor: Colors.white,
              backgroundColor: Colors.white,
              iconColor: Colors.black,
              expandedAlignment: Alignment.topCenter,
              maintainState: true,
              title: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 70.0,
                      color: Colors.grey[800],
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.order.orderId,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          widget.order.username,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 13.0, 24.0, 13.0),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 3.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ...itemWidgets, // Display all items per orders

                        if (widget.currentTab != 'delivered')
                          SizedBox(height: 30.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Hide red button if in delivered tab
                            if (widget.currentTab != 'delivered') ...[
                              TextButton(
                                onPressed: () {
                                  widget.cancel();
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xFFFFFC4C4),
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        cancelButtonText,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(width: 12.0),
                                      Icon(Icons.close_rounded, size: 19.0),
                                    ],
                                  ),
                                ),
                              ),
                            ],

                            const SizedBox(width: 12.0),

                            // Hide green button if in 'delivered' tab
                            if (widget.currentTab != 'delivered')
                              TextButton(
                                onPressed: () {
                                  widget.ready();
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xFFFC7FFBE),
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        confirmButtonText,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(width: 12.0),
                                      Icon(Icons.check_rounded, size: 19.0),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() {
                  isExpanded = expanded;
                });
              },
            ),
          ),
        ),
      )
    );
  }
}