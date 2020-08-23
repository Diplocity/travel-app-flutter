import 'package:flutter/material.dart';
import 'package:travelguide/global/validation.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:travelguide/screens/tab-navigation-view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with ValidationMixin {
  String email = "";
  String password = "";
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget suffix() {
    return InkWell(
      onTap: () {
        _toggle();
      },
      child: Icon(
        _obscureText ? Icons.visibility_off : Icons.visibility,
        size: 20.0,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: SingleChildScrollView(
        child: ConstrainedBox(
            constraints: new BoxConstraints(minHeight: h, minWidth: w),
            child: Container(
              padding: EdgeInsets.only(top: h / 6, left: 50, right: 50),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/login/login2.jpg'),
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(.95), BlendMode.dstATop),
                      fit: BoxFit.cover)),
              child: Column(
                children: <Widget>[
                  emailField(validateEmail, (String value) {
                    email = value.trim();
                  }),
                  passwordField(validatePassword, (String value) {
                    password = value;
                  }, _obscureText, suffix()),
                  Container(
                      margin: EdgeInsets.only(top: h / 10, bottom: 20),
                      child: submitButton(() {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    TabNavigationView()),
                            (r) => false);
                      }, w)),
                  Container(
                    margin: EdgeInsets.only(top: 12, bottom: h / 6),
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SignInButton(
                    Buttons.Google,
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(horizontal: 22),
                  ),
                  Container(
                    height: 12,
                  ),
                  SignInButton(
                    Buttons.Facebook,
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(horizontal: 22),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

Widget emailField(validateEmail, onSaved) {
  return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.alternate_email,
            size: 20.0,
            color: Colors.black,
          ),
          labelText: 'Email',
          labelStyle: TextStyle(color: Colors.black),
          hintText: 'youremail@example.com'),
      validator: validateEmail,
      onSaved: onSaved);
}

Widget passwordField(validatePassword, onSaved, obscureText, suffix) {
  return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffix,
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.black),
      ),
      validator: validatePassword,
      onSaved: onSaved);
}

Widget submitButton(onPressed, w) {
  return ButtonTheme(
      minWidth: w,
      height: 36,
      child: RaisedButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(1.0)),
          elevation: 4.0,
          color: Colors.white,
          textColor: Colors.black,
          child: Text('Login'),
          onPressed: onPressed));
}
