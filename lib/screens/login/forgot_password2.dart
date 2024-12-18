import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:travelguide/global/styles.dart';
import 'package:travelguide/global/validation.dart';
import 'package:travelguide/screens/login/login_view2.dart';

class ForgotPassword2 extends StatefulWidget {
  const ForgotPassword2({Key? key}) : super(key: key);

  @override
  ForgotPassword2State createState() => ForgotPassword2State();
}

class ForgotPassword2State extends State<ForgotPassword2> with ValidationMixin {
  String email = "";

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
                    'forgot_password'.tr(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  emailField(validateEmail, (String value) {
                    email = value.trim();
                  }),
                  Padding(
                      padding: EdgeInsets.only(top: h / 10, bottom: 20),
                      child: submitButton(() {
                        successAlert(context: context);
                      }, w)),
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
      child: Text('send'.tr()));
}

Future<void> successAlert({required BuildContext context}) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  "success".tr(),
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              const Icon(
                Icons.check_circle,
                color: Color(0xFF1ce860),
                size: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: kBlue,
                    minimumSize: const Size(160, 40),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const LoginView2()),
                        (r) => false);
                  },
                  child: Text(
                    'back_to_login'.tr(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
