import 'package:FlutterDemo/bloc/get_testdata_bloc.dart';
import 'package:FlutterDemo/model/Records.dart';
import 'package:FlutterDemo/widget/listItem.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget buildSuggestions(BuildContext context) {
    testDataBloc..getTestDart();
    return StreamBuilder<List<Record>>(
        stream: testDataBloc.subject.stream,
        builder: (context, AsyncSnapshot<List<Record>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null) {
              return errorView("Error 1");
            } else {
              return listWidget(snapshot.data);
            }
          } else if (snapshot.hasError) {
            return errorView("Error 2");
          } else {
            return loadingView();
          }
        });
  }

  Widget errorView(String errorText) {
    return Center(child: Text(errorText));
  }

  Widget loadingView() {
    return Center(child: CircularProgressIndicator());
  }

  Widget listWidget(List<Record> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          var item = data[index];
          return ListItem(
              title: item.title,
              shortDescription: item.shortDescription,
              imageUrl: item.mainImageUrl,
              collectedValue: item.collectedValue,
              totalValue: item.totalValue,
              endDate: item.endDate,
              startDate: item.startDate);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Record List",
          style: TextStyle(fontSize: 34),
        ),
        backgroundColor: Colors.black,
      ),
      body: buildSuggestions(context),
    );
  }
}
