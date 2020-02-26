import 'package:moor/moor.dart';
import 'package:moor_puro/src/database.dart';
import 'package:moor_puro/src/tables/category_table.dart';

part 'category_repository.g.dart';

@UseDao(tables: [CategoryTable])
class CategoryRepository extends DatabaseAccessor<MyDatabase>
    with _$CategoryRepositoryMixin {
  CategoryRepository(MyDatabase db) : super(db);

  Stream<List<Category>> getAllEntities() {
    return (select(categoryTable).watch());
  }

  Future createEntity(Category entity) {
    return into(categoryTable).insert(entity);
  }

  Future updateEntity(Category entity) {
    return update(categoryTable).replace(entity);
  }

  Future removeEntity(id) {
    return (delete(categoryTable)..where((cat) => cat.id.equals(id))).go();
  }
}
