import 'package:fillsa_flutter/data/local/local_quote_info_dao.dart';
import 'package:floor/floor.dart';

import 'local_quote_info_entity.dart';

part 'local_database.g.dart';

@Database(version: 1, entities: [LocalQuoteInfoEntity])
abstract class LocalDatabase extends FloorDatabase {
  LocalQuoteInfoDao get infoDao;
}
