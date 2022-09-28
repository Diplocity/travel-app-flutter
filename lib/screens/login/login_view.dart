import 'package:flutter/material.dart';
import 'package:travelguide/global/validation.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:travelguide/screens/tab_navigation_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> with ValidationMixin {
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
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: ConstrainedBox(
            constraints:  BoxConstraints(minHeight: h, minWidth: w),
            child: Container(
              padding: EdgeInsets.only(top: h / 6, left: 50, right: 50),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const AssetImage('assets/login/login2.jpg'),
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
                  Padding(
                      padding: EdgeInsets.only(top: h / 10, bottom: 20),
                      child: submitButton(() {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const TabNavigationView()),
                            (r) => false);
                      }, w)),
                  Padding(
                    padding: EdgeInsets.only(top: 12, bottom: h / 6),
                    child: InkWell(
                      onTap: () {},
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SignInButton(
                    Buttons.Google,
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SignInButton(
                    Buttons.Facebook,
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(horizontal: 22),
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
      decoration: const InputDecoration(
          suffixIcon: Icon(
            Icons.alternate_email,
            size: 20.0,
            color: Colors.black,
          ),
          labelText: 'Email',
          labelStyle: TextStyle(color: Colors.black),
          hintText: 'youremail@example.com'),
      validator: (value) {
        validateEmail();
        return null;
      },
      onSaved: (String? string){
        onSaved();
      });
}

Widget passwordField(validatePassword, onSaved, obscureText, suffix) {
  return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffix,
        labelText: 'Password',
        labelStyle: const TextStyle(color: Colors.black),
      ),
      validator: (value){
        validatePassword();
        return null;
      },
      onSaved: (String? string){
        onSaved();
      });
}

Widget submitButton(onPressed, w) {
  return ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 4.0,
            minimumSize: Size(w, 36),
            textStyle: const TextStyle(color: Colors.black),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(1.0)),
            ),
          ),
          onPressed: onPressed,
          child: const Text('Login'));
}
