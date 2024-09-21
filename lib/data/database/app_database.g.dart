// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class Habits extends Table with TableInfo<Habits, Habit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Habits(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
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
  static const String $name = 'habits';
  @override
  VerificationContext validateIntegrity(Insertable<Habit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
  Habit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Habit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}createdAt'])!,
    );
  }

  @override
  Habits createAlias(String alias) {
    return Habits(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Habit extends DataClass implements Insertable<Habit> {
  final int id;
  final String name;
  final String color;
  final int createdAt;
  const Habit(
      {required this.id,
      required this.name,
      required this.color,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<String>(color);
    map['createdAt'] = Variable<int>(createdAt);
    return map;
  }

  HabitsCompanion toCompanion(bool nullToAbsent) {
    return HabitsCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
      createdAt: Value(createdAt),
    );
  }

  factory Habit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Habit(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String>(json['color']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String>(color),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  Habit copyWith({int? id, String? name, String? color, int? createdAt}) =>
      Habit(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
        createdAt: createdAt ?? this.createdAt,
      );
  Habit copyWithCompanion(HabitsCompanion data) {
    return Habit(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Habit(')
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
      (other is Habit &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.createdAt == this.createdAt);
}

class HabitsCompanion extends UpdateCompanion<Habit> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> color;
  final Value<int> createdAt;
  const HabitsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  HabitsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String color,
    required int createdAt,
  })  : name = Value(name),
        color = Value(color),
        createdAt = Value(createdAt);
  static Insertable<Habit> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? color,
    Expression<int>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (createdAt != null) 'createdAt': createdAt,
    });
  }

  HabitsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? color,
      Value<int>? createdAt}) {
    return HabitsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class HabitCompletions extends Table
    with TableInfo<HabitCompletions, HabitCompletion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  HabitCompletions(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _habitIdMeta =
      const VerificationMeta('habitId');
  late final GeneratedColumn<String> habitId = GeneratedColumn<String>(
      'habitId', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
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
  static const String $name = 'habitCompletions';
  @override
  VerificationContext validateIntegrity(Insertable<HabitCompletion> instance,
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
  HabitCompletion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitCompletion(
      habitId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}habitId'])!,
      dateKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dateKey'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}createdAt'])!,
    );
  }

  @override
  HabitCompletions createAlias(String alias) {
    return HabitCompletions(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['PRIMARY KEY(habitId, dateKey)'];
  @override
  bool get dontWriteConstraints => true;
}

class HabitCompletion extends DataClass implements Insertable<HabitCompletion> {
  final String habitId;
  final String dateKey;
  final int createdAt;
  const HabitCompletion(
      {required this.habitId, required this.dateKey, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['habitId'] = Variable<String>(habitId);
    map['dateKey'] = Variable<String>(dateKey);
    map['createdAt'] = Variable<int>(createdAt);
    return map;
  }

  HabitCompletionsCompanion toCompanion(bool nullToAbsent) {
    return HabitCompletionsCompanion(
      habitId: Value(habitId),
      dateKey: Value(dateKey),
      createdAt: Value(createdAt),
    );
  }

  factory HabitCompletion.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitCompletion(
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

  HabitCompletion copyWith(
          {String? habitId, String? dateKey, int? createdAt}) =>
      HabitCompletion(
        habitId: habitId ?? this.habitId,
        dateKey: dateKey ?? this.dateKey,
        createdAt: createdAt ?? this.createdAt,
      );
  HabitCompletion copyWithCompanion(HabitCompletionsCompanion data) {
    return HabitCompletion(
      habitId: data.habitId.present ? data.habitId.value : this.habitId,
      dateKey: data.dateKey.present ? data.dateKey.value : this.dateKey,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitCompletion(')
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
      (other is HabitCompletion &&
          other.habitId == this.habitId &&
          other.dateKey == this.dateKey &&
          other.createdAt == this.createdAt);
}

class HabitCompletionsCompanion extends UpdateCompanion<HabitCompletion> {
  final Value<String> habitId;
  final Value<String> dateKey;
  final Value<int> createdAt;
  final Value<int> rowid;
  const HabitCompletionsCompanion({
    this.habitId = const Value.absent(),
    this.dateKey = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitCompletionsCompanion.insert({
    required String habitId,
    required String dateKey,
    required int createdAt,
    this.rowid = const Value.absent(),
  })  : habitId = Value(habitId),
        dateKey = Value(dateKey),
        createdAt = Value(createdAt);
  static Insertable<HabitCompletion> custom({
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

  HabitCompletionsCompanion copyWith(
      {Value<String>? habitId,
      Value<String>? dateKey,
      Value<int>? createdAt,
      Value<int>? rowid}) {
    return HabitCompletionsCompanion(
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
    return (StringBuffer('HabitCompletionsCompanion(')
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
  late final Habits habits = Habits(this);
  late final HabitCompletions habitCompletions = HabitCompletions(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [habits, habitCompletions];
}

typedef $HabitsCreateCompanionBuilder = HabitsCompanion Function({
  Value<int> id,
  required String name,
  required String color,
  required int createdAt,
});
typedef $HabitsUpdateCompanionBuilder = HabitsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> color,
  Value<int> createdAt,
});

class $HabitsFilterComposer extends FilterComposer<_$AppDatabase, Habits> {
  $HabitsFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
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
}

class $HabitsOrderingComposer extends OrderingComposer<_$AppDatabase, Habits> {
  $HabitsOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
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

class $HabitsTableManager extends RootTableManager<
    _$AppDatabase,
    Habits,
    Habit,
    $HabitsFilterComposer,
    $HabitsOrderingComposer,
    $HabitsCreateCompanionBuilder,
    $HabitsUpdateCompanionBuilder,
    (Habit, BaseReferences<_$AppDatabase, Habits, Habit>),
    Habit,
    PrefetchHooks Function()> {
  $HabitsTableManager(_$AppDatabase db, Habits table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $HabitsFilterComposer(ComposerState(db, table)),
          orderingComposer: $HabitsOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> color = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
          }) =>
              HabitsCompanion(
            id: id,
            name: name,
            color: color,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String color,
            required int createdAt,
          }) =>
              HabitsCompanion.insert(
            id: id,
            name: name,
            color: color,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $HabitsProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    Habits,
    Habit,
    $HabitsFilterComposer,
    $HabitsOrderingComposer,
    $HabitsCreateCompanionBuilder,
    $HabitsUpdateCompanionBuilder,
    (Habit, BaseReferences<_$AppDatabase, Habits, Habit>),
    Habit,
    PrefetchHooks Function()>;
typedef $HabitCompletionsCreateCompanionBuilder = HabitCompletionsCompanion
    Function({
  required String habitId,
  required String dateKey,
  required int createdAt,
  Value<int> rowid,
});
typedef $HabitCompletionsUpdateCompanionBuilder = HabitCompletionsCompanion
    Function({
  Value<String> habitId,
  Value<String> dateKey,
  Value<int> createdAt,
  Value<int> rowid,
});

class $HabitCompletionsFilterComposer
    extends FilterComposer<_$AppDatabase, HabitCompletions> {
  $HabitCompletionsFilterComposer(super.$state);
  ColumnFilters<String> get habitId => $state.composableBuilder(
      column: $state.table.habitId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get dateKey => $state.composableBuilder(
      column: $state.table.dateKey,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $HabitCompletionsOrderingComposer
    extends OrderingComposer<_$AppDatabase, HabitCompletions> {
  $HabitCompletionsOrderingComposer(super.$state);
  ColumnOrderings<String> get habitId => $state.composableBuilder(
      column: $state.table.habitId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get dateKey => $state.composableBuilder(
      column: $state.table.dateKey,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $HabitCompletionsTableManager extends RootTableManager<
    _$AppDatabase,
    HabitCompletions,
    HabitCompletion,
    $HabitCompletionsFilterComposer,
    $HabitCompletionsOrderingComposer,
    $HabitCompletionsCreateCompanionBuilder,
    $HabitCompletionsUpdateCompanionBuilder,
    (
      HabitCompletion,
      BaseReferences<_$AppDatabase, HabitCompletions, HabitCompletion>
    ),
    HabitCompletion,
    PrefetchHooks Function()> {
  $HabitCompletionsTableManager(_$AppDatabase db, HabitCompletions table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $HabitCompletionsFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $HabitCompletionsOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> habitId = const Value.absent(),
            Value<String> dateKey = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HabitCompletionsCompanion(
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
              HabitCompletionsCompanion.insert(
            habitId: habitId,
            dateKey: dateKey,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $HabitCompletionsProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    HabitCompletions,
    HabitCompletion,
    $HabitCompletionsFilterComposer,
    $HabitCompletionsOrderingComposer,
    $HabitCompletionsCreateCompanionBuilder,
    $HabitCompletionsUpdateCompanionBuilder,
    (
      HabitCompletion,
      BaseReferences<_$AppDatabase, HabitCompletions, HabitCompletion>
    ),
    HabitCompletion,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $HabitsTableManager get habits => $HabitsTableManager(_db, _db.habits);
  $HabitCompletionsTableManager get habitCompletions =>
      $HabitCompletionsTableManager(_db, _db.habitCompletions);
}
