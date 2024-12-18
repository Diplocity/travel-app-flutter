import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:travelguide/global/styles.dart';
import 'package:travelguide/global/validation.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:travelguide/screens/login/forgot_password2.dart';
import 'package:travelguide/screens/tab_navigation_view.dart';

class LoginView2 extends StatefulWidget {
  const LoginView2({Key? key}) : super(key: key);

  @override
  LoginView2State createState() => LoginView2State();
}

class LoginView2State extends State<LoginView2> with ValidationMixin {
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
        // color: Colors.black,
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
            constraints: BoxConstraints(minHeight: h, minWidth: w),
            child: Padding(
              padding: EdgeInsets.only(top: h / 8, left: 50, right: 50),
              child: Column(
                children: <Widget>[
                  Text(
                    'sign_in'.tr(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword2()),
                        );
                      },
                      child: Text(
                        'forgot_password'.tr(),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SignInButton(
                          Buttons.Google,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SignInButton(
                          Buttons.Facebook,
                          onPressed: () {},
                        ),
                      ),
                    ],
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
          suffixIcon: const Icon(
            Icons.alternate_email,
            size: 20.0,
          ),
          labelText: 'email'.tr(),
          hintText: 'email@example.com'),
      validator: (value) {
        validateEmail();
        return null;
      },
      onSaved: (String? string) {
        onSaved();
      });
}

Widget passwordField(validatePassword, onSaved, obscureText, suffix) {
  return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffix,
        labelText: 'password'.tr(),
      ),
      validator: (value) {
        validatePassword();
        return null;
      },
      onSaved: (String? string) {
        onSaved();
      });
}

Widget submitButton(onPressed, w) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 4.0,
        backgroundColor: kBlue,
        minimumSize: Size(w, 46),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(1.0)),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        'login'.tr(),
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ));
}
