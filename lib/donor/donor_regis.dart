import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:pro1/database/auth.dart';
import '../theme.dart' as Theme;

class DonorRegis extends StatefulWidget {
  @override
  _DonorRegisState createState() => _DonorRegisState();
}

class _DonorRegisState extends State<DonorRegis> {
  int _value = 1;
  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();
  final FocusNode myFocusNodeNameLogin = FocusNode();
  final FocusNode myFocusNodeLocationLogin = FocusNode();
  bool _obscureTextLogin = true;
  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();
  TextEditingController loginNameController = new TextEditingController();
  TextEditingController loginLocationController = new TextEditingController();

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Donor Registration", style: TextStyle(fontSize: 20)),
            backgroundColor: Color(0xFFf7418c)),
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          //Padding(padding: const EdgeInsets.only(bottom: 100)),
          Center(),
          Padding(padding: const EdgeInsets.only(bottom: 40)),
          Card(
            elevation: 2.0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              width: 300.0,
              height: 500.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                    child: TextField(
                      focusNode: myFocusNodeNameLogin,
                      controller: loginNameController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          fontFamily: "WorkSansSemiBold",
                          fontSize: 16.0,
                          color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          FontAwesomeIcons.user,
                          color: Colors.black,
                          size: 22.0,
                        ),
                        hintText: "Name",
                        hintStyle: TextStyle(
                            fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                      ),
                    ),
                  ),
                  Container(
                    width: 250.0,
                    height: 1.0,
                    color: Colors.grey[400],
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 0)),
                            Icon(
                              FontAwesomeIcons.solidHeart,
                              color: Colors.black,
                              size: 22.0,
                            ),
                            Padding(padding: EdgeInsets.only(left: 20)),
                            DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    value: _value,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text("A+"),
                                        value: 1,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("A-"),
                                        value: 2,
                                      ),
                                      DropdownMenuItem(
                                          child: Text("B+"), value: 3),
                                      DropdownMenuItem(
                                          child: Text("B-"), value: 4),
                                      DropdownMenuItem(
                                          child: Text("O+"), value: 5),
                                      DropdownMenuItem(
                                          child: Text("O-"), value: 6),
                                      DropdownMenuItem(
                                          child: Text("AB+"), value: 7),
                                      DropdownMenuItem(
                                          child: Text("AB-"), value: 8),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        _value = value;
                                        // getter(_value);
                                      });
                                    })),
                          ])),
                  Container(
                    width: 250.0,
                    height: 1.0,
                    color: Colors.grey[400],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
                    child: TextField(
                      focusNode: myFocusNodeLocationLogin,
                      controller: loginLocationController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          fontFamily: "WorkSansSemiBold",
                          fontSize: 16.0,
                          color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          FontAwesomeIcons.locationArrow,
                          color: Colors.black,
                          size: 22.0,
                        ),
                        hintText: "Location",
                        hintStyle: TextStyle(
                            fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: MaterialButton(
                      child: Text(
                        "                                   Get Location",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        print("Hii");
                      },
                    ),
                  ),
                  //Padding(padding: EdgeInsets.only(bottom: 15.0)),
                  Container(
                    width: 250.0,
                    height: 1.0,
                    color: Colors.grey[400],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                    child: TextField(
                      focusNode: myFocusNodeEmailLogin,
                      controller: loginEmailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                          fontFamily: "WorkSansSemiBold",
                          fontSize: 16.0,
                          color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          FontAwesomeIcons.envelope,
                          color: Colors.black,
                          size: 22.0,
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(
                            fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                      ),
                    ),
                  ),
                  Container(
                    width: 250.0,
                    height: 1.0,
                    color: Colors.grey[400],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                    child: TextField(
                      focusNode: myFocusNodePasswordLogin,
                      controller: loginPasswordController,
                      obscureText: _obscureTextLogin,
                      style: TextStyle(
                          fontFamily: "WorkSansSemiBold",
                          fontSize: 16.0,
                          color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          FontAwesomeIcons.lock,
                          size: 22.0,
                          color: Colors.black,
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(
                            fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                        suffixIcon: GestureDetector(
                          onTap: () => setState(() {
                            _obscureTextLogin = !_obscureTextLogin;
                          }),
                          child: Icon(
                            _obscureTextLogin
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            size: 15.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(bottom: 18)),
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
                        vertical: 10.0, horizontal: 80.0),
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: "WorkSansBold"),
                    ),
                  ),
                  onPressed: () => {
                        registerUser(),
                      })),
          Padding(padding: const EdgeInsets.only(bottom: 30)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text("Already have an Account ?"),
            new FlatButton(
                child: new Text(
                  "Sign In",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ])
        ])));
  }

  void popmessage(BuildContext context) {}

  void registerUser() async {
    String blood;
    switch (_value) {
      case 1:
        {
          blood = "A+";
          break;
        }
      case 2:
        {
          blood = "A-";
          break;
        }
      case 3:
        {
          blood = "B+";
          break;
        }
      case 4:
        {
          blood = "B-";
          break;
        }
      case 5:
        {
          blood = "O+";
          break;
        }
      case 6:
        {
          blood = "O-";
          break;
        }
      case 7:
        {
          blood = "AB+";
          break;
        }
      case 8:
        {
          blood = "AB-";
          break;
        }
    }
    var data = {
      "name": loginNameController.text,
      "email": loginEmailController.text,
      "bld_grp": blood,
      "location": loginLocationController.text,
    };
    String msg;
    dynamic result = await _auth.registerWithEmailAndPassword(
        loginEmailController.text, loginPasswordController.text);
    if (result.uid != null) {
      var _firebaseRef =
          FirebaseDatabase().reference().child(result.uid).child("user-info");

      await _firebaseRef.push().set(data);
      Navigator.of(context).pop();
    }
  }
}
