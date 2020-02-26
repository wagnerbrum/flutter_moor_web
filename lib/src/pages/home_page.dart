import 'package:flutter/material.dart';
import 'package:moor_puro/src/database/shared.dart';
import 'package:moor_puro/src/pages/category_list_page.dart';

class HomePage extends StatefulWidget {
  var db;

  HomePage({Key key}) : super(key: key) {
    this.db = constructDb();
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text(
                  "List Category",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CategoryListPage(db: this.widget.db),
                    ),
                  );
                },
              ),
              SizedBox(height: 30),
              RaisedButton(
                child: Text(
                  "List Post",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
