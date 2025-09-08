// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// ignore_for_file: type=lint
class $LocalQuoteInfoEntityTable extends LocalQuoteInfoEntity
    with TableInfo<$LocalQuoteInfoEntityTable, LocalQuoteInfoEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalQuoteInfoEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dailyQuoteSeqMeta = const VerificationMeta(
    'dailyQuoteSeq',
  );
  @override
  late final GeneratedColumn<int> dailyQuoteSeq = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _korQuoteMeta = const VerificationMeta(
    'korQuote',
  );
  @override
  late final GeneratedColumn<String> korQuote = GeneratedColumn<String>(
    'kor_quote',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _engQuoteMeta = const VerificationMeta(
    'engQuote',
  );
  @override
  late final GeneratedColumn<String> engQuote = GeneratedColumn<String>(
    'eng_quote',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _korAuthorMeta = const VerificationMeta(
    'korAuthor',
  );
  @override
  late final GeneratedColumn<String> korAuthor = GeneratedColumn<String>(
    'kor_author',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _engAuthorMeta = const VerificationMeta(
    'engAuthor',
  );
  @override
  late final GeneratedColumn<String> engAuthor = GeneratedColumn<String>(
    'eng_author',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _korTypingMeta = const VerificationMeta(
    'korTyping',
  );
  @override
  late final GeneratedColumn<String> korTyping = GeneratedColumn<String>(
    'kor_typing',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _engTypingMeta = const VerificationMeta(
    'engTyping',
  );
  @override
  late final GeneratedColumn<String> engTyping = GeneratedColumn<String>(
    'eng_typing',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _likeYnMeta = const VerificationMeta('likeYn');
  @override
  late final GeneratedColumn<String> likeYn = GeneratedColumn<String>(
    'like_yn',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String> memo = GeneratedColumn<String>(
    'memo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dayOfWeekMeta = const VerificationMeta(
    'dayOfWeek',
  );
  @override
  late final GeneratedColumn<String> dayOfWeek = GeneratedColumn<String>(
    'day_of_week',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    dailyQuoteSeq,
    korQuote,
    engQuote,
    korAuthor,
    engAuthor,
    korTyping,
    engTyping,
    likeYn,
    memo,
    date,
    dayOfWeek,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quoteInfo';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalQuoteInfoEntityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(
        _dailyQuoteSeqMeta,
        dailyQuoteSeq.isAcceptableOrUnknown(data['id']!, _dailyQuoteSeqMeta),
      );
    }
    if (data.containsKey('kor_quote')) {
      context.handle(
        _korQuoteMeta,
        korQuote.isAcceptableOrUnknown(data['kor_quote']!, _korQuoteMeta),
      );
    } else if (isInserting) {
      context.missing(_korQuoteMeta);
    }
    if (data.containsKey('eng_quote')) {
      context.handle(
        _engQuoteMeta,
        engQuote.isAcceptableOrUnknown(data['eng_quote']!, _engQuoteMeta),
      );
    } else if (isInserting) {
      context.missing(_engQuoteMeta);
    }
    if (data.containsKey('kor_author')) {
      context.handle(
        _korAuthorMeta,
        korAuthor.isAcceptableOrUnknown(data['kor_author']!, _korAuthorMeta),
      );
    } else if (isInserting) {
      context.missing(_korAuthorMeta);
    }
    if (data.containsKey('eng_author')) {
      context.handle(
        _engAuthorMeta,
        engAuthor.isAcceptableOrUnknown(data['eng_author']!, _engAuthorMeta),
      );
    } else if (isInserting) {
      context.missing(_engAuthorMeta);
    }
    if (data.containsKey('kor_typing')) {
      context.handle(
        _korTypingMeta,
        korTyping.isAcceptableOrUnknown(data['kor_typing']!, _korTypingMeta),
      );
    } else if (isInserting) {
      context.missing(_korTypingMeta);
    }
    if (data.containsKey('eng_typing')) {
      context.handle(
        _engTypingMeta,
        engTyping.isAcceptableOrUnknown(data['eng_typing']!, _engTypingMeta),
      );
    } else if (isInserting) {
      context.missing(_engTypingMeta);
    }
    if (data.containsKey('like_yn')) {
      context.handle(
        _likeYnMeta,
        likeYn.isAcceptableOrUnknown(data['like_yn']!, _likeYnMeta),
      );
    } else if (isInserting) {
      context.missing(_likeYnMeta);
    }
    if (data.containsKey('memo')) {
      context.handle(
        _memoMeta,
        memo.isAcceptableOrUnknown(data['memo']!, _memoMeta),
      );
    } else if (isInserting) {
      context.missing(_memoMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('day_of_week')) {
      context.handle(
        _dayOfWeekMeta,
        dayOfWeek.isAcceptableOrUnknown(data['day_of_week']!, _dayOfWeekMeta),
      );
    } else if (isInserting) {
      context.missing(_dayOfWeekMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {dailyQuoteSeq};
  @override
  LocalQuoteInfoEntityData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalQuoteInfoEntityData(
      dailyQuoteSeq: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      korQuote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kor_quote'],
      )!,
      engQuote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}eng_quote'],
      )!,
      korAuthor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kor_author'],
      )!,
      engAuthor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}eng_author'],
      )!,
      korTyping: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kor_typing'],
      )!,
      engTyping: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}eng_typing'],
      )!,
      likeYn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}like_yn'],
      )!,
      memo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}memo'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      dayOfWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}day_of_week'],
      )!,
    );
  }

  @override
  $LocalQuoteInfoEntityTable createAlias(String alias) {
    return $LocalQuoteInfoEntityTable(attachedDatabase, alias);
  }
}

