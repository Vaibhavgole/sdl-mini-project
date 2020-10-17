import 'package:flutter/material.dart';
import 'package:pro1/donor/donor_login.dart';
import 'package:pro1/admin/admin_homepage.dart';
import 'package:pro1/theme.dart' as Theme;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
              title: Text("Home Page", style: TextStyle(fontSize: 20)),
              backgroundColor: Color(0xFFf7418c)),
          body: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: const EdgeInsets.only(bottom: 100)),
              Center(
                  child: (Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: new AssetImage('assets/drop.jpg'),
                              fit: BoxFit.fill))))),
              Padding(padding: const EdgeInsets.only(bottom: 40)),
              Container(
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0x552B2B2B),
                        offset: Offset(1.0, 4.0),
                        blurRadius: 10.0,
                      ),
                      BoxShadow(
                        color: Theme.Colors.loginGradientEnd,
                        offset: Offset(1.0, 4.0),
                        blurRadius: 10.0,
                      ),
                    ],
                    gradient: new LinearGradient(
                        colors: [
                          Theme.Colors.loginGradientEnd,
                          Theme.Colors.loginGradientStart
                        ],
                        begin: const FractionalOffset(0.2, 0.2),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: MaterialButton(
                      highlightColor: Colors.transparent,
                      splashColor: Theme.Colors.loginGradientEnd,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 90.0),
                        child: Text(
                          "BANK ADMIN",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontFamily: "WorkSansBold"),
                        ),
                      ),
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => admin_homepage()),
                          ))),
              Padding(padding: const EdgeInsets.only(bottom: 30)),
              Container(
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0x552B2B2B),
                        offset: Offset(1.0, 4.0),
                        blurRadius: 10.0,
                      ),
                      BoxShadow(
                        color: Theme.Colors.loginGradientEnd,
                        offset: Offset(1.0, 4.0),
                        blurRadius: 10.0,
                      ),
                    ],
                    gradient: new LinearGradient(
                        colors: [
                          Theme.Colors.loginGradientEnd,
                          Theme.Colors.loginGradientStart
                        ],
                        begin: const FractionalOffset(0.2, 0.2),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: MaterialButton(
                      highlightColor: Colors.transparent,
                      splashColor: Theme.Colors.loginGradientEnd,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 110.0),
                        child: Text(
                          "DONOR",
                          style: TextStyle(
                              backgroundColor: Colors.black,
                              color: Colors.black,
                              fontSize: 15.0,
                              fontFamily: "WorkSansBold"),
                        ),
                      ),
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Donorlogin()),
                          ))),
              Padding(padding: const EdgeInsets.only(bottom: 30)),
            ],
          ))),
    );
  }
}
