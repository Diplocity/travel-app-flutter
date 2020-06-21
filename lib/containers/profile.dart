import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:travelguide/models/friend.dart';
import 'package:travelguide/providers/friend_provider.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key key}) : super(key: key);
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final frMdl = Provider.of<FriendProvider>(context, listen: false);

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
                        image: DecorationImage(
                            image: AssetImage('assets/img005.jpg'),
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.8),
                                BlendMode.dstATop),
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
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 30.0,
                        backgroundImage: AssetImage('assets/avatar.jpg'),
                      ),
                    ),
                  )
                ],
              ),
              nameDetails(),
              buttonRow(width),
              friendsRow(frMdl.friends)
            ],
          ),
        ),
      ),
    );
  }
}

Widget nameDetails() {
  return Container(
    margin: EdgeInsets.only(bottom: 15),
    child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 4),
          child: Text(
            'Rachel Green',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Text('rachel@example.com'),
      ],
    ),
  );
}

Widget buttonRow(w) {
  return Container(
    width: w / 1.8,
    child: Row(
      children: <Widget>[
        Expanded(
            child: Container(
          child: Icon(FeatherIcons.bell),
        )),
        Expanded(
            child: Container(
          child: Icon(FeatherIcons.heart),
        )),
        Expanded(
            child: Container(
          child: Icon(FeatherIcons.image),
        )),
        Expanded(
            child: Container(
          child: Icon(FeatherIcons.users),
        )),
      ],
    ),
  );
}


Widget friendsRow(data){
  return Container(
    margin: EdgeInsets.only(top: 30),
    height: 200,
child: ListView.builder(
  itemCount: data.length,
  scrollDirection: Axis.horizontal,
  itemBuilder: (context, index) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: friendView(
         data[index].name, data[index].image
    ));
  },
),
  );
}

Widget friendView(String name, String img){
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          width: 80,
          height: 80,
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 30.0,
            backgroundImage: AssetImage('assets/' + img),
          ),
        ),
        Container(
          child: Text(name),
        )
      ],
    )
  );
}