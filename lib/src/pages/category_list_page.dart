import 'package:flutter/material.dart';
import 'package:moor_puro/src/database.dart';
import 'package:moor_puro/src/pages/category_add_page.dart';
import 'package:moor_puro/src/repositories/category_repository.dart';

class CategoryListPage extends StatefulWidget {
  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  final repository = CategoryRepository(MyDatabase.instance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category List"),
      ),
      body: StreamBuilder<List<Category>>(
        // stream: MyDatabase.instance.categoryRepository.getAllEntities(),
        stream: repository.getAllEntities(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();

          List<Category> categories = snapshot.data;

          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 8.0,
                    ),
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                            right: 12.0,
                            left: 10.0,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            child: Text(
                              "${categories[index].id}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    title: Text(
                      "${categories[index].title}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      size: 30.0,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryAddPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
