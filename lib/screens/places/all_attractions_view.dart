import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelguide/providers/attraction_provider.dart';
import 'package:travelguide/screens/places/attraction_list.dart';
import 'package:travelguide/widgets/attractions/attraction_card.dart';

class AllAttractionsView extends StatefulWidget {
  const AllAttractionsView({Key? key}) : super(key: key);

  @override
  AllAttractionsViewState createState() => AllAttractionsViewState();
}

class AllAttractionsViewState extends State<AllAttractionsView> {
  @override
  void initState() {
    super.initState();
  }

  _navigateAttractionList(data, title) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AttractionListView(data: data, title: title)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final attProvider = Provider.of<AttractionProvider>(context);

    return Scaffold(
      body: ListView.builder(
        itemCount: attProvider.attractionList.length,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        itemBuilder: (context, index) {
          return attractionSection(
              attProvider.attractionList[index].attractions,
              attProvider.attractionList[index].category);
        },
      ),
    );
  }

  Widget attractionSection(data, String title) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            _navigateAttractionList(data, title);
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 18, bottom: 18, left: 5),
                  child: Text(
                    title,
                    style:
                        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Expanded(
                  flex: 0,
                  child: Icon(Icons.arrow_forward)),
            ],
          ),
        ),
        SizedBox(
            height: 170,
            child: ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 190,
                  margin: const EdgeInsets.only(right: 8),
                  child: AttractionCard(
                      img: "assets/${data[index].image}",
                      name: data[index].name,
                      country: data[index].country,
                      detail: data[index].detail),
                );
              },
            ))
      ],
    );
  }
}
