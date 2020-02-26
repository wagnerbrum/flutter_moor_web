import 'package:moor/moor_web.dart';

import 'main.dart';

Database constructDb({bool logStatements = false}) {
  return Database(WebDatabase('db', logStatements: logStatements));
}
