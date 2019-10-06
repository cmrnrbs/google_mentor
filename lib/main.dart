import 'package:flutter/material.dart';
import 'package:google_mentor/requests.dart';
import 'colors.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test',
      home: HomeScreen(),
    ));

class WorkItem {
  String image_path;
  String title;
  String customer;
  String date;

  WorkItem(this.image_path, this.title, this.customer, this.date);
}

List<WorkItem> _list = [
  WorkItem('google_logo.png', 'UX Designer', 'Google',
      'Sep 2018 - Present . 11 Month'),
  WorkItem('airbnb.jpg', 'Lead UX Designer', 'Airbnb',
      'Sep 2017- Apr 2018 . 10 Mos'),
  WorkItem('uber.png', 'Senior UX Designer', 'Uber Design',
      'Sep 2016 - Jun 2017 . 1 yr 6 Mos')
];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(child: ContentPage()),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 16,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none),
              title: Text('Notifications'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
        ),
      ),
    );
  }
}

class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: _width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Container(
              width: _width,
              height: 110,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    width: _width - 40,
                    top: 20,
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 20,
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: greyColor,
                                size: 20,
                              ),
                            ),
                            Container(
                              width: 94,
                              child: Row(
                                children: <Widget>[
                                  new Text('Edit Profile',
                                      style: TextStyle(
                                          color: greenColor,
                                          fontWeight: FontWeight.bold)),
                                  Icon(
                                    Icons.arrow_right,
                                    color: greenColor,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: (_width / 2) - 70,
                    child: Container(
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                        child: Image.asset('assets/logo.png'),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            new Text(
              'Lia Castro',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            new Text(
              'UI Designer, Android Google',
              style: TextStyle(fontSize: 18, color: textGreen),
            ),
            SizedBox(
              height: 5,
            ),
            new Text(
              '389 Followers',
              style: TextStyle(fontSize: 18, color: textGreen),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                NewPostButton(),
                SizedBox(
                  width: 10,
                ),
                SetAvailability()
              ],
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RequestsScreen()),
                );
              },
              child: Container(
                width: _width,
                height: 60,
                decoration: BoxDecoration(
                    color: Color(0xFFFFF0E9),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      Icons.notifications_none,
                      color: orangeColor,
                      size: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 40),
                      child: Text(
                        'You got 4 mentorship requests',
                        style: TextStyle(
                            color: orangeColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    Icon(
                      Icons.arrow_right,
                      color: orangeColor,
                      size: 28,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: _width,
              height: 60,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.transparent),
                  left: BorderSide(width: 1.0, color: Colors.transparent),
                  right: BorderSide(width: 1.0, color: Colors.transparent),
                  bottom: BorderSide(width: 1.0, color: borderGrey),
                ),
              ),
              child: TabBar(
                unselectedLabelColor: Colors.black,
                indicatorColor: greenColor,
                labelColor: greenColor,
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                tabs: [
                  Tab(
                    text: 'Experience',
                  ),
                  Tab(
                    text: 'Reviews(34)',
                  ),
                ],
              ),
            ),
            Container(
              width: _width,
              height: MediaQuery.of(context).size.height - 345 - 60 - 56,
              child: TabBarView(
                children: [
                  ListView.builder(
                    padding: EdgeInsets.only(top: 30),
                    itemCount: _list.length,
                    itemBuilder: (context, int index) {
                      return Column(
                        children: <Widget>[
                          Container(
                            width: _width,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/' + _list[index].image_path,
                                      width: 36,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border(
                                      top: BorderSide(
                                          width: 1.0, color: borderGrey),
                                      left: BorderSide(
                                          width: 1.0, color: borderGrey),
                                      right: BorderSide(
                                          width: 1.0, color: borderGrey),
                                      bottom: BorderSide(
                                          width: 1.0, color: borderGrey),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      _list[index].title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      _list[index].customer,
                                      style: TextStyle(color: greyColor),
                                    ),
                                    Text(
                                      _list[index].date,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          )
                        ],
                      );
                    },
                  ),
                  Icon(Icons.directions_transit),
                ],
              ),
            )
          ],
        ));
  }
}

class SetAvailability extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: greenColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(6),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 4,
          ),
          Text('Set availability',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              )),
          Icon(
            Icons.arrow_right,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class NewPostButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border(
          top: BorderSide(width: 1.0, color: borderGrey),
          left: BorderSide(width: 1.0, color: borderGrey),
          right: BorderSide(width: 1.0, color: borderGrey),
          bottom: BorderSide(width: 1.0, color: borderGrey),
        ),
      ),
      padding: EdgeInsets.all(6),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.open_in_new,
            color: Color(0xFF585858),
          ),
          SizedBox(
            width: 8,
          ),
          new Text(
            'New post',
            style: TextStyle(
                color: Color(0xFF585858), fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 4,
          )
        ],
      ),
    );
  }
}
