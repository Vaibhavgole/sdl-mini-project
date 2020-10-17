import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:pro1/database/auth.dart';
import 'package:pro1/donor/donor_regis.dart';
import '../theme.dart' as Theme;

class Donorlogin extends StatefulWidget {
  @override
  DonorloginState createState() => DonorloginState();
}

class DonorloginState extends State<Donorlogin>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();
  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();
  bool _obscureTextLogin = true;

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Donor Login", style: TextStyle(fontSize: 20)),
            backgroundColor: Color(0xFFf7418c)),
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(padding: const EdgeInsets.only(bottom: 60)),
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
          Card(
            elevation: 2.0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              width: 300.0,
              height: 180.0,
              child: Column(
                children: <Widget>[
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
                      "Login",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: "WorkSansBold"),
                    ),
                  ),
                  onPressed: () => {userSignIn()})),
          Padding(padding: const EdgeInsets.only(bottom: 30)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text("Don't have an Account ?"),
            new FlatButton(
                child: new Text(
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DonorRegis()));
                })
          ]),
          Padding(padding: const EdgeInsets.only(bottom: 30)),
        ])));
  }

  void userSignIn() async {
    if (loginEmailController.text != null &&
        loginPasswordController.text != null) {
      dynamic result = await _auth.signInWithEmailAndPassword(
          loginEmailController.text, loginPasswordController.text);
    }
  }
}
/*

Future<List> getdata() async {
      var url = 'http://192.168.43.75/dashboard/php_files/getdata.php';
      var data = {
        "email": loginEmailController.text,
        "password": loginPasswordController.text,
      };
      var res = await http.post(url, body: data);
      return json.decode(res.body);
    }


      FutureBuilder<info>(
          future: userdata,
          builder: (context, snapshot) {}
)

   Future<info> userdata;
    @override
    void initState() {
      super.initState();
      userdata = getdata() as Future<info>;
    }



class info {
  final String email;
  final String blood_group;
  final String location;
  final String password;
  final String name;

  info({this.email, this.blood_group, this.location, this.password, this.name});
  factory info.fromJson(Map<String, dynamic> json) {
    return info(
      email: json['email'],
      blood_group: json['bld_grp'],
      location: json['location'],
      name: json['name'],
      password: json['password'],
    );
  }
}
*/
