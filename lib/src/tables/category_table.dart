import 'package:moor/moor.dart';

@DataClassName('Category')
class CategoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
}
