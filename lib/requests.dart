import 'package:flutter/material.dart';

import 'colors.dart';

class RequestsScreen extends StatefulWidget {
  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class ProfileClass {
  String image_path;
  String name;
  String work;

  ProfileClass(this.image_path, this.name, this.work);
}

List<ProfileClass> _list = [
  new ProfileClass(
      "hashim_briscam.jpeg", "Hashim Briscam", "Graphics Designer, Paypal"),
  new ProfileClass("hangakore_hariwana.jpg", "Hangakore Hariwana",
      "Visual Designer, Paypal"),
  new ProfileClass(
      "elston_gullan.jpg", "Elston Gullan", "Motion Designer, Paypal")
];

class _RequestsScreenState extends State<RequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: ContentPage(),
      ),
    );
  }
}

class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  bool isShow = false;
  Color _color = Colors.transparent;
  double _height = 0, _height2 = 0, _width2 = 0;
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        width: _width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: _width,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Colors.transparent),
                      left: BorderSide(width: 1.0, color: Colors.transparent),
                      right: BorderSide(width: 1.0, color: Colors.transparent),
                      bottom: BorderSide(width: 1.0, color: borderGrey),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: greyColor,
                          size: 20,
                        ),
                      ),
                      Container(
                        width: _width - 62,
                        height: 60,
                        child: Center(
                          child: Text(
                            'Requests',
                            style: TextStyle(
                                color: greyColor, fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: _width,
                  margin: EdgeInsets.only(left: 20, right: 20),
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
                    unselectedLabelStyle:
                        TextStyle(fontWeight: FontWeight.normal),
                    tabs: [
                      Tab(
                        text: 'New Requests(4)',
                      ),
                      Tab(
                        text: 'Previous requests',
                      ),
                    ],
                  ),
                ),
                Container(
                  width: _width,
                  padding: EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height - 144,
                  child: TabBarView(
                    children: <Widget>[
                      Page1(
                        clickCallback: () => setState(() {
                          _color = Colors.black.withOpacity(0.8);
                          _height = MediaQuery.of(context).size.height;
                          _width2 = MediaQuery.of(context).size.width;
                          _height2 =
                              MediaQuery.of(context).size.height * 0.55 + 40;
                        }),
                      ),
                      Icon(Icons.arrow_back)
                    ],
                  ),
                )
              ],
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _height = 0;
                      _color = Colors.transparent;
                      _height2 = 0;
                      _width2 = 0;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: _height,
                    height: _height,
                    color: _color,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                width: _width,
                height: _height2,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: _width,
                        height: MediaQuery.of(context).size.height * 0.55,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            )),
                      ),
                    ),
                    Positioned(
                      left: (_width - 100) / 2,
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              child: Image.asset('assets/ahmad_nazari.png'),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      top: 50,
                      child: Row(
                        children: <Widget>[
                          Text(
                            'View profile',
                            style: TextStyle(
                                color: greenColor, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.arrow_right,
                            color: greenColor,
                            size: 24,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 120,
                      child: Container(
                        width: _width,
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Ahmad Nazari',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18)),
                            SizedBox(
                              height: 5,
                            ),
                            new Text(
                              'UI Designer, Android Google',
                              style: TextStyle(fontSize: 18, color: textGreen),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
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
                                  padding: EdgeInsets.only(
                                      left: 30, right: 30, top: 10, bottom: 10),
                                  child: new Text(
                                    'Reject',
                                    style: TextStyle(
                                        color: Color(0xFF585858),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: greenColor),
                                  padding: EdgeInsets.only(
                                      left: 30, right: 30, top: 10, bottom: 10),
                                  child: new Text(
                                    'Accept',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 10, right: 40, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border(
                                  top:
                                      BorderSide(width: 1.0, color: borderGrey),
                                  left:
                                      BorderSide(width: 1.0, color: borderGrey),
                                  right:
                                      BorderSide(width: 1.0, color: borderGrey),
                                  bottom:
                                      BorderSide(width: 1.0, color: borderGrey),
                                ),
                              ),
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new RichText(
                                      text: new TextSpan(
                                          style: new TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black,
                                          ),
                                          children: <TextSpan>[
                                        new TextSpan(
                                            text: 'Interest : ',
                                            style: new TextStyle(
                                                color: greyColor)),
                                        new TextSpan(
                                            text: 'Product Design',
                                            style: new TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ])),
                                  Text(
                                    'I want to learn about the process of Product Design and  how can I maintain that loriam ipsom dolor sit amet It is a long established fact that a reader will be distracted.',
                                    style: TextStyle(height: 1.6),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: _width,
                              margin: EdgeInsets.only(left: 20, right: 20),
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFFF0E9),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 80),
                                    child: Text(
                                      'www.dribbble.com/nazeri',
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
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  final VoidCallback clickCallback;
  Page1({this.clickCallback});
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Best Watch',
          style: TextStyle(fontWeight: FontWeight.w500, color: greyColor),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: () {
                widget.clickCallback();
              },
              child: Container(
                width: 64,
                height: 64,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset('assets/ahmad_nazari.png'),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32), color: Colors.red),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Ahmad Nazari',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(
                  height: 2,
                ),
                Text('Serior UX Designer, Amazon'),
                SizedBox(
                  height: 10,
                ),
                Container(
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
                      SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.import_export,
                        color: Color(0xFF585858),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      new Text(
                        'Share your availability',
                        style: TextStyle(
                            color: Color(0xFF585858),
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 4,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'Other Profiles',
          style: TextStyle(fontWeight: FontWeight.w500, color: greyColor),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 353,
          child: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, int index) {
              return ProfileWidget(_list[index]);
            },
          ),
        )
      ],
    );
  }
}

class ProfileWidget extends StatelessWidget {
  ProfileClass myprofile;
  ProfileWidget(this.myprofile);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                'assets/' + myprofile.image_path,
                width: 64,
                height: 64,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  myprofile.name,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(myprofile.work),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border(
                          top: BorderSide(width: 1.0, color: borderGrey),
                          left: BorderSide(width: 1.0, color: borderGrey),
                          right: BorderSide(width: 1.0, color: borderGrey),
                          bottom: BorderSide(width: 1.0, color: borderGrey),
                        ),
                      ),
                      padding: EdgeInsets.only(
                          left: 30, right: 30, top: 10, bottom: 10),
                      child: new Text(
                        'Review',
                        style: TextStyle(
                            color: Color(0xFF585858),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: greenColor),
                      padding: EdgeInsets.only(
                          left: 30, right: 30, top: 10, bottom: 10),
                      child: new Text(
                        'Accept',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
