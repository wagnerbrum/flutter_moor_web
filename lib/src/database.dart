// import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:moor/moor.dart';
import 'package:moor_puro/src/repositories/category_repository.dart';
import 'package:moor_puro/src/tables/category_table.dart';
import 'package:moor_puro/src/tables/post_table.dart';

// MOOR MOBILE
// import 'package:moor_ffi/moor_ffi.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;

// MOOR WEB
import 'package:moor/moor_web.dart';

part 'database.g.dart';

@UseMoor(tables: [PostTable, CategoryTable])
class MyDatabase extends _$MyDatabase {
  static MyDatabase instance = MyDatabase._internal();

  CategoryRepository categoryRepository;

  MyDatabase._internal() : super(_openConnection()) {
    categoryRepository = CategoryRepository(this);
    print(kIsWeb);
  }

  static _openConnection() {
    return WebDatabase('db');
  }

  // static LazyDatabase _openConnection() {
  //   return LazyDatabase(() async {
  //     final dbFolder = await getApplicationDocumentsDirectory();
  //     final file = File(p.join(dbFolder.path, 'db.sqlite'));
  //     return VmDatabase(file);
  //   });
  // }

  @override
  int get schemaVersion => 1;
}