class LocalQuoteInfoEntityData extends DataClass
    implements Insertable<LocalQuoteInfoEntityData> {
  final int dailyQuoteSeq;
  final String korQuote;
  final String engQuote;
  final String korAuthor;
  final String engAuthor;
  final String korTyping;
  final String engTyping;
  final String likeYn;
  final String memo;
  final String date;
  final String dayOfWeek;
  const LocalQuoteInfoEntityData({
    required this.dailyQuoteSeq,
    required this.korQuote,
    required this.engQuote,
    required this.korAuthor,
    required this.engAuthor,
    required this.korTyping,
    required this.engTyping,
    required this.likeYn,
    required this.memo,
    required this.date,
    required this.dayOfWeek,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(dailyQuoteSeq);
    map['kor_quote'] = Variable<String>(korQuote);
    map['eng_quote'] = Variable<String>(engQuote);
    map['kor_author'] = Variable<String>(korAuthor);
    map['eng_author'] = Variable<String>(engAuthor);
    map['kor_typing'] = Variable<String>(korTyping);
    map['eng_typing'] = Variable<String>(engTyping);
    map['like_yn'] = Variable<String>(likeYn);
    map['memo'] = Variable<String>(memo);
    map['date'] = Variable<String>(date);
    map['day_of_week'] = Variable<String>(dayOfWeek);
    return map;
  }

  LocalQuoteInfoEntityCompanion toCompanion(bool nullToAbsent) {
    return LocalQuoteInfoEntityCompanion(
      dailyQuoteSeq: Value(dailyQuoteSeq),
      korQuote: Value(korQuote),
      engQuote: Value(engQuote),
      korAuthor: Value(korAuthor),
      engAuthor: Value(engAuthor),
      korTyping: Value(korTyping),
      engTyping: Value(engTyping),
      likeYn: Value(likeYn),
      memo: Value(memo),
      date: Value(date),
      dayOfWeek: Value(dayOfWeek),
    );
  }

  factory LocalQuoteInfoEntityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalQuoteInfoEntityData(
      dailyQuoteSeq: serializer.fromJson<int>(json['dailyQuoteSeq']),
      korQuote: serializer.fromJson<String>(json['korQuote']),
      engQuote: serializer.fromJson<String>(json['engQuote']),
      korAuthor: serializer.fromJson<String>(json['korAuthor']),
      engAuthor: serializer.fromJson<String>(json['engAuthor']),
      korTyping: serializer.fromJson<String>(json['korTyping']),
      engTyping: serializer.fromJson<String>(json['engTyping']),
      likeYn: serializer.fromJson<String>(json['likeYn']),
      memo: serializer.fromJson<String>(json['memo']),
      date: serializer.fromJson<String>(json['date']),
      dayOfWeek: serializer.fromJson<String>(json['dayOfWeek']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dailyQuoteSeq': serializer.toJson<int>(dailyQuoteSeq),
      'korQuote': serializer.toJson<String>(korQuote),
      'engQuote': serializer.toJson<String>(engQuote),
      'korAuthor': serializer.toJson<String>(korAuthor),
      'engAuthor': serializer.toJson<String>(engAuthor),
      'korTyping': serializer.toJson<String>(korTyping),
      'engTyping': serializer.toJson<String>(engTyping),
      'likeYn': serializer.toJson<String>(likeYn),
      'memo': serializer.toJson<String>(memo),
      'date': serializer.toJson<String>(date),
      'dayOfWeek': serializer.toJson<String>(dayOfWeek),
    };
  }

  LocalQuoteInfoEntityData copyWith({
    int? dailyQuoteSeq,
    String? korQuote,
    String? engQuote,
    String? korAuthor,
    String? engAuthor,
    String? korTyping,
    String? engTyping,
    String? likeYn,
    String? memo,
    String? date,
    String? dayOfWeek,
  }) => LocalQuoteInfoEntityData(
    dailyQuoteSeq: dailyQuoteSeq ?? this.dailyQuoteSeq,
    korQuote: korQuote ?? this.korQuote,
    engQuote: engQuote ?? this.engQuote,
    korAuthor: korAuthor ?? this.korAuthor,
    engAuthor: engAuthor ?? this.engAuthor,
    korTyping: korTyping ?? this.korTyping,
    engTyping: engTyping ?? this.engTyping,
    likeYn: likeYn ?? this.likeYn,
    memo: memo ?? this.memo,
    date: date ?? this.date,
    dayOfWeek: dayOfWeek ?? this.dayOfWeek,
  );
  LocalQuoteInfoEntityData copyWithCompanion(
    LocalQuoteInfoEntityCompanion data,
  ) {
    return LocalQuoteInfoEntityData(
      dailyQuoteSeq: data.dailyQuoteSeq.present
          ? data.dailyQuoteSeq.value
          : this.dailyQuoteSeq,
      korQuote: data.korQuote.present ? data.korQuote.value : this.korQuote,
      engQuote: data.engQuote.present ? data.engQuote.value : this.engQuote,
      korAuthor: data.korAuthor.present ? data.korAuthor.value : this.korAuthor,
      engAuthor: data.engAuthor.present ? data.engAuthor.value : this.engAuthor,
      korTyping: data.korTyping.present ? data.korTyping.value : this.korTyping,
      engTyping: data.engTyping.present ? data.engTyping.value : this.engTyping,
      likeYn: data.likeYn.present ? data.likeYn.value : this.likeYn,
      memo: data.memo.present ? data.memo.value : this.memo,
      date: data.date.present ? data.date.value : this.date,
      dayOfWeek: data.dayOfWeek.present ? data.dayOfWeek.value : this.dayOfWeek,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalQuoteInfoEntityData(')
          ..write('dailyQuoteSeq: $dailyQuoteSeq, ')
          ..write('korQuote: $korQuote, ')
          ..write('engQuote: $engQuote, ')
          ..write('korAuthor: $korAuthor, ')
          ..write('engAuthor: $engAuthor, ')
          ..write('korTyping: $korTyping, ')
          ..write('engTyping: $engTyping, ')
          ..write('likeYn: $likeYn, ')
          ..write('memo: $memo, ')
          ..write('date: $date, ')
          ..write('dayOfWeek: $dayOfWeek')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    dailyQuoteSeq,
    korQuote,
    engQuote,
    korAuthor,
    engAuthor,
    korTyping,
    engTyping,
    likeYn,
    memo,
    date,
    dayOfWeek,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalQuoteInfoEntityData &&
          other.dailyQuoteSeq == this.dailyQuoteSeq &&
          other.korQuote == this.korQuote &&
          other.engQuote == this.engQuote &&
          other.korAuthor == this.korAuthor &&
          other.engAuthor == this.engAuthor &&
          other.korTyping == this.korTyping &&
          other.engTyping == this.engTyping &&
          other.likeYn == this.likeYn &&
          other.memo == this.memo &&
          other.date == this.date &&
          other.dayOfWeek == this.dayOfWeek);
}

class LocalQuoteInfoEntityCompanion
    extends UpdateCompanion<LocalQuoteInfoEntityData> {
  final Value<int> dailyQuoteSeq;
  final Value<String> korQuote;
  final Value<String> engQuote;
  final Value<String> korAuthor;
  final Value<String> engAuthor;
  final Value<String> korTyping;
  final Value<String> engTyping;
  final Value<String> likeYn;
  final Value<String> memo;
  final Value<String> date;
  final Value<String> dayOfWeek;
  const LocalQuoteInfoEntityCompanion({
    this.dailyQuoteSeq = const Value.absent(),
    this.korQuote = const Value.absent(),
    this.engQuote = const Value.absent(),
    this.korAuthor = const Value.absent(),
    this.engAuthor = const Value.absent(),
    this.korTyping = const Value.absent(),
    this.engTyping = const Value.absent(),
    this.likeYn = const Value.absent(),
    this.memo = const Value.absent(),
    this.date = const Value.absent(),
    this.dayOfWeek = const Value.absent(),
  });
  LocalQuoteInfoEntityCompanion.insert({
    this.dailyQuoteSeq = const Value.absent(),
    required String korQuote,
    required String engQuote,
    required String korAuthor,
    required String engAuthor,
    required String korTyping,
    required String engTyping,
    required String likeYn,
    required String memo,
    required String date,
    required String dayOfWeek,
  }) : korQuote = Value(korQuote),
       engQuote = Value(engQuote),
       korAuthor = Value(korAuthor),
       engAuthor = Value(engAuthor),
       korTyping = Value(korTyping),
       engTyping = Value(engTyping),
       likeYn = Value(likeYn),
       memo = Value(memo),
       date = Value(date),
       dayOfWeek = Value(dayOfWeek);
  static Insertable<LocalQuoteInfoEntityData> custom({
    Expression<int>? dailyQuoteSeq,
    Expression<String>? korQuote,
    Expression<String>? engQuote,
    Expression<String>? korAuthor,
    Expression<String>? engAuthor,
    Expression<String>? korTyping,
    Expression<String>? engTyping,
    Expression<String>? likeYn,
    Expression<String>? memo,
    Expression<String>? date,
    Expression<String>? dayOfWeek,
  }) {
    return RawValuesInsertable({
      if (dailyQuoteSeq != null) 'id': dailyQuoteSeq,
      if (korQuote != null) 'kor_quote': korQuote,
      if (engQuote != null) 'eng_quote': engQuote,
      if (korAuthor != null) 'kor_author': korAuthor,
      if (engAuthor != null) 'eng_author': engAuthor,
      if (korTyping != null) 'kor_typing': korTyping,
      if (engTyping != null) 'eng_typing': engTyping,
      if (likeYn != null) 'like_yn': likeYn,
      if (memo != null) 'memo': memo,
      if (date != null) 'date': date,
      if (dayOfWeek != null) 'day_of_week': dayOfWeek,
    });
  }

  LocalQuoteInfoEntityCompanion copyWith({
    Value<int>? dailyQuoteSeq,
    Value<String>? korQuote,
    Value<String>? engQuote,
    Value<String>? korAuthor,
    Value<String>? engAuthor,
    Value<String>? korTyping,
    Value<String>? engTyping,
    Value<String>? likeYn,
    Value<String>? memo,
    Value<String>? date,
    Value<String>? dayOfWeek,
  }) {
    return LocalQuoteInfoEntityCompanion(
      dailyQuoteSeq: dailyQuoteSeq ?? this.dailyQuoteSeq,
      korQuote: korQuote ?? this.korQuote,
      engQuote: engQuote ?? this.engQuote,
      korAuthor: korAuthor ?? this.korAuthor,
      engAuthor: engAuthor ?? this.engAuthor,
      korTyping: korTyping ?? this.korTyping,
      engTyping: engTyping ?? this.engTyping,
      likeYn: likeYn ?? this.likeYn,
      memo: memo ?? this.memo,
      date: date ?? this.date,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dailyQuoteSeq.present) {
      map['id'] = Variable<int>(dailyQuoteSeq.value);
    }
    if (korQuote.present) {
      map['kor_quote'] = Variable<String>(korQuote.value);
    }
    if (engQuote.present) {
      map['eng_quote'] = Variable<String>(engQuote.value);
    }
    if (korAuthor.present) {
      map['kor_author'] = Variable<String>(korAuthor.value);
    }
    if (engAuthor.present) {
      map['eng_author'] = Variable<String>(engAuthor.value);
    }
    if (korTyping.present) {
      map['kor_typing'] = Variable<String>(korTyping.value);
    }
    if (engTyping.present) {
      map['eng_typing'] = Variable<String>(engTyping.value);
    }
    if (likeYn.present) {
      map['like_yn'] = Variable<String>(likeYn.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (dayOfWeek.present) {
      map['day_of_week'] = Variable<String>(dayOfWeek.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalQuoteInfoEntityCompanion(')
          ..write('dailyQuoteSeq: $dailyQuoteSeq, ')
          ..write('korQuote: $korQuote, ')
          ..write('engQuote: $engQuote, ')
          ..write('korAuthor: $korAuthor, ')
          ..write('engAuthor: $engAuthor, ')
          ..write('korTyping: $korTyping, ')
          ..write('engTyping: $engTyping, ')
          ..write('likeYn: $likeYn, ')
          ..write('memo: $memo, ')
          ..write('date: $date, ')
          ..write('dayOfWeek: $dayOfWeek')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  $LocalDatabaseManager get managers => $LocalDatabaseManager(this);
  late final $LocalQuoteInfoEntityTable localQuoteInfoEntity =
      $LocalQuoteInfoEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [localQuoteInfoEntity];
}

typedef $$LocalQuoteInfoEntityTableCreateCompanionBuilder =
    LocalQuoteInfoEntityCompanion Function({
      Value<int> dailyQuoteSeq,
      required String korQuote,
      required String engQuote,
      required String korAuthor,
      required String engAuthor,
      required String korTyping,
      required String engTyping,
      required String likeYn,
      required String memo,
      required String date,
      required String dayOfWeek,
    });
typedef $$LocalQuoteInfoEntityTableUpdateCompanionBuilder =
    LocalQuoteInfoEntityCompanion Function({
      Value<int> dailyQuoteSeq,
      Value<String> korQuote,
      Value<String> engQuote,
      Value<String> korAuthor,
      Value<String> engAuthor,
      Value<String> korTyping,
      Value<String> engTyping,
      Value<String> likeYn,
      Value<String> memo,
      Value<String> date,
      Value<String> dayOfWeek,
    });

class $$LocalQuoteInfoEntityTableFilterComposer
    extends Composer<_$LocalDatabase, $LocalQuoteInfoEntityTable> {
  $$LocalQuoteInfoEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get dailyQuoteSeq => $composableBuilder(
    column: $table.dailyQuoteSeq,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get korQuote => $composableBuilder(
    column: $table.korQuote,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get engQuote => $composableBuilder(
    column: $table.engQuote,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get korAuthor => $composableBuilder(
    column: $table.korAuthor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get engAuthor => $composableBuilder(
    column: $table.engAuthor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get korTyping => $composableBuilder(
    column: $table.korTyping,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get engTyping => $composableBuilder(
    column: $table.engTyping,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get likeYn => $composableBuilder(
    column: $table.likeYn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalQuoteInfoEntityTableOrderingComposer
    extends Composer<_$LocalDatabase, $LocalQuoteInfoEntityTable> {
  $$LocalQuoteInfoEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get dailyQuoteSeq => $composableBuilder(
    column: $table.dailyQuoteSeq,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get korQuote => $composableBuilder(
    column: $table.korQuote,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get engQuote => $composableBuilder(
    column: $table.engQuote,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get korAuthor => $composableBuilder(
    column: $table.korAuthor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get engAuthor => $composableBuilder(
    column: $table.engAuthor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get korTyping => $composableBuilder(
    column: $table.korTyping,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get engTyping => $composableBuilder(
    column: $table.engTyping,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get likeYn => $composableBuilder(
    column: $table.likeYn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalQuoteInfoEntityTableAnnotationComposer
    extends Composer<_$LocalDatabase, $LocalQuoteInfoEntityTable> {
  $$LocalQuoteInfoEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get dailyQuoteSeq => $composableBuilder(
    column: $table.dailyQuoteSeq,
    builder: (column) => column,
  );

  GeneratedColumn<String> get korQuote =>
      $composableBuilder(column: $table.korQuote, builder: (column) => column);

  GeneratedColumn<String> get engQuote =>
      $composableBuilder(column: $table.engQuote, builder: (column) => column);

  GeneratedColumn<String> get korAuthor =>
      $composableBuilder(column: $table.korAuthor, builder: (column) => column);

  GeneratedColumn<String> get engAuthor =>
      $composableBuilder(column: $table.engAuthor, builder: (column) => column);

  GeneratedColumn<String> get korTyping =>
      $composableBuilder(column: $table.korTyping, builder: (column) => column);

  GeneratedColumn<String> get engTyping =>
      $composableBuilder(column: $table.engTyping, builder: (column) => column);

  GeneratedColumn<String> get likeYn =>
      $composableBuilder(column: $table.likeYn, builder: (column) => column);

  GeneratedColumn<String> get memo =>
      $composableBuilder(column: $table.memo, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get dayOfWeek =>
      $composableBuilder(column: $table.dayOfWeek, builder: (column) => column);
}

class $$LocalQuoteInfoEntityTableTableManager
    extends
        RootTableManager<
          _$LocalDatabase,
          $LocalQuoteInfoEntityTable,
          LocalQuoteInfoEntityData,
          $$LocalQuoteInfoEntityTableFilterComposer,
          $$LocalQuoteInfoEntityTableOrderingComposer,
          $$LocalQuoteInfoEntityTableAnnotationComposer,
          $$LocalQuoteInfoEntityTableCreateCompanionBuilder,
          $$LocalQuoteInfoEntityTableUpdateCompanionBuilder,
          (
            LocalQuoteInfoEntityData,
            BaseReferences<
              _$LocalDatabase,
              $LocalQuoteInfoEntityTable,
              LocalQuoteInfoEntityData
            >,
          ),
          LocalQuoteInfoEntityData,
          PrefetchHooks Function()
        > {
  $$LocalQuoteInfoEntityTableTableManager(
    _$LocalDatabase db,
    $LocalQuoteInfoEntityTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalQuoteInfoEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalQuoteInfoEntityTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$LocalQuoteInfoEntityTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> dailyQuoteSeq = const Value.absent(),
                Value<String> korQuote = const Value.absent(),
                Value<String> engQuote = const Value.absent(),
                Value<String> korAuthor = const Value.absent(),
                Value<String> engAuthor = const Value.absent(),
                Value<String> korTyping = const Value.absent(),
                Value<String> engTyping = const Value.absent(),
                Value<String> likeYn = const Value.absent(),
                Value<String> memo = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String> dayOfWeek = const Value.absent(),
              }) => LocalQuoteInfoEntityCompanion(
                dailyQuoteSeq: dailyQuoteSeq,
                korQuote: korQuote,
                engQuote: engQuote,
                korAuthor: korAuthor,
                engAuthor: engAuthor,
                korTyping: korTyping,
                engTyping: engTyping,
                likeYn: likeYn,
                memo: memo,
                date: date,
                dayOfWeek: dayOfWeek,
              ),
          createCompanionCallback:
              ({
                Value<int> dailyQuoteSeq = const Value.absent(),
                required String korQuote,
                required String engQuote,
                required String korAuthor,
                required String engAuthor,
                required String korTyping,
                required String engTyping,
                required String likeYn,
                required String memo,
                required String date,
                required String dayOfWeek,
              }) => LocalQuoteInfoEntityCompanion.insert(
                dailyQuoteSeq: dailyQuoteSeq,
                korQuote: korQuote,
                engQuote: engQuote,
                korAuthor: korAuthor,
                engAuthor: engAuthor,
                korTyping: korTyping,
                engTyping: engTyping,
                likeYn: likeYn,
                memo: memo,
                date: date,
                dayOfWeek: dayOfWeek,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalQuoteInfoEntityTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDatabase,
      $LocalQuoteInfoEntityTable,
      LocalQuoteInfoEntityData,
      $$LocalQuoteInfoEntityTableFilterComposer,
      $$LocalQuoteInfoEntityTableOrderingComposer,
      $$LocalQuoteInfoEntityTableAnnotationComposer,
      $$LocalQuoteInfoEntityTableCreateCompanionBuilder,
      $$LocalQuoteInfoEntityTableUpdateCompanionBuilder,
      (
        LocalQuoteInfoEntityData,
        BaseReferences<
          _$LocalDatabase,
          $LocalQuoteInfoEntityTable,
          LocalQuoteInfoEntityData
        >,
      ),
      LocalQuoteInfoEntityData,
      PrefetchHooks Function()
    >;

class $LocalDatabaseManager {
  final _$LocalDatabase _db;
  $LocalDatabaseManager(this._db);
  $$LocalQuoteInfoEntityTableTableManager get localQuoteInfoEntity =>
      $$LocalQuoteInfoEntityTableTableManager(_db, _db.localQuoteInfoEntity);
}
