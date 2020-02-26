import 'package:flutter/material.dart';
import 'package:moor_puro/src/database.dart';

class CategoryAddPage extends StatefulWidget {
  @override
  _CategoryAddPageState createState() => _CategoryAddPageState();
}

class _CategoryAddPageState extends State<CategoryAddPage> {
  Category entity = Category(
    id: null,
    title: null,
  );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category Add"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Title",
                  ),
                  onSaved: (value) {
                    entity = entity.copyWith(title: value);
                  },
                ),
                Container(height: 10),
                RaisedButton(
                  onPressed: () async {
                    _formKey.currentState.save();
                    await MyDatabase.instance.categoryRepository
                        .createEntity(entity);

                    Navigator.pop(context);
                  },
                  child: Text("Save Category"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
