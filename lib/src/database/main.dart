import 'package:flutter/foundation.dart';
import 'package:moor/moor.dart';
import 'package:moor_puro/src/tables/category_table.dart';
import 'package:moor_puro/src/tables/post_table.dart';

part 'main.g.dart';

@UseMoor(tables: [CategoryTable, PostTable])
class Database extends _$Database {
  Database(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
