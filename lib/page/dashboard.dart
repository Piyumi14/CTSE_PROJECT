import 'package:flutter/material.dart';
import 'package:todo_app_firestore_example/page/home_page.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        title: Text("SL-Dancer"),
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Material(
                      elevation: 20.0,
                      child: Container(
                          width: 200.0,
                          height: 100.0,
                          child: Column(
                            children: <Widget>[
                              Material(
                                child: Container(
                                  width: 200.0,
                                  height: 180.0,
                                  child: ClipRRect(
                                    child: Image(
                                      image: AssetImage(
                                          "lib/assets/images/ima.jpg"),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()),
                                    );
                                  },
                                  child: Image.asset(
                                      'lib/assets/images/dancing.png'),
                                ),
                                Text('Styles',
                                    style: TextStyle(fontSize: 20.0)),
                              ],
                            )),
                        Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FlatButton(
                                  child: Image.asset(
                                      'lib/assets/images/gallery.png'),
                                ),
                                Text('Gallery',
                                    style: TextStyle(fontSize: 20.0))
                              ],
                            )),
                        Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FlatButton(
                                  child: Image.asset(
                                      'lib/assets/images/details.png'),
                                ),
                                Text('Details',
                                    style: TextStyle(fontSize: 20.0))
                              ],
                            )),
                        Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FlatButton(
                                  child: Image.asset(
                                      'lib/assets/images/contact.png'),
                                ),
                                Text('Contact',
                                    style: TextStyle(fontSize: 20.0))
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget buildText(String text) => Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
