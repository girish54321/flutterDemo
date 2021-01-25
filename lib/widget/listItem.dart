import 'package:flutter/material.dart';
import 'package:FlutterDemo/style/theme.dart' as Style;

class ListItem extends StatelessWidget {
  final String title;
  final String shortDescription;
  final String imageUrl;
  final int collectedValue;
  final int totalValue;
  final String startDate;
  final String endDate;
  const ListItem(
      {Key key,
      @required this.title,
      @required this.shortDescription,
      @required this.imageUrl,
      @required this.collectedValue,
      @required this.totalValue,
      @required this.startDate,
      @required this.endDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget itemText(text) {
      return Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
      );
    }

    Widget itemTextMoney(text) {
      return Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      );
    }

    Widget verticalItem(String title, String subTitle) {
      return Container(
          padding: EdgeInsets.only(top: 46),
          margin: EdgeInsets.all(14.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            itemTextMoney(title),
            SizedBox(
              height: 14,
            ),
            itemText(subTitle)
          ]));
    }

    Widget pledgeText() {
      return Container(
          margin: EdgeInsets.only(top: 26.0, left: 18.0, right: 18),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            "PLEDGE",
            style: TextStyle(
                color: Colors.teal, fontSize: 16, fontWeight: FontWeight.bold),
          ));
    }

    return Stack(
      children: [
        Container(
          child: Column(
            children: [
              Container(
                height: 190,
                width: double.infinity,
                child: Image.network(
                  //IMAGE WAS NOT LOADING
                  "https://images.unsplash.com/photo-1602867649819-ccbf3c0e2b9a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 140,
                color: Style.Colors.bgColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalItem("₹ " + collectedValue.toString(), "FUNDED"),
                    verticalItem("₹ " + totalValue.toString(), "GOALS"),
                    verticalItem("50", "ENDS IN"),
                    pledgeText()
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 88,
          left: 1,
          right: 1,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 100,
                  margin: EdgeInsets.all(12),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18))),
                            IconButton(
                                icon: Icon(Icons.favorite, color: Colors.red),
                                onPressed: null)
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: Text(shortDescription))
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 66,
                width: 66,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    color: Colors.teal[900], shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    "60%",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
