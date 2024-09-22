import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // set background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bgImage.png'), // Your image path
                fit: BoxFit.cover, // Ensures the image covers the whole screen
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(24.0, 35.0, 24.0, 0),
              // main container
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // brand
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: SizedBox(
                              width: 90.0,
                              height: 90.0,
                              child: Image(
                                image: AssetImage('assets/icon.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 24.0),
                          Text(
                            'KyuQ',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      // Admin cta btn
                      IconButton(
                        onPressed: () {
                          // settings page
                          // print('account button clicked');
                          Navigator.pushNamed(context, '/settings_page');
                        },
                        icon: Icon(
                          Icons.account_circle_rounded,
                          color: Colors.white,
                          size: 40.0,
                        ),
                      ),
                    ],
                  ),

                  // brand tagline
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 55.0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Manage Less,',
                          style: TextStyle(
                            fontFamily: 'Sen',
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1.0,
                            ),
                        ),
                        Text(
                          'Serve More',
                          style: TextStyle(
                            fontFamily: 'Sen',
                            fontSize: 48.5,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            height: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // cta btn for orders page
                  Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 100.0),
                      width: 210.0,
                      height: 55.0,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3), // 50% opacity black background
                        borderRadius: BorderRadius.circular(10.0), // Match button border radius
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/orders_page');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF5DB00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          side: BorderSide(color: Colors.black, width: 2.0)
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Get Started',
                              style: TextStyle(
                                fontFamily: 'Sen',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 20.0,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}