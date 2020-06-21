import 'package:flutter/material.dart';
import 'package:travelguide/components/attractions/attraction-card.dart';

class AttractionListView extends StatefulWidget {
  final List data;
  final String title;

  AttractionListView({this.data, this.title});
  @override
  _AttractionListViewState createState() => _AttractionListViewState();
}

class _AttractionListViewState extends State<AttractionListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          itemCount: widget.data.length,
          gridDelegate:
           SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
        itemBuilder: (context, index) {
          return attractionCard(
              context, "assets/" + widget.data[index].image, widget.data[index].name, widget.data[index].country, widget.data[index].detail);
        },)
    );
  }
}
