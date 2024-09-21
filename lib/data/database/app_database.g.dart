// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class HabitRecords extends Table with TableInfo<HabitRecords, HabitRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  HabitRecords(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'createdAt', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, name, color, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habitRecords';
  @override
  VerificationContext validateIntegrity(Insertable<HabitRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('createdAt')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['createdAt']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabitRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}createdAt'])!,
    );
  }

  @override
  HabitRecords createAlias(String alias) {
    return HabitRecords(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class HabitRecord extends DataClass implements Insertable<HabitRecord> {
  final String id;
  final String name;
  final String color;
  final int createdAt;
  const HabitRecord(
      {required this.id,
      required this.name,
      required this.color,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<String>(color);
    map['createdAt'] = Variable<int>(createdAt);
    return map;
  }

  HabitRecordsCompanion toCompanion(bool nullToAbsent) {
    return HabitRecordsCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
      createdAt: Value(createdAt),
    );
  }

  factory HabitRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitRecord(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String>(json['color']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String>(color),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  HabitRecord copyWith(
          {String? id, String? name, String? color, int? createdAt}) =>
      HabitRecord(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
        createdAt: createdAt ?? this.createdAt,
      );
  HabitRecord copyWithCompanion(HabitRecordsCompanion data) {
    return HabitRecord(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitRecord(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitRecord &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.createdAt == this.createdAt);
}

class HabitRecordsCompanion extends UpdateCompanion<HabitRecord> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> color;
  final Value<int> createdAt;
  final Value<int> rowid;
  const HabitRecordsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitRecordsCompanion.insert({
    required String id,
    required String name,
    required String color,
    required int createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        color = Value(color),
        createdAt = Value(createdAt);
  static Insertable<HabitRecord> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? color,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (createdAt != null) 'createdAt': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HabitRecordsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? color,
      Value<int>? createdAt,
      Value<int>? rowid}) {
    return HabitRecordsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (createdAt.present) {
      map['createdAt'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitRecordsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class HabitCompletionRecords extends Table
    with TableInfo<HabitCompletionRecords, HabitCompletionRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  HabitCompletionRecords(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _habitIdMeta =
      const VerificationMeta('habitId');
  late final GeneratedColumn<String> habitId = GeneratedColumn<String>(
      'habitId', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES habitRecords(id) NOT NULL');
  static const VerificationMeta _dateKeyMeta =
      const VerificationMeta('dateKey');
  late final GeneratedColumn<String> dateKey = GeneratedColumn<String>(
      'dateKey', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'createdAt', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [habitId, dateKey, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habitCompletionRecords';
  @override
  VerificationContext validateIntegrity(
      Insertable<HabitCompletionRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('habitId')) {
      context.handle(_habitIdMeta,
          habitId.isAcceptableOrUnknown(data['habitId']!, _habitIdMeta));
    } else if (isInserting) {
      context.missing(_habitIdMeta);
    }
    if (data.containsKey('dateKey')) {
      context.handle(_dateKeyMeta,
          dateKey.isAcceptableOrUnknown(data['dateKey']!, _dateKeyMeta));
    } else if (isInserting) {
      context.missing(_dateKeyMeta);
    }
    if (data.containsKey('createdAt')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['createdAt']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {habitId, dateKey};
  @override
  HabitCompletionRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitCompletionRecord(
      habitId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}habitId'])!,
      dateKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dateKey'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}createdAt'])!,
    );
  }

  @override
  HabitCompletionRecords createAlias(String alias) {
    return HabitCompletionRecords(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['PRIMARY KEY(habitId, dateKey)'];
  @override
  bool get dontWriteConstraints => true;
}

class HabitCompletionRecord extends DataClass
    implements Insertable<HabitCompletionRecord> {
  final String habitId;
  final String dateKey;
  final int createdAt;
  const HabitCompletionRecord(
      {required this.habitId, required this.dateKey, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['habitId'] = Variable<String>(habitId);
    map['dateKey'] = Variable<String>(dateKey);
    map['createdAt'] = Variable<int>(createdAt);
    return map;
  }

  HabitCompletionRecordsCompanion toCompanion(bool nullToAbsent) {
    return HabitCompletionRecordsCompanion(
      habitId: Value(habitId),
      dateKey: Value(dateKey),
      createdAt: Value(createdAt),
    );
  }

  factory HabitCompletionRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitCompletionRecord(
      habitId: serializer.fromJson<String>(json['habitId']),
      dateKey: serializer.fromJson<String>(json['dateKey']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'habitId': serializer.toJson<String>(habitId),
      'dateKey': serializer.toJson<String>(dateKey),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  HabitCompletionRecord copyWith(
          {String? habitId, String? dateKey, int? createdAt}) =>
      HabitCompletionRecord(
        habitId: habitId ?? this.habitId,
        dateKey: dateKey ?? this.dateKey,
        createdAt: createdAt ?? this.createdAt,
      );
  HabitCompletionRecord copyWithCompanion(
      HabitCompletionRecordsCompanion data) {
    return HabitCompletionRecord(
      habitId: data.habitId.present ? data.habitId.value : this.habitId,
      dateKey: data.dateKey.present ? data.dateKey.value : this.dateKey,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitCompletionRecord(')
          ..write('habitId: $habitId, ')
          ..write('dateKey: $dateKey, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(habitId, dateKey, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitCompletionRecord &&
          other.habitId == this.habitId &&
          other.dateKey == this.dateKey &&
          other.createdAt == this.createdAt);
}

class HabitCompletionRecordsCompanion
    extends UpdateCompanion<HabitCompletionRecord> {
  final Value<String> habitId;
  final Value<String> dateKey;
  final Value<int> createdAt;
  final Value<int> rowid;
  const HabitCompletionRecordsCompanion({
    this.habitId = const Value.absent(),
    this.dateKey = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitCompletionRecordsCompanion.insert({
    required String habitId,
    required String dateKey,
    required int createdAt,
    this.rowid = const Value.absent(),
  })  : habitId = Value(habitId),
        dateKey = Value(dateKey),
        createdAt = Value(createdAt);
  static Insertable<HabitCompletionRecord> custom({
    Expression<String>? habitId,
    Expression<String>? dateKey,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (habitId != null) 'habitId': habitId,
      if (dateKey != null) 'dateKey': dateKey,
      if (createdAt != null) 'createdAt': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HabitCompletionRecordsCompanion copyWith(
      {Value<String>? habitId,
      Value<String>? dateKey,
      Value<int>? createdAt,
      Value<int>? rowid}) {
    return HabitCompletionRecordsCompanion(
      habitId: habitId ?? this.habitId,
      dateKey: dateKey ?? this.dateKey,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (habitId.present) {
      map['habitId'] = Variable<String>(habitId.value);
    }
    if (dateKey.present) {
      map['dateKey'] = Variable<String>(dateKey.value);
    }
    if (createdAt.present) {
      map['createdAt'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitCompletionRecordsCompanion(')
          ..write('habitId: $habitId, ')
          ..write('dateKey: $dateKey, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final HabitRecords habitRecords = HabitRecords(this);
  late final HabitCompletionRecords habitCompletionRecords =
      HabitCompletionRecords(this);
  Selectable<HabitCompletionRecord> completionOfHabitOnDate(
      String var1, String var2) {
    return customSelect(
        'SELECT * FROM habitCompletionRecords WHERE habitId = ?1 AND dateKey = ?2 LIMIT 1',
        variables: [
          Variable<String>(var1),
          Variable<String>(var2)
        ],
        readsFrom: {
          habitCompletionRecords,
        }).asyncMap(habitCompletionRecords.mapFromRow);
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [habitRecords, habitCompletionRecords];
}

typedef $HabitRecordsCreateCompanionBuilder = HabitRecordsCompanion Function({
  required String id,
  required String name,
  required String color,
  required int createdAt,
  Value<int> rowid,
});
typedef $HabitRecordsUpdateCompanionBuilder = HabitRecordsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> color,
  Value<int> createdAt,
  Value<int> rowid,
});

final class $HabitRecordsReferences
    extends BaseReferences<_$AppDatabase, HabitRecords, HabitRecord> {
  $HabitRecordsReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<HabitCompletionRecords,
      List<HabitCompletionRecord>> _habitCompletionRecordsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.habitCompletionRecords,
          aliasName: $_aliasNameGenerator(
              db.habitRecords.id, db.habitCompletionRecords.habitId));

  $HabitCompletionRecordsProcessedTableManager get habitCompletionRecordsRefs {
    final manager =
        $HabitCompletionRecordsTableManager($_db, $_db.habitCompletionRecords)
            .filter((f) => f.habitId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_habitCompletionRecordsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $HabitRecordsFilterComposer
    extends FilterComposer<_$AppDatabase, HabitRecords> {
  $HabitRecordsFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter habitCompletionRecordsRefs(
      ComposableFilter Function($HabitCompletionRecordsFilterComposer f) f) {
    final $HabitCompletionRecordsFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.habitCompletionRecords,
            getReferencedColumn: (t) => t.habitId,
            builder: (joinBuilder, parentComposers) =>
                $HabitCompletionRecordsFilterComposer(ComposerState(
                    $state.db,
                    $state.db.habitCompletionRecords,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $HabitRecordsOrderingComposer
    extends OrderingComposer<_$AppDatabase, HabitRecords> {
  $HabitRecordsOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $HabitRecordsTableManager extends RootTableManager<
    _$AppDatabase,
    HabitRecords,
    HabitRecord,
    $HabitRecordsFilterComposer,
    $HabitRecordsOrderingComposer,
    $HabitRecordsCreateCompanionBuilder,
    $HabitRecordsUpdateCompanionBuilder,
    (HabitRecord, $HabitRecordsReferences),
    HabitRecord,
    PrefetchHooks Function({bool habitCompletionRecordsRefs})> {
  $HabitRecordsTableManager(_$AppDatabase db, HabitRecords table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $HabitRecordsFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $HabitRecordsOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> color = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HabitRecordsCompanion(
            id: id,
            name: name,
            color: color,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String color,
            required int createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              HabitRecordsCompanion.insert(
            id: id,
            name: name,
            color: color,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $HabitRecordsReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({habitCompletionRecordsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (habitCompletionRecordsRefs) db.habitCompletionRecords
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (habitCompletionRecordsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $HabitRecordsReferences
                            ._habitCompletionRecordsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $HabitRecordsReferences(db, table, p0)
                                .habitCompletionRecordsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.habitId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $HabitRecordsProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    HabitRecords,
    HabitRecord,
    $HabitRecordsFilterComposer,
    $HabitRecordsOrderingComposer,
    $HabitRecordsCreateCompanionBuilder,
    $HabitRecordsUpdateCompanionBuilder,
    (HabitRecord, $HabitRecordsReferences),
    HabitRecord,
    PrefetchHooks Function({bool habitCompletionRecordsRefs})>;
typedef $HabitCompletionRecordsCreateCompanionBuilder
    = HabitCompletionRecordsCompanion Function({
  required String habitId,
  required String dateKey,
  required int createdAt,
  Value<int> rowid,
});
typedef $HabitCompletionRecordsUpdateCompanionBuilder
    = HabitCompletionRecordsCompanion Function({
  Value<String> habitId,
  Value<String> dateKey,
  Value<int> createdAt,
  Value<int> rowid,
});

final class $HabitCompletionRecordsReferences extends BaseReferences<
    _$AppDatabase, HabitCompletionRecords, HabitCompletionRecord> {
  $HabitCompletionRecordsReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static HabitRecords _habitIdTable(_$AppDatabase db) =>
      db.habitRecords.createAlias($_aliasNameGenerator(
          db.habitCompletionRecords.habitId, db.habitRecords.id));

  $HabitRecordsProcessedTableManager? get habitId {
    if ($_item.habitId == null) return null;
    final manager = $HabitRecordsTableManager($_db, $_db.habitRecords)
        .filter((f) => f.id($_item.habitId!));
    final item = $_typedResult.readTableOrNull(_habitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $HabitCompletionRecordsFilterComposer
    extends FilterComposer<_$AppDatabase, HabitCompletionRecords> {
  $HabitCompletionRecordsFilterComposer(super.$state);
  ColumnFilters<String> get dateKey => $state.composableBuilder(
      column: $state.table.dateKey,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $HabitRecordsFilterComposer get habitId {
    final $HabitRecordsFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.habitId,
        referencedTable: $state.db.habitRecords,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $HabitRecordsFilterComposer(
            ComposerState($state.db, $state.db.habitRecords, joinBuilder,
                parentComposers)));
    return composer;
  }
}

class $HabitCompletionRecordsOrderingComposer
    extends OrderingComposer<_$AppDatabase, HabitCompletionRecords> {
  $HabitCompletionRecordsOrderingComposer(super.$state);
  ColumnOrderings<String> get dateKey => $state.composableBuilder(
      column: $state.table.dateKey,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $HabitRecordsOrderingComposer get habitId {
    final $HabitRecordsOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.habitId,
        referencedTable: $state.db.habitRecords,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $HabitRecordsOrderingComposer(ComposerState($state.db,
                $state.db.habitRecords, joinBuilder, parentComposers)));
    return composer;
  }
}

class $HabitCompletionRecordsTableManager extends RootTableManager<
    _$AppDatabase,
    HabitCompletionRecords,
    HabitCompletionRecord,
    $HabitCompletionRecordsFilterComposer,
    $HabitCompletionRecordsOrderingComposer,
    $HabitCompletionRecordsCreateCompanionBuilder,
    $HabitCompletionRecordsUpdateCompanionBuilder,
    (HabitCompletionRecord, $HabitCompletionRecordsReferences),
    HabitCompletionRecord,
    PrefetchHooks Function({bool habitId})> {
  $HabitCompletionRecordsTableManager(
      _$AppDatabase db, HabitCompletionRecords table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $HabitCompletionRecordsFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $HabitCompletionRecordsOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> habitId = const Value.absent(),
            Value<String> dateKey = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HabitCompletionRecordsCompanion(
            habitId: habitId,
            dateKey: dateKey,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String habitId,
            required String dateKey,
            required int createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              HabitCompletionRecordsCompanion.insert(
            habitId: habitId,
            dateKey: dateKey,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $HabitCompletionRecordsReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({habitId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (habitId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.habitId,
                    referencedTable:
                        $HabitCompletionRecordsReferences._habitIdTable(db),
                    referencedColumn:
                        $HabitCompletionRecordsReferences._habitIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $HabitCompletionRecordsProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    HabitCompletionRecords,
    HabitCompletionRecord,
    $HabitCompletionRecordsFilterComposer,
    $HabitCompletionRecordsOrderingComposer,
    $HabitCompletionRecordsCreateCompanionBuilder,
    $HabitCompletionRecordsUpdateCompanionBuilder,
    (HabitCompletionRecord, $HabitCompletionRecordsReferences),
    HabitCompletionRecord,
    PrefetchHooks Function({bool habitId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $HabitRecordsTableManager get habitRecords =>
      $HabitRecordsTableManager(_db, _db.habitRecords);
  $HabitCompletionRecordsTableManager get habitCompletionRecords =>
      $HabitCompletionRecordsTableManager(_db, _db.habitCompletionRecords);
}
