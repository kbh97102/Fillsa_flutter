import 'package:drift/drift.dart';

class StreakInfoEntity extends Table {
  TextColumn get date => text()();
  IntColumn get streakDateCount => integer()();
  BoolColumn get isDailyWritingCompleted => boolean()();

  @override
  String get tableName => 'streak_info';

  @override
  Set<Column> get primaryKey => {date};
}
