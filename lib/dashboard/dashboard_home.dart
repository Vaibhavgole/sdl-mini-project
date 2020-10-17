import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro1/database/auth.dart';
import 'package:pro1/models/user.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  String email;
  Dashboard(String s) {
    email = s;
  }

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  User userDetails = new User();
  int _cuurentIndex = 0;

  void getItemsFromDatabase(String id, BuildContext context) async {
    final DatabaseReference itemImages =
        FirebaseDatabase.instance.reference().child(id).child("user-info");

    await itemImages.once().then((DataSnapshot snapshot) {
      //List<Item> l = [];
      if (snapshot.value != null) {
        var keys = snapshot.value.keys;
        var values = snapshot.value;

        print(
            "******************* From Getdata from firebase ********************");
        print(keys);
        print(values);
        userDetails.name = values[keys[0]]["name"];
        userDetails.email = values[keys[0]]["email"];
        userDetails.bldGrp = values[keys[0]]["bld_grp"];
        userDetails.location = values[keys[0]]["location"];

        print(userDetails.name);

/*        for (var key in keys) {
          var theData;
          try {
            theData = values[key].values;
          } catch (e) {
            //Do nothing
          }
          if (theData != null)
            for (var value in values[key].values) {
              print("I am here");
              Item item = new Item(
                key: key,
                name: value['name'],
                description: value['description'],
                price: double.parse(value['price'].toString()),
                coverImageURL: value['_coverImageURL'],
              );

              //print("value $i");
              //print(value['_coverImageURL']);
              l.add(item);
            }
          // print(values[key].values['_coverImageURL']);
        }

        print("From line 55");
        print(l);
*/
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    getItemsFromDatabase(user.uid, context);
    // print(widget.email);
    var _kDefaultTabBarInactiveColor = Colors.grey[700];
    return new MaterialApp(
      home: new CupertinoTabScaffold(
        tabBar: new CupertinoTabBar(
          iconSize: 25,
          activeColor: Colors.red[500],
          inactiveColor: _kDefaultTabBarInactiveColor,
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              title: new Text('Home'),
              icon: new Icon(Icons.home),
            ),
            new BottomNavigationBarItem(
              title: new Text('Request'),
              icon: new Icon(
                FontAwesomeIcons.solidHeart,
              ),
            ),
            new BottomNavigationBarItem(
              title: new Text('Blood Data'),
              icon: new Icon(Icons.history),
            ),
            new BottomNavigationBarItem(
              title: new Text('Nearby Members'),
              icon: new Icon(Icons.location_on),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return new CupertinoTabView(
            builder: (BuildContext context) {
              switch (index) {
                case 0:
                  return new UserProfile(widget.email);
                case 1:
                  return new request();
                case 2:
                  return new blood_data();
                case 3:
                  return new member();
              }
            },
          );
        },
      ),
    );
  }
}

class UserProfile extends StatefulWidget {
  String email;
  UserProfile(String s) {
    email = s;
  }
  @override
  _UserProfileState createState() => _UserProfileState();
}

class User {
  String name, email, bldGrp, location;
  User({this.name, this.email, this.bldGrp, this.location});
}

class _UserProfileState extends State<UserProfile> {
  final AuthService _auth = AuthService();

  Future<dynamic> getdata() async {
    //print(widget.email);
    var url = 'http://192.168.43.75/dashboard/php_files/getdata.php';
    var res = await http.post(url, body: {
      'email': widget.email,
    });
    var data1 = json.decode(res.body);
    print(data1);
    return data1;
  }

  @override
  Widget build(BuildContext context) {
    var data1 = getdata();

    User u1 = new User();
    data1.then((s) {
      u1.location = s['location'];
      print(s['location']);
    });
    print(u1.location);
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile", style: TextStyle(fontSize: 20)),
          backgroundColor: Color(0xFFf7418c),
          actions: [
            IconButton(
              icon: Icon(Icons.all_inclusive),
              onPressed: () async {
                await _auth.SignOut();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(padding: const EdgeInsets.only(bottom: 20)),
          ListTile(
              leading: Icon(Icons.person, size: 30),
              title: Text("${u1.location}", style: TextStyle(fontSize: 30)),
              trailing: Icon(FontAwesomeIcons.pencilAlt, size: 25)),
          Padding(padding: const EdgeInsets.only(bottom: 7.5)),
          Divider(
            thickness: 0.5,
          ),
          Padding(padding: const EdgeInsets.only(bottom: 7.5)),
          ListTile(
              leading: Icon(FontAwesomeIcons.solidHeart, size: 25),
              title: Text("Blood Group", style: TextStyle(fontSize: 25)),
              subtitle: Text("Blood Group", style: TextStyle(fontSize: 15)),
              trailing: Icon(FontAwesomeIcons.pencilAlt, size: 25)),
          Padding(padding: const EdgeInsets.only(bottom: 7.5)),
          Divider(
            thickness: 0.5,
          ),
          Padding(padding: const EdgeInsets.only(bottom: 7.5)),
          ListTile(
              leading: Icon(Icons.location_on, size: 30),
              title: Text("Location", style: TextStyle(fontSize: 25)),
              subtitle: Text("Location", style: TextStyle(fontSize: 15)),
              trailing: Icon(FontAwesomeIcons.pencilAlt, size: 25)),
          Padding(padding: const EdgeInsets.only(bottom: 7.5)),
          Divider(
            thickness: 0.5,
          ),
          Padding(padding: const EdgeInsets.only(bottom: 7.5)),
          ListTile(
              leading: Icon(Icons.email, size: 30),
              title: Text("${widget.email}", style: TextStyle(fontSize: 25)),
              subtitle: Text("Email", style: TextStyle(fontSize: 15)),
              trailing: Icon(FontAwesomeIcons.pencilAlt, size: 25)),
          Padding(padding: const EdgeInsets.only(bottom: 7.5)),
          Divider(
            thickness: 0.5,
          ),
          Padding(padding: const EdgeInsets.only(bottom: 15)),
          // ListTile(
          //     leading: Icon(Icons.location_on, size: 30),
          //     title: Text("Birth Date", style: TextStyle(fontSize: 25)),
          //     subtitle: Text("Birth Date", style: TextStyle(fontSize: 15)),
          //     trailing: Icon(FontAwesomeIcons.pencilAlt, size: 25)),
          // Padding(padding: const EdgeInsets.only(bottom: 7.5)),
          // Divider(
          //   thickness: 0.5,
          // ),
          Text(
            "Available to Donate",
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.left,
          )
        ])));
  }
}

class member extends StatefulWidget {
  @override
  _memberState createState() => _memberState();
}

class _memberState extends State<member> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Nearby Member", style: TextStyle(fontSize: 20)),
            backgroundColor: Color(0xFFf7418c)),
        body: SingleChildScrollView());
  }
}

class request extends StatefulWidget {
  @override
  _requestState createState() => _requestState();
}

class _requestState extends State<request> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Request", style: TextStyle(fontSize: 20)),
            backgroundColor: Color(0xFFf7418c)),
        body: SingleChildScrollView());
  }
}

class blood_data extends StatefulWidget {
  @override
  _blood_dataState createState() => _blood_dataState();
}

class _blood_dataState extends State<blood_data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Blood Availability", style: TextStyle(fontSize: 20)),
            backgroundColor: Color(0xFFf7418c)),
        body: SingleChildScrollView());
  }
}
