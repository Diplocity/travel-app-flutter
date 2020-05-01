import 'package:flutter/material.dart';
import 'package:travelguide/components/attractions/attraction-card.dart';
import 'package:travelguide/containers/places/attraction-list.dart';

class AllAttractionsView extends StatefulWidget {
  @override
  _AllAttractionsViewState createState() => _AllAttractionsViewState();
}

class _AllAttractionsViewState extends State<AllAttractionsView> {

  navigateAttractionList(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AttractionListView()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 30, bottom: 20, left: 8, right: 8),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'All Attractions',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              attractionSection('Nature'),
              attractionSection('Religous'),
              attractionSection('History'),
            ],
          ),
        ),
      ),
    );
  }

  Widget attractionSection(String title) {
    return Container(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: navigateAttractionList,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(top: 18, bottom: 18, left: 5),
                    child: Text(
                      title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                    flex: 0,
                    child: Container(
                      child: Icon(Icons.arrow_forward),
                    )),
              ],
            ),
          ),
          Container(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  attractionCard(
                      'assets/img001.jpg', 'Place 1', "abcdefhjjhkjhsd"),
                  attractionCard(
                      'assets/img002.jpg', 'Place 1', "abcdefhjjhkjhsd"),
                  attractionCard(
                      'assets/img003.jpg', 'Place 1', "abcdefhjjhkjhsd"),
                  attractionCard(
                      'assets/img004.jpg', 'Place 1', "abcdefhjjhkjhsd"),
                  attractionCard(
                      'assets/img005.jpg', 'Place 1', "abcdefhjjhkjhsd"),
                ],
              ))
        ],
      ),
    );
  }
}
