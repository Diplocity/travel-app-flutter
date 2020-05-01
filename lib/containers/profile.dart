import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: width,
                    height: height / 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(40.0)),
                        image: DecorationImage(
                            image: AssetImage('assets/img005.jpg'),
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.8), BlendMode.dstATop),
                            fit: BoxFit.cover)),
                  ),
                  Center(
                    child: Container(
                      width: width / 2.6,
                      height: width / 2.6,
                      margin: EdgeInsets.only(top: height / 8),
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:  BorderRadius.circular(100.0),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 30.0,
                        backgroundImage: AssetImage('assets/avatar.jpg'),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
