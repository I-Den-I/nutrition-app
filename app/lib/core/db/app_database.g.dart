// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: newId,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<ContentVisibility, String>
  visibility = GeneratedColumn<String>(
    'visibility',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: Constant(ContentVisibility.private.name),
  ).withConverter<ContentVisibility>($ProductsTable.$convertervisibility);
  @override
  late final GeneratedColumnWithTypeConverter<ModerationStatus, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(ModerationStatus.active.name),
      ).withConverter<ModerationStatus>($ProductsTable.$converterstatus);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 200,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
    'brand',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _barcodeMeta = const VerificationMeta(
    'barcode',
  );
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
    'barcode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Basis, String> basis =
      GeneratedColumn<String>(
        'basis',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(Basis.g.name),
      ).withConverter<Basis>($ProductsTable.$converterbasis);
  static const VerificationMeta _kcalMeta = const VerificationMeta('kcal');
  @override
  late final GeneratedColumn<double> kcal = GeneratedColumn<double>(
    'kcal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _proteinMeta = const VerificationMeta(
    'protein',
  );
  @override
  late final GeneratedColumn<double> protein = GeneratedColumn<double>(
    'protein',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fatMeta = const VerificationMeta('fat');
  @override
  late final GeneratedColumn<double> fat = GeneratedColumn<double>(
    'fat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _carbsMeta = const VerificationMeta('carbs');
  @override
  late final GeneratedColumn<double> carbs = GeneratedColumn<double>(
    'carbs',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    ownerId,
    visibility,
    status,
    name,
    description,
    brand,
    barcode,
    basis,
    kcal,
    protein,
    fat,
    carbs,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<Product> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('brand')) {
      context.handle(
        _brandMeta,
        brand.isAcceptableOrUnknown(data['brand']!, _brandMeta),
      );
    }
    if (data.containsKey('barcode')) {
      context.handle(
        _barcodeMeta,
        barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta),
      );
    }
    if (data.containsKey('kcal')) {
      context.handle(
        _kcalMeta,
        kcal.isAcceptableOrUnknown(data['kcal']!, _kcalMeta),
      );
    } else if (isInserting) {
      context.missing(_kcalMeta);
    }
    if (data.containsKey('protein')) {
      context.handle(
        _proteinMeta,
        protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta),
      );
    } else if (isInserting) {
      context.missing(_proteinMeta);
    }
    if (data.containsKey('fat')) {
      context.handle(
        _fatMeta,
        fat.isAcceptableOrUnknown(data['fat']!, _fatMeta),
      );
    } else if (isInserting) {
      context.missing(_fatMeta);
    }
    if (data.containsKey('carbs')) {
      context.handle(
        _carbsMeta,
        carbs.isAcceptableOrUnknown(data['carbs']!, _carbsMeta),
      );
    } else if (isInserting) {
      context.missing(_carbsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      ),
      visibility: $ProductsTable.$convertervisibility.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}visibility'],
        )!,
      ),
      status: $ProductsTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      brand: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}brand'],
      ),
      barcode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barcode'],
      ),
      basis: $ProductsTable.$converterbasis.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}basis'],
        )!,
      ),
      kcal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}kcal'],
      )!,
      protein: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}protein'],
      )!,
      fat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fat'],
      )!,
      carbs: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}carbs'],
      )!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ContentVisibility, String, String>
  $convertervisibility = const EnumNameConverter<ContentVisibility>(
    ContentVisibility.values,
  );
  static JsonTypeConverter2<ModerationStatus, String, String> $converterstatus =
      const EnumNameConverter<ModerationStatus>(ModerationStatus.values);
  static JsonTypeConverter2<Basis, String, String> $converterbasis =
      const EnumNameConverter<Basis>(Basis.values);
}

class Product extends DataClass implements Insertable<Product> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? ownerId;
  final ContentVisibility visibility;
  final ModerationStatus status;
  final String name;
  final String? description;
  final String? brand;
  final String? barcode;
  final Basis basis;
  final double kcal;
  final double protein;
  final double fat;
  final double carbs;
  const Product({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.ownerId,
    required this.visibility,
    required this.status,
    required this.name,
    this.description,
    this.brand,
    this.barcode,
    required this.basis,
    required this.kcal,
    required this.protein,
    required this.fat,
    required this.carbs,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || ownerId != null) {
      map['owner_id'] = Variable<String>(ownerId);
    }
    {
      map['visibility'] = Variable<String>(
        $ProductsTable.$convertervisibility.toSql(visibility),
      );
    }
    {
      map['status'] = Variable<String>(
        $ProductsTable.$converterstatus.toSql(status),
      );
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    {
      map['basis'] = Variable<String>(
        $ProductsTable.$converterbasis.toSql(basis),
      );
    }
    map['kcal'] = Variable<double>(kcal);
    map['protein'] = Variable<double>(protein);
    map['fat'] = Variable<double>(fat);
    map['carbs'] = Variable<double>(carbs);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      ownerId: ownerId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerId),
      visibility: Value(visibility),
      status: Value(status),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      brand: brand == null && nullToAbsent
          ? const Value.absent()
          : Value(brand),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      basis: Value(basis),
      kcal: Value(kcal),
      protein: Value(protein),
      fat: Value(fat),
      carbs: Value(carbs),
    );
  }

  factory Product.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      ownerId: serializer.fromJson<String?>(json['ownerId']),
      visibility: $ProductsTable.$convertervisibility.fromJson(
        serializer.fromJson<String>(json['visibility']),
      ),
      status: $ProductsTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      brand: serializer.fromJson<String?>(json['brand']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      basis: $ProductsTable.$converterbasis.fromJson(
        serializer.fromJson<String>(json['basis']),
      ),
      kcal: serializer.fromJson<double>(json['kcal']),
      protein: serializer.fromJson<double>(json['protein']),
      fat: serializer.fromJson<double>(json['fat']),
      carbs: serializer.fromJson<double>(json['carbs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'ownerId': serializer.toJson<String?>(ownerId),
      'visibility': serializer.toJson<String>(
        $ProductsTable.$convertervisibility.toJson(visibility),
      ),
      'status': serializer.toJson<String>(
        $ProductsTable.$converterstatus.toJson(status),
      ),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'brand': serializer.toJson<String?>(brand),
      'barcode': serializer.toJson<String?>(barcode),
      'basis': serializer.toJson<String>(
        $ProductsTable.$converterbasis.toJson(basis),
      ),
      'kcal': serializer.toJson<double>(kcal),
      'protein': serializer.toJson<double>(protein),
      'fat': serializer.toJson<double>(fat),
      'carbs': serializer.toJson<double>(carbs),
    };
  }

  Product copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> ownerId = const Value.absent(),
    ContentVisibility? visibility,
    ModerationStatus? status,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> brand = const Value.absent(),
    Value<String?> barcode = const Value.absent(),
    Basis? basis,
    double? kcal,
    double? protein,
    double? fat,
    double? carbs,
  }) => Product(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    ownerId: ownerId.present ? ownerId.value : this.ownerId,
    visibility: visibility ?? this.visibility,
    status: status ?? this.status,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    brand: brand.present ? brand.value : this.brand,
    barcode: barcode.present ? barcode.value : this.barcode,
    basis: basis ?? this.basis,
    kcal: kcal ?? this.kcal,
    protein: protein ?? this.protein,
    fat: fat ?? this.fat,
    carbs: carbs ?? this.carbs,
  );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      visibility: data.visibility.present
          ? data.visibility.value
          : this.visibility,
      status: data.status.present ? data.status.value : this.status,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      brand: data.brand.present ? data.brand.value : this.brand,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      basis: data.basis.present ? data.basis.value : this.basis,
      kcal: data.kcal.present ? data.kcal.value : this.kcal,
      protein: data.protein.present ? data.protein.value : this.protein,
      fat: data.fat.present ? data.fat.value : this.fat,
      carbs: data.carbs.present ? data.carbs.value : this.carbs,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('ownerId: $ownerId, ')
          ..write('visibility: $visibility, ')
          ..write('status: $status, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('brand: $brand, ')
          ..write('barcode: $barcode, ')
          ..write('basis: $basis, ')
          ..write('kcal: $kcal, ')
          ..write('protein: $protein, ')
          ..write('fat: $fat, ')
          ..write('carbs: $carbs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    ownerId,
    visibility,
    status,
    name,
    description,
    brand,
    barcode,
    basis,
    kcal,
    protein,
    fat,
    carbs,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.ownerId == this.ownerId &&
          other.visibility == this.visibility &&
          other.status == this.status &&
          other.name == this.name &&
          other.description == this.description &&
          other.brand == this.brand &&
          other.barcode == this.barcode &&
          other.basis == this.basis &&
          other.kcal == this.kcal &&
          other.protein == this.protein &&
          other.fat == this.fat &&
          other.carbs == this.carbs);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String?> ownerId;
  final Value<ContentVisibility> visibility;
  final Value<ModerationStatus> status;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> brand;
  final Value<String?> barcode;
  final Value<Basis> basis;
  final Value<double> kcal;
  final Value<double> protein;
  final Value<double> fat;
  final Value<double> carbs;
  final Value<int> rowid;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.visibility = const Value.absent(),
    this.status = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.brand = const Value.absent(),
    this.barcode = const Value.absent(),
    this.basis = const Value.absent(),
    this.kcal = const Value.absent(),
    this.protein = const Value.absent(),
    this.fat = const Value.absent(),
    this.carbs = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.visibility = const Value.absent(),
    this.status = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.brand = const Value.absent(),
    this.barcode = const Value.absent(),
    this.basis = const Value.absent(),
    required double kcal,
    required double protein,
    required double fat,
    required double carbs,
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       kcal = Value(kcal),
       protein = Value(protein),
       fat = Value(fat),
       carbs = Value(carbs);
  static Insertable<Product> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? ownerId,
    Expression<String>? visibility,
    Expression<String>? status,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? brand,
    Expression<String>? barcode,
    Expression<String>? basis,
    Expression<double>? kcal,
    Expression<double>? protein,
    Expression<double>? fat,
    Expression<double>? carbs,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (ownerId != null) 'owner_id': ownerId,
      if (visibility != null) 'visibility': visibility,
      if (status != null) 'status': status,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (brand != null) 'brand': brand,
      if (barcode != null) 'barcode': barcode,
      if (basis != null) 'basis': basis,
      if (kcal != null) 'kcal': kcal,
      if (protein != null) 'protein': protein,
      if (fat != null) 'fat': fat,
      if (carbs != null) 'carbs': carbs,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String?>? ownerId,
    Value<ContentVisibility>? visibility,
    Value<ModerationStatus>? status,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? brand,
    Value<String?>? barcode,
    Value<Basis>? basis,
    Value<double>? kcal,
    Value<double>? protein,
    Value<double>? fat,
    Value<double>? carbs,
    Value<int>? rowid,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      ownerId: ownerId ?? this.ownerId,
      visibility: visibility ?? this.visibility,
      status: status ?? this.status,
      name: name ?? this.name,
      description: description ?? this.description,
      brand: brand ?? this.brand,
      barcode: barcode ?? this.barcode,
      basis: basis ?? this.basis,
      kcal: kcal ?? this.kcal,
      protein: protein ?? this.protein,
      fat: fat ?? this.fat,
      carbs: carbs ?? this.carbs,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (visibility.present) {
      map['visibility'] = Variable<String>(
        $ProductsTable.$convertervisibility.toSql(visibility.value),
      );
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $ProductsTable.$converterstatus.toSql(status.value),
      );
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (basis.present) {
      map['basis'] = Variable<String>(
        $ProductsTable.$converterbasis.toSql(basis.value),
      );
    }
    if (kcal.present) {
      map['kcal'] = Variable<double>(kcal.value);
    }
    if (protein.present) {
      map['protein'] = Variable<double>(protein.value);
    }
    if (fat.present) {
      map['fat'] = Variable<double>(fat.value);
    }
    if (carbs.present) {
      map['carbs'] = Variable<double>(carbs.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('ownerId: $ownerId, ')
          ..write('visibility: $visibility, ')
          ..write('status: $status, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('brand: $brand, ')
          ..write('barcode: $barcode, ')
          ..write('basis: $basis, ')
          ..write('kcal: $kcal, ')
          ..write('protein: $protein, ')
          ..write('fat: $fat, ')
          ..write('carbs: $carbs, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NutrientDefinitionsTable extends NutrientDefinitions
    with TableInfo<$NutrientDefinitionsTable, NutrientDefinition> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NutrientDefinitionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [code, unit, sortOrder];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nutrient_definitions';
  @override
  VerificationContext validateIntegrity(
    Insertable<NutrientDefinition> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  NutrientDefinition map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NutrientDefinition(
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $NutrientDefinitionsTable createAlias(String alias) {
    return $NutrientDefinitionsTable(attachedDatabase, alias);
  }
}

class NutrientDefinition extends DataClass
    implements Insertable<NutrientDefinition> {
  final String code;
  final String unit;
  final int sortOrder;
  const NutrientDefinition({
    required this.code,
    required this.unit,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['unit'] = Variable<String>(unit);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  NutrientDefinitionsCompanion toCompanion(bool nullToAbsent) {
    return NutrientDefinitionsCompanion(
      code: Value(code),
      unit: Value(unit),
      sortOrder: Value(sortOrder),
    );
  }

  factory NutrientDefinition.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NutrientDefinition(
      code: serializer.fromJson<String>(json['code']),
      unit: serializer.fromJson<String>(json['unit']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'unit': serializer.toJson<String>(unit),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  NutrientDefinition copyWith({String? code, String? unit, int? sortOrder}) =>
      NutrientDefinition(
        code: code ?? this.code,
        unit: unit ?? this.unit,
        sortOrder: sortOrder ?? this.sortOrder,
      );
  NutrientDefinition copyWithCompanion(NutrientDefinitionsCompanion data) {
    return NutrientDefinition(
      code: data.code.present ? data.code.value : this.code,
      unit: data.unit.present ? data.unit.value : this.unit,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NutrientDefinition(')
          ..write('code: $code, ')
          ..write('unit: $unit, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(code, unit, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NutrientDefinition &&
          other.code == this.code &&
          other.unit == this.unit &&
          other.sortOrder == this.sortOrder);
}

class NutrientDefinitionsCompanion extends UpdateCompanion<NutrientDefinition> {
  final Value<String> code;
  final Value<String> unit;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const NutrientDefinitionsCompanion({
    this.code = const Value.absent(),
    this.unit = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NutrientDefinitionsCompanion.insert({
    required String code,
    required String unit,
    required int sortOrder,
    this.rowid = const Value.absent(),
  }) : code = Value(code),
       unit = Value(unit),
       sortOrder = Value(sortOrder);
  static Insertable<NutrientDefinition> custom({
    Expression<String>? code,
    Expression<String>? unit,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (unit != null) 'unit': unit,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NutrientDefinitionsCompanion copyWith({
    Value<String>? code,
    Value<String>? unit,
    Value<int>? sortOrder,
    Value<int>? rowid,
  }) {
    return NutrientDefinitionsCompanion(
      code: code ?? this.code,
      unit: unit ?? this.unit,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NutrientDefinitionsCompanion(')
          ..write('code: $code, ')
          ..write('unit: $unit, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductNutrientsTable extends ProductNutrients
    with TableInfo<$ProductNutrientsTable, ProductNutrient> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductNutrientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: newId,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _nutrientCodeMeta = const VerificationMeta(
    'nutrientCode',
  );
  @override
  late final GeneratedColumn<String> nutrientCode = GeneratedColumn<String>(
    'nutrient_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES nutrient_definitions (code)',
    ),
  );
  static const VerificationMeta _amountPer100Meta = const VerificationMeta(
    'amountPer100',
  );
  @override
  late final GeneratedColumn<double> amountPer100 = GeneratedColumn<double>(
    'amount_per100',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    productId,
    nutrientCode,
    amountPer100,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_nutrients';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductNutrient> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('nutrient_code')) {
      context.handle(
        _nutrientCodeMeta,
        nutrientCode.isAcceptableOrUnknown(
          data['nutrient_code']!,
          _nutrientCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nutrientCodeMeta);
    }
    if (data.containsKey('amount_per100')) {
      context.handle(
        _amountPer100Meta,
        amountPer100.isAcceptableOrUnknown(
          data['amount_per100']!,
          _amountPer100Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountPer100Meta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {productId, nutrientCode},
  ];
  @override
  ProductNutrient map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductNutrient(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      nutrientCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nutrient_code'],
      )!,
      amountPer100: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount_per100'],
      )!,
    );
  }

  @override
  $ProductNutrientsTable createAlias(String alias) {
    return $ProductNutrientsTable(attachedDatabase, alias);
  }
}

class ProductNutrient extends DataClass implements Insertable<ProductNutrient> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String productId;
  final String nutrientCode;
  final double amountPer100;
  const ProductNutrient({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.productId,
    required this.nutrientCode,
    required this.amountPer100,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['product_id'] = Variable<String>(productId);
    map['nutrient_code'] = Variable<String>(nutrientCode);
    map['amount_per100'] = Variable<double>(amountPer100);
    return map;
  }

  ProductNutrientsCompanion toCompanion(bool nullToAbsent) {
    return ProductNutrientsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      productId: Value(productId),
      nutrientCode: Value(nutrientCode),
      amountPer100: Value(amountPer100),
    );
  }

  factory ProductNutrient.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductNutrient(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      productId: serializer.fromJson<String>(json['productId']),
      nutrientCode: serializer.fromJson<String>(json['nutrientCode']),
      amountPer100: serializer.fromJson<double>(json['amountPer100']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'productId': serializer.toJson<String>(productId),
      'nutrientCode': serializer.toJson<String>(nutrientCode),
      'amountPer100': serializer.toJson<double>(amountPer100),
    };
  }

  ProductNutrient copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? productId,
    String? nutrientCode,
    double? amountPer100,
  }) => ProductNutrient(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    productId: productId ?? this.productId,
    nutrientCode: nutrientCode ?? this.nutrientCode,
    amountPer100: amountPer100 ?? this.amountPer100,
  );
  ProductNutrient copyWithCompanion(ProductNutrientsCompanion data) {
    return ProductNutrient(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      productId: data.productId.present ? data.productId.value : this.productId,
      nutrientCode: data.nutrientCode.present
          ? data.nutrientCode.value
          : this.nutrientCode,
      amountPer100: data.amountPer100.present
          ? data.amountPer100.value
          : this.amountPer100,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductNutrient(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('productId: $productId, ')
          ..write('nutrientCode: $nutrientCode, ')
          ..write('amountPer100: $amountPer100')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    productId,
    nutrientCode,
    amountPer100,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductNutrient &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.productId == this.productId &&
          other.nutrientCode == this.nutrientCode &&
          other.amountPer100 == this.amountPer100);
}

class ProductNutrientsCompanion extends UpdateCompanion<ProductNutrient> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> productId;
  final Value<String> nutrientCode;
  final Value<double> amountPer100;
  final Value<int> rowid;
  const ProductNutrientsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.productId = const Value.absent(),
    this.nutrientCode = const Value.absent(),
    this.amountPer100 = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductNutrientsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String productId,
    required String nutrientCode,
    required double amountPer100,
    this.rowid = const Value.absent(),
  }) : productId = Value(productId),
       nutrientCode = Value(nutrientCode),
       amountPer100 = Value(amountPer100);
  static Insertable<ProductNutrient> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? productId,
    Expression<String>? nutrientCode,
    Expression<double>? amountPer100,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (productId != null) 'product_id': productId,
      if (nutrientCode != null) 'nutrient_code': nutrientCode,
      if (amountPer100 != null) 'amount_per100': amountPer100,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductNutrientsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? productId,
    Value<String>? nutrientCode,
    Value<double>? amountPer100,
    Value<int>? rowid,
  }) {
    return ProductNutrientsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      productId: productId ?? this.productId,
      nutrientCode: nutrientCode ?? this.nutrientCode,
      amountPer100: amountPer100 ?? this.amountPer100,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (nutrientCode.present) {
      map['nutrient_code'] = Variable<String>(nutrientCode.value);
    }
    if (amountPer100.present) {
      map['amount_per100'] = Variable<double>(amountPer100.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductNutrientsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('productId: $productId, ')
          ..write('nutrientCode: $nutrientCode, ')
          ..write('amountPer100: $amountPer100, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductServingsTable extends ProductServings
    with TableInfo<$ProductServingsTable, ProductServing> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductServingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: newId,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gramsMeta = const VerificationMeta('grams');
  @override
  late final GeneratedColumn<double> grams = GeneratedColumn<double>(
    'grams',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    productId,
    label,
    grams,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_servings';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductServing> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('grams')) {
      context.handle(
        _gramsMeta,
        grams.isAcceptableOrUnknown(data['grams']!, _gramsMeta),
      );
    } else if (isInserting) {
      context.missing(_gramsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductServing map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductServing(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      grams: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}grams'],
      )!,
    );
  }

  @override
  $ProductServingsTable createAlias(String alias) {
    return $ProductServingsTable(attachedDatabase, alias);
  }
}

class ProductServing extends DataClass implements Insertable<ProductServing> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String productId;
  final String label;
  final double grams;
  const ProductServing({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.productId,
    required this.label,
    required this.grams,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['product_id'] = Variable<String>(productId);
    map['label'] = Variable<String>(label);
    map['grams'] = Variable<double>(grams);
    return map;
  }

  ProductServingsCompanion toCompanion(bool nullToAbsent) {
    return ProductServingsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      productId: Value(productId),
      label: Value(label),
      grams: Value(grams),
    );
  }

  factory ProductServing.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductServing(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      productId: serializer.fromJson<String>(json['productId']),
      label: serializer.fromJson<String>(json['label']),
      grams: serializer.fromJson<double>(json['grams']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'productId': serializer.toJson<String>(productId),
      'label': serializer.toJson<String>(label),
      'grams': serializer.toJson<double>(grams),
    };
  }

  ProductServing copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? productId,
    String? label,
    double? grams,
  }) => ProductServing(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    productId: productId ?? this.productId,
    label: label ?? this.label,
    grams: grams ?? this.grams,
  );
  ProductServing copyWithCompanion(ProductServingsCompanion data) {
    return ProductServing(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      productId: data.productId.present ? data.productId.value : this.productId,
      label: data.label.present ? data.label.value : this.label,
      grams: data.grams.present ? data.grams.value : this.grams,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductServing(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('productId: $productId, ')
          ..write('label: $label, ')
          ..write('grams: $grams')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, updatedAt, deletedAt, productId, label, grams);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductServing &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.productId == this.productId &&
          other.label == this.label &&
          other.grams == this.grams);
}

class ProductServingsCompanion extends UpdateCompanion<ProductServing> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> productId;
  final Value<String> label;
  final Value<double> grams;
  final Value<int> rowid;
  const ProductServingsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.productId = const Value.absent(),
    this.label = const Value.absent(),
    this.grams = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductServingsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String productId,
    required String label,
    required double grams,
    this.rowid = const Value.absent(),
  }) : productId = Value(productId),
       label = Value(label),
       grams = Value(grams);
  static Insertable<ProductServing> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? productId,
    Expression<String>? label,
    Expression<double>? grams,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (productId != null) 'product_id': productId,
      if (label != null) 'label': label,
      if (grams != null) 'grams': grams,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductServingsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? productId,
    Value<String>? label,
    Value<double>? grams,
    Value<int>? rowid,
  }) {
    return ProductServingsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      productId: productId ?? this.productId,
      label: label ?? this.label,
      grams: grams ?? this.grams,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (grams.present) {
      map['grams'] = Variable<double>(grams.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductServingsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('productId: $productId, ')
          ..write('label: $label, ')
          ..write('grams: $grams, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DishesTable extends Dishes with TableInfo<$DishesTable, Dish> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DishesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: newId,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<ContentVisibility, String>
  visibility = GeneratedColumn<String>(
    'visibility',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: Constant(ContentVisibility.private.name),
  ).withConverter<ContentVisibility>($DishesTable.$convertervisibility);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 200,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cookedWeightGMeta = const VerificationMeta(
    'cookedWeightG',
  );
  @override
  late final GeneratedColumn<double> cookedWeightG = GeneratedColumn<double>(
    'cooked_weight_g',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    ownerId,
    visibility,
    name,
    description,
    cookedWeightG,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dishes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Dish> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('cooked_weight_g')) {
      context.handle(
        _cookedWeightGMeta,
        cookedWeightG.isAcceptableOrUnknown(
          data['cooked_weight_g']!,
          _cookedWeightGMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Dish map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Dish(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      ),
      visibility: $DishesTable.$convertervisibility.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}visibility'],
        )!,
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      cookedWeightG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cooked_weight_g'],
      ),
    );
  }

  @override
  $DishesTable createAlias(String alias) {
    return $DishesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ContentVisibility, String, String>
  $convertervisibility = const EnumNameConverter<ContentVisibility>(
    ContentVisibility.values,
  );
}

class Dish extends DataClass implements Insertable<Dish> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? ownerId;
  final ContentVisibility visibility;
  final String name;
  final String? description;

  /// Weight of the finished dish. Null → sum of raw ingredient weights.
  final double? cookedWeightG;
  const Dish({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.ownerId,
    required this.visibility,
    required this.name,
    this.description,
    this.cookedWeightG,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || ownerId != null) {
      map['owner_id'] = Variable<String>(ownerId);
    }
    {
      map['visibility'] = Variable<String>(
        $DishesTable.$convertervisibility.toSql(visibility),
      );
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || cookedWeightG != null) {
      map['cooked_weight_g'] = Variable<double>(cookedWeightG);
    }
    return map;
  }

  DishesCompanion toCompanion(bool nullToAbsent) {
    return DishesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      ownerId: ownerId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerId),
      visibility: Value(visibility),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      cookedWeightG: cookedWeightG == null && nullToAbsent
          ? const Value.absent()
          : Value(cookedWeightG),
    );
  }

  factory Dish.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Dish(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      ownerId: serializer.fromJson<String?>(json['ownerId']),
      visibility: $DishesTable.$convertervisibility.fromJson(
        serializer.fromJson<String>(json['visibility']),
      ),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      cookedWeightG: serializer.fromJson<double?>(json['cookedWeightG']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'ownerId': serializer.toJson<String?>(ownerId),
      'visibility': serializer.toJson<String>(
        $DishesTable.$convertervisibility.toJson(visibility),
      ),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'cookedWeightG': serializer.toJson<double?>(cookedWeightG),
    };
  }

  Dish copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> ownerId = const Value.absent(),
    ContentVisibility? visibility,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<double?> cookedWeightG = const Value.absent(),
  }) => Dish(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    ownerId: ownerId.present ? ownerId.value : this.ownerId,
    visibility: visibility ?? this.visibility,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    cookedWeightG: cookedWeightG.present
        ? cookedWeightG.value
        : this.cookedWeightG,
  );
  Dish copyWithCompanion(DishesCompanion data) {
    return Dish(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      visibility: data.visibility.present
          ? data.visibility.value
          : this.visibility,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      cookedWeightG: data.cookedWeightG.present
          ? data.cookedWeightG.value
          : this.cookedWeightG,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Dish(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('ownerId: $ownerId, ')
          ..write('visibility: $visibility, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('cookedWeightG: $cookedWeightG')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    ownerId,
    visibility,
    name,
    description,
    cookedWeightG,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Dish &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.ownerId == this.ownerId &&
          other.visibility == this.visibility &&
          other.name == this.name &&
          other.description == this.description &&
          other.cookedWeightG == this.cookedWeightG);
}

class DishesCompanion extends UpdateCompanion<Dish> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String?> ownerId;
  final Value<ContentVisibility> visibility;
  final Value<String> name;
  final Value<String?> description;
  final Value<double?> cookedWeightG;
  final Value<int> rowid;
  const DishesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.visibility = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.cookedWeightG = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DishesCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.visibility = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.cookedWeightG = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Dish> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? ownerId,
    Expression<String>? visibility,
    Expression<String>? name,
    Expression<String>? description,
    Expression<double>? cookedWeightG,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (ownerId != null) 'owner_id': ownerId,
      if (visibility != null) 'visibility': visibility,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (cookedWeightG != null) 'cooked_weight_g': cookedWeightG,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DishesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String?>? ownerId,
    Value<ContentVisibility>? visibility,
    Value<String>? name,
    Value<String?>? description,
    Value<double?>? cookedWeightG,
    Value<int>? rowid,
  }) {
    return DishesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      ownerId: ownerId ?? this.ownerId,
      visibility: visibility ?? this.visibility,
      name: name ?? this.name,
      description: description ?? this.description,
      cookedWeightG: cookedWeightG ?? this.cookedWeightG,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (visibility.present) {
      map['visibility'] = Variable<String>(
        $DishesTable.$convertervisibility.toSql(visibility.value),
      );
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (cookedWeightG.present) {
      map['cooked_weight_g'] = Variable<double>(cookedWeightG.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DishesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('ownerId: $ownerId, ')
          ..write('visibility: $visibility, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('cookedWeightG: $cookedWeightG, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DishItemsTable extends DishItems
    with TableInfo<$DishItemsTable, DishItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DishItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: newId,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dishIdMeta = const VerificationMeta('dishId');
  @override
  late final GeneratedColumn<String> dishId = GeneratedColumn<String>(
    'dish_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES dishes (id)',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _gramsMeta = const VerificationMeta('grams');
  @override
  late final GeneratedColumn<double> grams = GeneratedColumn<double>(
    'grams',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    dishId,
    productId,
    grams,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dish_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<DishItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('dish_id')) {
      context.handle(
        _dishIdMeta,
        dishId.isAcceptableOrUnknown(data['dish_id']!, _dishIdMeta),
      );
    } else if (isInserting) {
      context.missing(_dishIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('grams')) {
      context.handle(
        _gramsMeta,
        grams.isAcceptableOrUnknown(data['grams']!, _gramsMeta),
      );
    } else if (isInserting) {
      context.missing(_gramsMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DishItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DishItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      dishId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dish_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      grams: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}grams'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $DishItemsTable createAlias(String alias) {
    return $DishItemsTable(attachedDatabase, alias);
  }
}

class DishItem extends DataClass implements Insertable<DishItem> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String dishId;
  final String productId;
  final double grams;
  final int sortOrder;
  const DishItem({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.dishId,
    required this.productId,
    required this.grams,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['dish_id'] = Variable<String>(dishId);
    map['product_id'] = Variable<String>(productId);
    map['grams'] = Variable<double>(grams);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  DishItemsCompanion toCompanion(bool nullToAbsent) {
    return DishItemsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      dishId: Value(dishId),
      productId: Value(productId),
      grams: Value(grams),
      sortOrder: Value(sortOrder),
    );
  }

  factory DishItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DishItem(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      dishId: serializer.fromJson<String>(json['dishId']),
      productId: serializer.fromJson<String>(json['productId']),
      grams: serializer.fromJson<double>(json['grams']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'dishId': serializer.toJson<String>(dishId),
      'productId': serializer.toJson<String>(productId),
      'grams': serializer.toJson<double>(grams),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  DishItem copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? dishId,
    String? productId,
    double? grams,
    int? sortOrder,
  }) => DishItem(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    dishId: dishId ?? this.dishId,
    productId: productId ?? this.productId,
    grams: grams ?? this.grams,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  DishItem copyWithCompanion(DishItemsCompanion data) {
    return DishItem(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      dishId: data.dishId.present ? data.dishId.value : this.dishId,
      productId: data.productId.present ? data.productId.value : this.productId,
      grams: data.grams.present ? data.grams.value : this.grams,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DishItem(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('dishId: $dishId, ')
          ..write('productId: $productId, ')
          ..write('grams: $grams, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    dishId,
    productId,
    grams,
    sortOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DishItem &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.dishId == this.dishId &&
          other.productId == this.productId &&
          other.grams == this.grams &&
          other.sortOrder == this.sortOrder);
}

class DishItemsCompanion extends UpdateCompanion<DishItem> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> dishId;
  final Value<String> productId;
  final Value<double> grams;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const DishItemsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.dishId = const Value.absent(),
    this.productId = const Value.absent(),
    this.grams = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DishItemsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String dishId,
    required String productId,
    required double grams,
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : dishId = Value(dishId),
       productId = Value(productId),
       grams = Value(grams);
  static Insertable<DishItem> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? dishId,
    Expression<String>? productId,
    Expression<double>? grams,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (dishId != null) 'dish_id': dishId,
      if (productId != null) 'product_id': productId,
      if (grams != null) 'grams': grams,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DishItemsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? dishId,
    Value<String>? productId,
    Value<double>? grams,
    Value<int>? sortOrder,
    Value<int>? rowid,
  }) {
    return DishItemsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      dishId: dishId ?? this.dishId,
      productId: productId ?? this.productId,
      grams: grams ?? this.grams,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (dishId.present) {
      map['dish_id'] = Variable<String>(dishId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (grams.present) {
      map['grams'] = Variable<double>(grams.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DishItemsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('dishId: $dishId, ')
          ..write('productId: $productId, ')
          ..write('grams: $grams, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MealGroupsTable extends MealGroups
    with TableInfo<$MealGroupsTable, MealGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: newId,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _systemKeyMeta = const VerificationMeta(
    'systemKey',
  );
  @override
  late final GeneratedColumn<String> systemKey = GeneratedColumn<String>(
    'system_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _customNameMeta = const VerificationMeta(
    'customName',
  );
  @override
  late final GeneratedColumn<String> customName = GeneratedColumn<String>(
    'custom_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isHiddenMeta = const VerificationMeta(
    'isHidden',
  );
  @override
  late final GeneratedColumn<bool> isHidden = GeneratedColumn<bool>(
    'is_hidden',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_hidden" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    systemKey,
    customName,
    sortOrder,
    isHidden,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_groups';
  @override
  VerificationContext validateIntegrity(
    Insertable<MealGroup> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('system_key')) {
      context.handle(
        _systemKeyMeta,
        systemKey.isAcceptableOrUnknown(data['system_key']!, _systemKeyMeta),
      );
    }
    if (data.containsKey('custom_name')) {
      context.handle(
        _customNameMeta,
        customName.isAcceptableOrUnknown(data['custom_name']!, _customNameMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('is_hidden')) {
      context.handle(
        _isHiddenMeta,
        isHidden.isAcceptableOrUnknown(data['is_hidden']!, _isHiddenMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealGroup(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      systemKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}system_key'],
      ),
      customName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}custom_name'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      isHidden: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_hidden'],
      )!,
    );
  }

  @override
  $MealGroupsTable createAlias(String alias) {
    return $MealGroupsTable(attachedDatabase, alias);
  }
}

class MealGroup extends DataClass implements Insertable<MealGroup> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? systemKey;
  final String? customName;
  final int sortOrder;
  final bool isHidden;
  const MealGroup({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.systemKey,
    this.customName,
    required this.sortOrder,
    required this.isHidden,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || systemKey != null) {
      map['system_key'] = Variable<String>(systemKey);
    }
    if (!nullToAbsent || customName != null) {
      map['custom_name'] = Variable<String>(customName);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    map['is_hidden'] = Variable<bool>(isHidden);
    return map;
  }

  MealGroupsCompanion toCompanion(bool nullToAbsent) {
    return MealGroupsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      systemKey: systemKey == null && nullToAbsent
          ? const Value.absent()
          : Value(systemKey),
      customName: customName == null && nullToAbsent
          ? const Value.absent()
          : Value(customName),
      sortOrder: Value(sortOrder),
      isHidden: Value(isHidden),
    );
  }

  factory MealGroup.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealGroup(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      systemKey: serializer.fromJson<String?>(json['systemKey']),
      customName: serializer.fromJson<String?>(json['customName']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      isHidden: serializer.fromJson<bool>(json['isHidden']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'systemKey': serializer.toJson<String?>(systemKey),
      'customName': serializer.toJson<String?>(customName),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'isHidden': serializer.toJson<bool>(isHidden),
    };
  }

  MealGroup copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> systemKey = const Value.absent(),
    Value<String?> customName = const Value.absent(),
    int? sortOrder,
    bool? isHidden,
  }) => MealGroup(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    systemKey: systemKey.present ? systemKey.value : this.systemKey,
    customName: customName.present ? customName.value : this.customName,
    sortOrder: sortOrder ?? this.sortOrder,
    isHidden: isHidden ?? this.isHidden,
  );
  MealGroup copyWithCompanion(MealGroupsCompanion data) {
    return MealGroup(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      systemKey: data.systemKey.present ? data.systemKey.value : this.systemKey,
      customName: data.customName.present
          ? data.customName.value
          : this.customName,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      isHidden: data.isHidden.present ? data.isHidden.value : this.isHidden,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealGroup(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('systemKey: $systemKey, ')
          ..write('customName: $customName, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isHidden: $isHidden')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    systemKey,
    customName,
    sortOrder,
    isHidden,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealGroup &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.systemKey == this.systemKey &&
          other.customName == this.customName &&
          other.sortOrder == this.sortOrder &&
          other.isHidden == this.isHidden);
}

class MealGroupsCompanion extends UpdateCompanion<MealGroup> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String?> systemKey;
  final Value<String?> customName;
  final Value<int> sortOrder;
  final Value<bool> isHidden;
  final Value<int> rowid;
  const MealGroupsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.systemKey = const Value.absent(),
    this.customName = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isHidden = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MealGroupsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.systemKey = const Value.absent(),
    this.customName = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isHidden = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<MealGroup> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? systemKey,
    Expression<String>? customName,
    Expression<int>? sortOrder,
    Expression<bool>? isHidden,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (systemKey != null) 'system_key': systemKey,
      if (customName != null) 'custom_name': customName,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (isHidden != null) 'is_hidden': isHidden,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MealGroupsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String?>? systemKey,
    Value<String?>? customName,
    Value<int>? sortOrder,
    Value<bool>? isHidden,
    Value<int>? rowid,
  }) {
    return MealGroupsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      systemKey: systemKey ?? this.systemKey,
      customName: customName ?? this.customName,
      sortOrder: sortOrder ?? this.sortOrder,
      isHidden: isHidden ?? this.isHidden,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (systemKey.present) {
      map['system_key'] = Variable<String>(systemKey.value);
    }
    if (customName.present) {
      map['custom_name'] = Variable<String>(customName.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (isHidden.present) {
      map['is_hidden'] = Variable<bool>(isHidden.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealGroupsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('systemKey: $systemKey, ')
          ..write('customName: $customName, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isHidden: $isHidden, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DishMealGroupsTable extends DishMealGroups
    with TableInfo<$DishMealGroupsTable, DishMealGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DishMealGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: newId,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dishIdMeta = const VerificationMeta('dishId');
  @override
  late final GeneratedColumn<String> dishId = GeneratedColumn<String>(
    'dish_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES dishes (id)',
    ),
  );
  static const VerificationMeta _mealGroupIdMeta = const VerificationMeta(
    'mealGroupId',
  );
  @override
  late final GeneratedColumn<String> mealGroupId = GeneratedColumn<String>(
    'meal_group_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES meal_groups (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    dishId,
    mealGroupId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dish_meal_groups';
  @override
  VerificationContext validateIntegrity(
    Insertable<DishMealGroup> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('dish_id')) {
      context.handle(
        _dishIdMeta,
        dishId.isAcceptableOrUnknown(data['dish_id']!, _dishIdMeta),
      );
    } else if (isInserting) {
      context.missing(_dishIdMeta);
    }
    if (data.containsKey('meal_group_id')) {
      context.handle(
        _mealGroupIdMeta,
        mealGroupId.isAcceptableOrUnknown(
          data['meal_group_id']!,
          _mealGroupIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mealGroupIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {dishId, mealGroupId},
  ];
  @override
  DishMealGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DishMealGroup(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      dishId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dish_id'],
      )!,
      mealGroupId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meal_group_id'],
      )!,
    );
  }

  @override
  $DishMealGroupsTable createAlias(String alias) {
    return $DishMealGroupsTable(attachedDatabase, alias);
  }
}

class DishMealGroup extends DataClass implements Insertable<DishMealGroup> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String dishId;
  final String mealGroupId;
  const DishMealGroup({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.dishId,
    required this.mealGroupId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['dish_id'] = Variable<String>(dishId);
    map['meal_group_id'] = Variable<String>(mealGroupId);
    return map;
  }

  DishMealGroupsCompanion toCompanion(bool nullToAbsent) {
    return DishMealGroupsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      dishId: Value(dishId),
      mealGroupId: Value(mealGroupId),
    );
  }

  factory DishMealGroup.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DishMealGroup(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      dishId: serializer.fromJson<String>(json['dishId']),
      mealGroupId: serializer.fromJson<String>(json['mealGroupId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'dishId': serializer.toJson<String>(dishId),
      'mealGroupId': serializer.toJson<String>(mealGroupId),
    };
  }

  DishMealGroup copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? dishId,
    String? mealGroupId,
  }) => DishMealGroup(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    dishId: dishId ?? this.dishId,
    mealGroupId: mealGroupId ?? this.mealGroupId,
  );
  DishMealGroup copyWithCompanion(DishMealGroupsCompanion data) {
    return DishMealGroup(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      dishId: data.dishId.present ? data.dishId.value : this.dishId,
      mealGroupId: data.mealGroupId.present
          ? data.mealGroupId.value
          : this.mealGroupId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DishMealGroup(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('dishId: $dishId, ')
          ..write('mealGroupId: $mealGroupId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, updatedAt, deletedAt, dishId, mealGroupId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DishMealGroup &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.dishId == this.dishId &&
          other.mealGroupId == this.mealGroupId);
}

class DishMealGroupsCompanion extends UpdateCompanion<DishMealGroup> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> dishId;
  final Value<String> mealGroupId;
  final Value<int> rowid;
  const DishMealGroupsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.dishId = const Value.absent(),
    this.mealGroupId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DishMealGroupsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String dishId,
    required String mealGroupId,
    this.rowid = const Value.absent(),
  }) : dishId = Value(dishId),
       mealGroupId = Value(mealGroupId);
  static Insertable<DishMealGroup> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? dishId,
    Expression<String>? mealGroupId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (dishId != null) 'dish_id': dishId,
      if (mealGroupId != null) 'meal_group_id': mealGroupId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DishMealGroupsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? dishId,
    Value<String>? mealGroupId,
    Value<int>? rowid,
  }) {
    return DishMealGroupsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      dishId: dishId ?? this.dishId,
      mealGroupId: mealGroupId ?? this.mealGroupId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (dishId.present) {
      map['dish_id'] = Variable<String>(dishId.value);
    }
    if (mealGroupId.present) {
      map['meal_group_id'] = Variable<String>(mealGroupId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DishMealGroupsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('dishId: $dishId, ')
          ..write('mealGroupId: $mealGroupId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MediaTable extends Media with TableInfo<$MediaTable, MediaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: newId,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<MediaOwner, String> ownerType =
      GeneratedColumn<String>(
        'owner_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<MediaOwner>($MediaTable.$converterownerType);
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<MediaKind, String> kind =
      GeneratedColumn<String>(
        'kind',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<MediaKind>($MediaTable.$converterkind);
  static const VerificationMeta _localPathMeta = const VerificationMeta(
    'localPath',
  );
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
    'local_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _remoteUrlMeta = const VerificationMeta(
    'remoteUrl',
  );
  @override
  late final GeneratedColumn<String> remoteUrl = GeneratedColumn<String>(
    'remote_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thumbPathMeta = const VerificationMeta(
    'thumbPath',
  );
  @override
  late final GeneratedColumn<String> thumbPath = GeneratedColumn<String>(
    'thumb_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<int> width = GeneratedColumn<int>(
    'width',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
    'height',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationSMeta = const VerificationMeta(
    'durationS',
  );
  @override
  late final GeneratedColumn<double> durationS = GeneratedColumn<double>(
    'duration_s',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    ownerType,
    ownerId,
    kind,
    localPath,
    remoteUrl,
    thumbPath,
    sortOrder,
    width,
    height,
    durationS,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media';
  @override
  VerificationContext validateIntegrity(
    Insertable<MediaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('local_path')) {
      context.handle(
        _localPathMeta,
        localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta),
      );
    }
    if (data.containsKey('remote_url')) {
      context.handle(
        _remoteUrlMeta,
        remoteUrl.isAcceptableOrUnknown(data['remote_url']!, _remoteUrlMeta),
      );
    }
    if (data.containsKey('thumb_path')) {
      context.handle(
        _thumbPathMeta,
        thumbPath.isAcceptableOrUnknown(data['thumb_path']!, _thumbPathMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('width')) {
      context.handle(
        _widthMeta,
        width.isAcceptableOrUnknown(data['width']!, _widthMeta),
      );
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    }
    if (data.containsKey('duration_s')) {
      context.handle(
        _durationSMeta,
        durationS.isAcceptableOrUnknown(data['duration_s']!, _durationSMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MediaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      ownerType: $MediaTable.$converterownerType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}owner_type'],
        )!,
      ),
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      )!,
      kind: $MediaTable.$converterkind.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}kind'],
        )!,
      ),
      localPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_path'],
      ),
      remoteUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_url'],
      ),
      thumbPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumb_path'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      width: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}width'],
      ),
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}height'],
      ),
      durationS: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}duration_s'],
      ),
    );
  }

  @override
  $MediaTable createAlias(String alias) {
    return $MediaTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MediaOwner, String, String> $converterownerType =
      const EnumNameConverter<MediaOwner>(MediaOwner.values);
  static JsonTypeConverter2<MediaKind, String, String> $converterkind =
      const EnumNameConverter<MediaKind>(MediaKind.values);
}

class MediaData extends DataClass implements Insertable<MediaData> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final MediaOwner ownerType;
  final String ownerId;
  final MediaKind kind;
  final String? localPath;
  final String? remoteUrl;
  final String? thumbPath;
  final int sortOrder;
  final int? width;
  final int? height;
  final double? durationS;
  const MediaData({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.ownerType,
    required this.ownerId,
    required this.kind,
    this.localPath,
    this.remoteUrl,
    this.thumbPath,
    required this.sortOrder,
    this.width,
    this.height,
    this.durationS,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    {
      map['owner_type'] = Variable<String>(
        $MediaTable.$converterownerType.toSql(ownerType),
      );
    }
    map['owner_id'] = Variable<String>(ownerId);
    {
      map['kind'] = Variable<String>($MediaTable.$converterkind.toSql(kind));
    }
    if (!nullToAbsent || localPath != null) {
      map['local_path'] = Variable<String>(localPath);
    }
    if (!nullToAbsent || remoteUrl != null) {
      map['remote_url'] = Variable<String>(remoteUrl);
    }
    if (!nullToAbsent || thumbPath != null) {
      map['thumb_path'] = Variable<String>(thumbPath);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    if (!nullToAbsent || width != null) {
      map['width'] = Variable<int>(width);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<int>(height);
    }
    if (!nullToAbsent || durationS != null) {
      map['duration_s'] = Variable<double>(durationS);
    }
    return map;
  }

  MediaCompanion toCompanion(bool nullToAbsent) {
    return MediaCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      ownerType: Value(ownerType),
      ownerId: Value(ownerId),
      kind: Value(kind),
      localPath: localPath == null && nullToAbsent
          ? const Value.absent()
          : Value(localPath),
      remoteUrl: remoteUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteUrl),
      thumbPath: thumbPath == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbPath),
      sortOrder: Value(sortOrder),
      width: width == null && nullToAbsent
          ? const Value.absent()
          : Value(width),
      height: height == null && nullToAbsent
          ? const Value.absent()
          : Value(height),
      durationS: durationS == null && nullToAbsent
          ? const Value.absent()
          : Value(durationS),
    );
  }

  factory MediaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaData(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      ownerType: $MediaTable.$converterownerType.fromJson(
        serializer.fromJson<String>(json['ownerType']),
      ),
      ownerId: serializer.fromJson<String>(json['ownerId']),
      kind: $MediaTable.$converterkind.fromJson(
        serializer.fromJson<String>(json['kind']),
      ),
      localPath: serializer.fromJson<String?>(json['localPath']),
      remoteUrl: serializer.fromJson<String?>(json['remoteUrl']),
      thumbPath: serializer.fromJson<String?>(json['thumbPath']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      width: serializer.fromJson<int?>(json['width']),
      height: serializer.fromJson<int?>(json['height']),
      durationS: serializer.fromJson<double?>(json['durationS']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'ownerType': serializer.toJson<String>(
        $MediaTable.$converterownerType.toJson(ownerType),
      ),
      'ownerId': serializer.toJson<String>(ownerId),
      'kind': serializer.toJson<String>(
        $MediaTable.$converterkind.toJson(kind),
      ),
      'localPath': serializer.toJson<String?>(localPath),
      'remoteUrl': serializer.toJson<String?>(remoteUrl),
      'thumbPath': serializer.toJson<String?>(thumbPath),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'width': serializer.toJson<int?>(width),
      'height': serializer.toJson<int?>(height),
      'durationS': serializer.toJson<double?>(durationS),
    };
  }

  MediaData copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    MediaOwner? ownerType,
    String? ownerId,
    MediaKind? kind,
    Value<String?> localPath = const Value.absent(),
    Value<String?> remoteUrl = const Value.absent(),
    Value<String?> thumbPath = const Value.absent(),
    int? sortOrder,
    Value<int?> width = const Value.absent(),
    Value<int?> height = const Value.absent(),
    Value<double?> durationS = const Value.absent(),
  }) => MediaData(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    ownerType: ownerType ?? this.ownerType,
    ownerId: ownerId ?? this.ownerId,
    kind: kind ?? this.kind,
    localPath: localPath.present ? localPath.value : this.localPath,
    remoteUrl: remoteUrl.present ? remoteUrl.value : this.remoteUrl,
    thumbPath: thumbPath.present ? thumbPath.value : this.thumbPath,
    sortOrder: sortOrder ?? this.sortOrder,
    width: width.present ? width.value : this.width,
    height: height.present ? height.value : this.height,
    durationS: durationS.present ? durationS.value : this.durationS,
  );
  MediaData copyWithCompanion(MediaCompanion data) {
    return MediaData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      ownerType: data.ownerType.present ? data.ownerType.value : this.ownerType,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      kind: data.kind.present ? data.kind.value : this.kind,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      remoteUrl: data.remoteUrl.present ? data.remoteUrl.value : this.remoteUrl,
      thumbPath: data.thumbPath.present ? data.thumbPath.value : this.thumbPath,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      width: data.width.present ? data.width.value : this.width,
      height: data.height.present ? data.height.value : this.height,
      durationS: data.durationS.present ? data.durationS.value : this.durationS,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('ownerType: $ownerType, ')
          ..write('ownerId: $ownerId, ')
          ..write('kind: $kind, ')
          ..write('localPath: $localPath, ')
          ..write('remoteUrl: $remoteUrl, ')
          ..write('thumbPath: $thumbPath, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('durationS: $durationS')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    ownerType,
    ownerId,
    kind,
    localPath,
    remoteUrl,
    thumbPath,
    sortOrder,
    width,
    height,
    durationS,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.ownerType == this.ownerType &&
          other.ownerId == this.ownerId &&
          other.kind == this.kind &&
          other.localPath == this.localPath &&
          other.remoteUrl == this.remoteUrl &&
          other.thumbPath == this.thumbPath &&
          other.sortOrder == this.sortOrder &&
          other.width == this.width &&
          other.height == this.height &&
          other.durationS == this.durationS);
}

class MediaCompanion extends UpdateCompanion<MediaData> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<MediaOwner> ownerType;
  final Value<String> ownerId;
  final Value<MediaKind> kind;
  final Value<String?> localPath;
  final Value<String?> remoteUrl;
  final Value<String?> thumbPath;
  final Value<int> sortOrder;
  final Value<int?> width;
  final Value<int?> height;
  final Value<double?> durationS;
  final Value<int> rowid;
  const MediaCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.ownerType = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.kind = const Value.absent(),
    this.localPath = const Value.absent(),
    this.remoteUrl = const Value.absent(),
    this.thumbPath = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.durationS = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required MediaOwner ownerType,
    required String ownerId,
    required MediaKind kind,
    this.localPath = const Value.absent(),
    this.remoteUrl = const Value.absent(),
    this.thumbPath = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.durationS = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : ownerType = Value(ownerType),
       ownerId = Value(ownerId),
       kind = Value(kind);
  static Insertable<MediaData> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? ownerType,
    Expression<String>? ownerId,
    Expression<String>? kind,
    Expression<String>? localPath,
    Expression<String>? remoteUrl,
    Expression<String>? thumbPath,
    Expression<int>? sortOrder,
    Expression<int>? width,
    Expression<int>? height,
    Expression<double>? durationS,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (ownerType != null) 'owner_type': ownerType,
      if (ownerId != null) 'owner_id': ownerId,
      if (kind != null) 'kind': kind,
      if (localPath != null) 'local_path': localPath,
      if (remoteUrl != null) 'remote_url': remoteUrl,
      if (thumbPath != null) 'thumb_path': thumbPath,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (durationS != null) 'duration_s': durationS,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<MediaOwner>? ownerType,
    Value<String>? ownerId,
    Value<MediaKind>? kind,
    Value<String?>? localPath,
    Value<String?>? remoteUrl,
    Value<String?>? thumbPath,
    Value<int>? sortOrder,
    Value<int?>? width,
    Value<int?>? height,
    Value<double?>? durationS,
    Value<int>? rowid,
  }) {
    return MediaCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      ownerType: ownerType ?? this.ownerType,
      ownerId: ownerId ?? this.ownerId,
      kind: kind ?? this.kind,
      localPath: localPath ?? this.localPath,
      remoteUrl: remoteUrl ?? this.remoteUrl,
      thumbPath: thumbPath ?? this.thumbPath,
      sortOrder: sortOrder ?? this.sortOrder,
      width: width ?? this.width,
      height: height ?? this.height,
      durationS: durationS ?? this.durationS,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (ownerType.present) {
      map['owner_type'] = Variable<String>(
        $MediaTable.$converterownerType.toSql(ownerType.value),
      );
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(
        $MediaTable.$converterkind.toSql(kind.value),
      );
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (remoteUrl.present) {
      map['remote_url'] = Variable<String>(remoteUrl.value);
    }
    if (thumbPath.present) {
      map['thumb_path'] = Variable<String>(thumbPath.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (durationS.present) {
      map['duration_s'] = Variable<double>(durationS.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('ownerType: $ownerType, ')
          ..write('ownerId: $ownerId, ')
          ..write('kind: $kind, ')
          ..write('localPath: $localPath, ')
          ..write('remoteUrl: $remoteUrl, ')
          ..write('thumbPath: $thumbPath, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('durationS: $durationS, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MediaBlobsTable extends MediaBlobs
    with TableInfo<$MediaBlobsTable, MediaBlob> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaBlobsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bytesMeta = const VerificationMeta('bytes');
  @override
  late final GeneratedColumn<Uint8List> bytes = GeneratedColumn<Uint8List>(
    'bytes',
    aliasedName,
    false,
    type: DriftSqlType.blob,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, bytes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_blobs';
  @override
  VerificationContext validateIntegrity(
    Insertable<MediaBlob> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('bytes')) {
      context.handle(
        _bytesMeta,
        bytes.isAcceptableOrUnknown(data['bytes']!, _bytesMeta),
      );
    } else if (isInserting) {
      context.missing(_bytesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  MediaBlob map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaBlob(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      bytes: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}bytes'],
      )!,
    );
  }

  @override
  $MediaBlobsTable createAlias(String alias) {
    return $MediaBlobsTable(attachedDatabase, alias);
  }
}

class MediaBlob extends DataClass implements Insertable<MediaBlob> {
  final String key;
  final Uint8List bytes;
  const MediaBlob({required this.key, required this.bytes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['bytes'] = Variable<Uint8List>(bytes);
    return map;
  }

  MediaBlobsCompanion toCompanion(bool nullToAbsent) {
    return MediaBlobsCompanion(key: Value(key), bytes: Value(bytes));
  }

  factory MediaBlob.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaBlob(
      key: serializer.fromJson<String>(json['key']),
      bytes: serializer.fromJson<Uint8List>(json['bytes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'bytes': serializer.toJson<Uint8List>(bytes),
    };
  }

  MediaBlob copyWith({String? key, Uint8List? bytes}) =>
      MediaBlob(key: key ?? this.key, bytes: bytes ?? this.bytes);
  MediaBlob copyWithCompanion(MediaBlobsCompanion data) {
    return MediaBlob(
      key: data.key.present ? data.key.value : this.key,
      bytes: data.bytes.present ? data.bytes.value : this.bytes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaBlob(')
          ..write('key: $key, ')
          ..write('bytes: $bytes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, $driftBlobEquality.hash(bytes));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaBlob &&
          other.key == this.key &&
          $driftBlobEquality.equals(other.bytes, this.bytes));
}

class MediaBlobsCompanion extends UpdateCompanion<MediaBlob> {
  final Value<String> key;
  final Value<Uint8List> bytes;
  final Value<int> rowid;
  const MediaBlobsCompanion({
    this.key = const Value.absent(),
    this.bytes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaBlobsCompanion.insert({
    required String key,
    required Uint8List bytes,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       bytes = Value(bytes);
  static Insertable<MediaBlob> custom({
    Expression<String>? key,
    Expression<Uint8List>? bytes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (bytes != null) 'bytes': bytes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaBlobsCompanion copyWith({
    Value<String>? key,
    Value<Uint8List>? bytes,
    Value<int>? rowid,
  }) {
    return MediaBlobsCompanion(
      key: key ?? this.key,
      bytes: bytes ?? this.bytes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (bytes.present) {
      map['bytes'] = Variable<Uint8List>(bytes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaBlobsCompanion(')
          ..write('key: $key, ')
          ..write('bytes: $bytes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DiaryEntriesTable extends DiaryEntries
    with TableInfo<$DiaryEntriesTable, DiaryEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiaryEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: newId,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<String> day = GeneratedColumn<String>(
    'day',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 10,
      maxTextLength: 10,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mealGroupIdMeta = const VerificationMeta(
    'mealGroupId',
  );
  @override
  late final GeneratedColumn<String> mealGroupId = GeneratedColumn<String>(
    'meal_group_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES meal_groups (id)',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _dishIdMeta = const VerificationMeta('dishId');
  @override
  late final GeneratedColumn<String> dishId = GeneratedColumn<String>(
    'dish_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES dishes (id)',
    ),
  );
  static const VerificationMeta _gramsMeta = const VerificationMeta('grams');
  @override
  late final GeneratedColumn<double> grams = GeneratedColumn<double>(
    'grams',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _snapshotKcalMeta = const VerificationMeta(
    'snapshotKcal',
  );
  @override
  late final GeneratedColumn<double> snapshotKcal = GeneratedColumn<double>(
    'snapshot_kcal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _snapshotProteinMeta = const VerificationMeta(
    'snapshotProtein',
  );
  @override
  late final GeneratedColumn<double> snapshotProtein = GeneratedColumn<double>(
    'snapshot_protein',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _snapshotFatMeta = const VerificationMeta(
    'snapshotFat',
  );
  @override
  late final GeneratedColumn<double> snapshotFat = GeneratedColumn<double>(
    'snapshot_fat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _snapshotCarbsMeta = const VerificationMeta(
    'snapshotCarbs',
  );
  @override
  late final GeneratedColumn<double> snapshotCarbs = GeneratedColumn<double>(
    'snapshot_carbs',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _snapshotExtraMeta = const VerificationMeta(
    'snapshotExtra',
  );
  @override
  late final GeneratedColumn<String> snapshotExtra = GeneratedColumn<String>(
    'snapshot_extra',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    day,
    mealGroupId,
    productId,
    dishId,
    grams,
    snapshotKcal,
    snapshotProtein,
    snapshotFat,
    snapshotCarbs,
    snapshotExtra,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'diary_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<DiaryEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('day')) {
      context.handle(
        _dayMeta,
        day.isAcceptableOrUnknown(data['day']!, _dayMeta),
      );
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    if (data.containsKey('meal_group_id')) {
      context.handle(
        _mealGroupIdMeta,
        mealGroupId.isAcceptableOrUnknown(
          data['meal_group_id']!,
          _mealGroupIdMeta,
        ),
      );
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    }
    if (data.containsKey('dish_id')) {
      context.handle(
        _dishIdMeta,
        dishId.isAcceptableOrUnknown(data['dish_id']!, _dishIdMeta),
      );
    }
    if (data.containsKey('grams')) {
      context.handle(
        _gramsMeta,
        grams.isAcceptableOrUnknown(data['grams']!, _gramsMeta),
      );
    } else if (isInserting) {
      context.missing(_gramsMeta);
    }
    if (data.containsKey('snapshot_kcal')) {
      context.handle(
        _snapshotKcalMeta,
        snapshotKcal.isAcceptableOrUnknown(
          data['snapshot_kcal']!,
          _snapshotKcalMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_snapshotKcalMeta);
    }
    if (data.containsKey('snapshot_protein')) {
      context.handle(
        _snapshotProteinMeta,
        snapshotProtein.isAcceptableOrUnknown(
          data['snapshot_protein']!,
          _snapshotProteinMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_snapshotProteinMeta);
    }
    if (data.containsKey('snapshot_fat')) {
      context.handle(
        _snapshotFatMeta,
        snapshotFat.isAcceptableOrUnknown(
          data['snapshot_fat']!,
          _snapshotFatMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_snapshotFatMeta);
    }
    if (data.containsKey('snapshot_carbs')) {
      context.handle(
        _snapshotCarbsMeta,
        snapshotCarbs.isAcceptableOrUnknown(
          data['snapshot_carbs']!,
          _snapshotCarbsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_snapshotCarbsMeta);
    }
    if (data.containsKey('snapshot_extra')) {
      context.handle(
        _snapshotExtraMeta,
        snapshotExtra.isAcceptableOrUnknown(
          data['snapshot_extra']!,
          _snapshotExtraMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DiaryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DiaryEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      day: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}day'],
      )!,
      mealGroupId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meal_group_id'],
      ),
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      ),
      dishId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dish_id'],
      ),
      grams: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}grams'],
      )!,
      snapshotKcal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}snapshot_kcal'],
      )!,
      snapshotProtein: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}snapshot_protein'],
      )!,
      snapshotFat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}snapshot_fat'],
      )!,
      snapshotCarbs: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}snapshot_carbs'],
      )!,
      snapshotExtra: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}snapshot_extra'],
      ),
    );
  }

  @override
  $DiaryEntriesTable createAlias(String alias) {
    return $DiaryEntriesTable(attachedDatabase, alias);
  }
}

class DiaryEntry extends DataClass implements Insertable<DiaryEntry> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  /// Local calendar day as `yyyy-MM-dd` — independent of time zones.
  final String day;
  final String? mealGroupId;
  final String? productId;
  final String? dishId;
  final double grams;
  final double snapshotKcal;
  final double snapshotProtein;
  final double snapshotFat;
  final double snapshotCarbs;
  final String? snapshotExtra;
  const DiaryEntry({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.day,
    this.mealGroupId,
    this.productId,
    this.dishId,
    required this.grams,
    required this.snapshotKcal,
    required this.snapshotProtein,
    required this.snapshotFat,
    required this.snapshotCarbs,
    this.snapshotExtra,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['day'] = Variable<String>(day);
    if (!nullToAbsent || mealGroupId != null) {
      map['meal_group_id'] = Variable<String>(mealGroupId);
    }
    if (!nullToAbsent || productId != null) {
      map['product_id'] = Variable<String>(productId);
    }
    if (!nullToAbsent || dishId != null) {
      map['dish_id'] = Variable<String>(dishId);
    }
    map['grams'] = Variable<double>(grams);
    map['snapshot_kcal'] = Variable<double>(snapshotKcal);
    map['snapshot_protein'] = Variable<double>(snapshotProtein);
    map['snapshot_fat'] = Variable<double>(snapshotFat);
    map['snapshot_carbs'] = Variable<double>(snapshotCarbs);
    if (!nullToAbsent || snapshotExtra != null) {
      map['snapshot_extra'] = Variable<String>(snapshotExtra);
    }
    return map;
  }

  DiaryEntriesCompanion toCompanion(bool nullToAbsent) {
    return DiaryEntriesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      day: Value(day),
      mealGroupId: mealGroupId == null && nullToAbsent
          ? const Value.absent()
          : Value(mealGroupId),
      productId: productId == null && nullToAbsent
          ? const Value.absent()
          : Value(productId),
      dishId: dishId == null && nullToAbsent
          ? const Value.absent()
          : Value(dishId),
      grams: Value(grams),
      snapshotKcal: Value(snapshotKcal),
      snapshotProtein: Value(snapshotProtein),
      snapshotFat: Value(snapshotFat),
      snapshotCarbs: Value(snapshotCarbs),
      snapshotExtra: snapshotExtra == null && nullToAbsent
          ? const Value.absent()
          : Value(snapshotExtra),
    );
  }

  factory DiaryEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DiaryEntry(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      day: serializer.fromJson<String>(json['day']),
      mealGroupId: serializer.fromJson<String?>(json['mealGroupId']),
      productId: serializer.fromJson<String?>(json['productId']),
      dishId: serializer.fromJson<String?>(json['dishId']),
      grams: serializer.fromJson<double>(json['grams']),
      snapshotKcal: serializer.fromJson<double>(json['snapshotKcal']),
      snapshotProtein: serializer.fromJson<double>(json['snapshotProtein']),
      snapshotFat: serializer.fromJson<double>(json['snapshotFat']),
      snapshotCarbs: serializer.fromJson<double>(json['snapshotCarbs']),
      snapshotExtra: serializer.fromJson<String?>(json['snapshotExtra']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'day': serializer.toJson<String>(day),
      'mealGroupId': serializer.toJson<String?>(mealGroupId),
      'productId': serializer.toJson<String?>(productId),
      'dishId': serializer.toJson<String?>(dishId),
      'grams': serializer.toJson<double>(grams),
      'snapshotKcal': serializer.toJson<double>(snapshotKcal),
      'snapshotProtein': serializer.toJson<double>(snapshotProtein),
      'snapshotFat': serializer.toJson<double>(snapshotFat),
      'snapshotCarbs': serializer.toJson<double>(snapshotCarbs),
      'snapshotExtra': serializer.toJson<String?>(snapshotExtra),
    };
  }

  DiaryEntry copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? day,
    Value<String?> mealGroupId = const Value.absent(),
    Value<String?> productId = const Value.absent(),
    Value<String?> dishId = const Value.absent(),
    double? grams,
    double? snapshotKcal,
    double? snapshotProtein,
    double? snapshotFat,
    double? snapshotCarbs,
    Value<String?> snapshotExtra = const Value.absent(),
  }) => DiaryEntry(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    day: day ?? this.day,
    mealGroupId: mealGroupId.present ? mealGroupId.value : this.mealGroupId,
    productId: productId.present ? productId.value : this.productId,
    dishId: dishId.present ? dishId.value : this.dishId,
    grams: grams ?? this.grams,
    snapshotKcal: snapshotKcal ?? this.snapshotKcal,
    snapshotProtein: snapshotProtein ?? this.snapshotProtein,
    snapshotFat: snapshotFat ?? this.snapshotFat,
    snapshotCarbs: snapshotCarbs ?? this.snapshotCarbs,
    snapshotExtra: snapshotExtra.present
        ? snapshotExtra.value
        : this.snapshotExtra,
  );
  DiaryEntry copyWithCompanion(DiaryEntriesCompanion data) {
    return DiaryEntry(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      day: data.day.present ? data.day.value : this.day,
      mealGroupId: data.mealGroupId.present
          ? data.mealGroupId.value
          : this.mealGroupId,
      productId: data.productId.present ? data.productId.value : this.productId,
      dishId: data.dishId.present ? data.dishId.value : this.dishId,
      grams: data.grams.present ? data.grams.value : this.grams,
      snapshotKcal: data.snapshotKcal.present
          ? data.snapshotKcal.value
          : this.snapshotKcal,
      snapshotProtein: data.snapshotProtein.present
          ? data.snapshotProtein.value
          : this.snapshotProtein,
      snapshotFat: data.snapshotFat.present
          ? data.snapshotFat.value
          : this.snapshotFat,
      snapshotCarbs: data.snapshotCarbs.present
          ? data.snapshotCarbs.value
          : this.snapshotCarbs,
      snapshotExtra: data.snapshotExtra.present
          ? data.snapshotExtra.value
          : this.snapshotExtra,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DiaryEntry(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('day: $day, ')
          ..write('mealGroupId: $mealGroupId, ')
          ..write('productId: $productId, ')
          ..write('dishId: $dishId, ')
          ..write('grams: $grams, ')
          ..write('snapshotKcal: $snapshotKcal, ')
          ..write('snapshotProtein: $snapshotProtein, ')
          ..write('snapshotFat: $snapshotFat, ')
          ..write('snapshotCarbs: $snapshotCarbs, ')
          ..write('snapshotExtra: $snapshotExtra')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    day,
    mealGroupId,
    productId,
    dishId,
    grams,
    snapshotKcal,
    snapshotProtein,
    snapshotFat,
    snapshotCarbs,
    snapshotExtra,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DiaryEntry &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.day == this.day &&
          other.mealGroupId == this.mealGroupId &&
          other.productId == this.productId &&
          other.dishId == this.dishId &&
          other.grams == this.grams &&
          other.snapshotKcal == this.snapshotKcal &&
          other.snapshotProtein == this.snapshotProtein &&
          other.snapshotFat == this.snapshotFat &&
          other.snapshotCarbs == this.snapshotCarbs &&
          other.snapshotExtra == this.snapshotExtra);
}

class DiaryEntriesCompanion extends UpdateCompanion<DiaryEntry> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> day;
  final Value<String?> mealGroupId;
  final Value<String?> productId;
  final Value<String?> dishId;
  final Value<double> grams;
  final Value<double> snapshotKcal;
  final Value<double> snapshotProtein;
  final Value<double> snapshotFat;
  final Value<double> snapshotCarbs;
  final Value<String?> snapshotExtra;
  final Value<int> rowid;
  const DiaryEntriesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.day = const Value.absent(),
    this.mealGroupId = const Value.absent(),
    this.productId = const Value.absent(),
    this.dishId = const Value.absent(),
    this.grams = const Value.absent(),
    this.snapshotKcal = const Value.absent(),
    this.snapshotProtein = const Value.absent(),
    this.snapshotFat = const Value.absent(),
    this.snapshotCarbs = const Value.absent(),
    this.snapshotExtra = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DiaryEntriesCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String day,
    this.mealGroupId = const Value.absent(),
    this.productId = const Value.absent(),
    this.dishId = const Value.absent(),
    required double grams,
    required double snapshotKcal,
    required double snapshotProtein,
    required double snapshotFat,
    required double snapshotCarbs,
    this.snapshotExtra = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : day = Value(day),
       grams = Value(grams),
       snapshotKcal = Value(snapshotKcal),
       snapshotProtein = Value(snapshotProtein),
       snapshotFat = Value(snapshotFat),
       snapshotCarbs = Value(snapshotCarbs);
  static Insertable<DiaryEntry> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? day,
    Expression<String>? mealGroupId,
    Expression<String>? productId,
    Expression<String>? dishId,
    Expression<double>? grams,
    Expression<double>? snapshotKcal,
    Expression<double>? snapshotProtein,
    Expression<double>? snapshotFat,
    Expression<double>? snapshotCarbs,
    Expression<String>? snapshotExtra,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (day != null) 'day': day,
      if (mealGroupId != null) 'meal_group_id': mealGroupId,
      if (productId != null) 'product_id': productId,
      if (dishId != null) 'dish_id': dishId,
      if (grams != null) 'grams': grams,
      if (snapshotKcal != null) 'snapshot_kcal': snapshotKcal,
      if (snapshotProtein != null) 'snapshot_protein': snapshotProtein,
      if (snapshotFat != null) 'snapshot_fat': snapshotFat,
      if (snapshotCarbs != null) 'snapshot_carbs': snapshotCarbs,
      if (snapshotExtra != null) 'snapshot_extra': snapshotExtra,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DiaryEntriesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? day,
    Value<String?>? mealGroupId,
    Value<String?>? productId,
    Value<String?>? dishId,
    Value<double>? grams,
    Value<double>? snapshotKcal,
    Value<double>? snapshotProtein,
    Value<double>? snapshotFat,
    Value<double>? snapshotCarbs,
    Value<String?>? snapshotExtra,
    Value<int>? rowid,
  }) {
    return DiaryEntriesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      day: day ?? this.day,
      mealGroupId: mealGroupId ?? this.mealGroupId,
      productId: productId ?? this.productId,
      dishId: dishId ?? this.dishId,
      grams: grams ?? this.grams,
      snapshotKcal: snapshotKcal ?? this.snapshotKcal,
      snapshotProtein: snapshotProtein ?? this.snapshotProtein,
      snapshotFat: snapshotFat ?? this.snapshotFat,
      snapshotCarbs: snapshotCarbs ?? this.snapshotCarbs,
      snapshotExtra: snapshotExtra ?? this.snapshotExtra,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (day.present) {
      map['day'] = Variable<String>(day.value);
    }
    if (mealGroupId.present) {
      map['meal_group_id'] = Variable<String>(mealGroupId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (dishId.present) {
      map['dish_id'] = Variable<String>(dishId.value);
    }
    if (grams.present) {
      map['grams'] = Variable<double>(grams.value);
    }
    if (snapshotKcal.present) {
      map['snapshot_kcal'] = Variable<double>(snapshotKcal.value);
    }
    if (snapshotProtein.present) {
      map['snapshot_protein'] = Variable<double>(snapshotProtein.value);
    }
    if (snapshotFat.present) {
      map['snapshot_fat'] = Variable<double>(snapshotFat.value);
    }
    if (snapshotCarbs.present) {
      map['snapshot_carbs'] = Variable<double>(snapshotCarbs.value);
    }
    if (snapshotExtra.present) {
      map['snapshot_extra'] = Variable<String>(snapshotExtra.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiaryEntriesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('day: $day, ')
          ..write('mealGroupId: $mealGroupId, ')
          ..write('productId: $productId, ')
          ..write('dishId: $dishId, ')
          ..write('grams: $grams, ')
          ..write('snapshotKcal: $snapshotKcal, ')
          ..write('snapshotProtein: $snapshotProtein, ')
          ..write('snapshotFat: $snapshotFat, ')
          ..write('snapshotCarbs: $snapshotCarbs, ')
          ..write('snapshotExtra: $snapshotExtra, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProfilesTable extends Profiles with TableInfo<$ProfilesTable, Profile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: newId,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Sex?, String> sex =
      GeneratedColumn<String>(
        'sex',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<Sex?>($ProfilesTable.$convertersexn);
  static const VerificationMeta _birthDateMeta = const VerificationMeta(
    'birthDate',
  );
  @override
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
    'birth_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heightCmMeta = const VerificationMeta(
    'heightCm',
  );
  @override
  late final GeneratedColumn<double> heightCm = GeneratedColumn<double>(
    'height_cm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<ActivityLevel?, String>
  activityLevel = GeneratedColumn<String>(
    'activity_level',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<ActivityLevel?>($ProfilesTable.$converteractivityLeveln);
  @override
  late final GeneratedColumnWithTypeConverter<WeightGoal?, String> weightGoal =
      GeneratedColumn<String>(
        'weight_goal',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<WeightGoal?>($ProfilesTable.$converterweightGoaln);
  static const VerificationMeta _trackedNutrientsMeta = const VerificationMeta(
    'trackedNutrients',
  );
  @override
  late final GeneratedColumn<String> trackedNutrients = GeneratedColumn<String>(
    'tracked_nutrients',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('["fiber"]'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    sex,
    birthDate,
    heightCm,
    activityLevel,
    weightGoal,
    trackedNutrients,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<Profile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('birth_date')) {
      context.handle(
        _birthDateMeta,
        birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta),
      );
    }
    if (data.containsKey('height_cm')) {
      context.handle(
        _heightCmMeta,
        heightCm.isAcceptableOrUnknown(data['height_cm']!, _heightCmMeta),
      );
    }
    if (data.containsKey('tracked_nutrients')) {
      context.handle(
        _trackedNutrientsMeta,
        trackedNutrients.isAcceptableOrUnknown(
          data['tracked_nutrients']!,
          _trackedNutrientsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Profile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Profile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      sex: $ProfilesTable.$convertersexn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sex'],
        ),
      ),
      birthDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}birth_date'],
      ),
      heightCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height_cm'],
      ),
      activityLevel: $ProfilesTable.$converteractivityLeveln.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}activity_level'],
        ),
      ),
      weightGoal: $ProfilesTable.$converterweightGoaln.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}weight_goal'],
        ),
      ),
      trackedNutrients: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tracked_nutrients'],
      )!,
    );
  }

  @override
  $ProfilesTable createAlias(String alias) {
    return $ProfilesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Sex, String, String> $convertersex =
      const EnumNameConverter<Sex>(Sex.values);
  static JsonTypeConverter2<Sex?, String?, String?> $convertersexn =
      JsonTypeConverter2.asNullable($convertersex);
  static JsonTypeConverter2<ActivityLevel, String, String>
  $converteractivityLevel = const EnumNameConverter<ActivityLevel>(
    ActivityLevel.values,
  );
  static JsonTypeConverter2<ActivityLevel?, String?, String?>
  $converteractivityLeveln = JsonTypeConverter2.asNullable(
    $converteractivityLevel,
  );
  static JsonTypeConverter2<WeightGoal, String, String> $converterweightGoal =
      const EnumNameConverter<WeightGoal>(WeightGoal.values);
  static JsonTypeConverter2<WeightGoal?, String?, String?>
  $converterweightGoaln = JsonTypeConverter2.asNullable($converterweightGoal);
}

class Profile extends DataClass implements Insertable<Profile> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final Sex? sex;
  final DateTime? birthDate;
  final double? heightCm;
  final ActivityLevel? activityLevel;
  final WeightGoal? weightGoal;

  /// JSON list of optional nutrient codes shown in the UI, e.g. ["fiber"].
  final String trackedNutrients;
  const Profile({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.sex,
    this.birthDate,
    this.heightCm,
    this.activityLevel,
    this.weightGoal,
    required this.trackedNutrients,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || sex != null) {
      map['sex'] = Variable<String>($ProfilesTable.$convertersexn.toSql(sex));
    }
    if (!nullToAbsent || birthDate != null) {
      map['birth_date'] = Variable<DateTime>(birthDate);
    }
    if (!nullToAbsent || heightCm != null) {
      map['height_cm'] = Variable<double>(heightCm);
    }
    if (!nullToAbsent || activityLevel != null) {
      map['activity_level'] = Variable<String>(
        $ProfilesTable.$converteractivityLeveln.toSql(activityLevel),
      );
    }
    if (!nullToAbsent || weightGoal != null) {
      map['weight_goal'] = Variable<String>(
        $ProfilesTable.$converterweightGoaln.toSql(weightGoal),
      );
    }
    map['tracked_nutrients'] = Variable<String>(trackedNutrients);
    return map;
  }

  ProfilesCompanion toCompanion(bool nullToAbsent) {
    return ProfilesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      sex: sex == null && nullToAbsent ? const Value.absent() : Value(sex),
      birthDate: birthDate == null && nullToAbsent
          ? const Value.absent()
          : Value(birthDate),
      heightCm: heightCm == null && nullToAbsent
          ? const Value.absent()
          : Value(heightCm),
      activityLevel: activityLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(activityLevel),
      weightGoal: weightGoal == null && nullToAbsent
          ? const Value.absent()
          : Value(weightGoal),
      trackedNutrients: Value(trackedNutrients),
    );
  }

  factory Profile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Profile(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      sex: $ProfilesTable.$convertersexn.fromJson(
        serializer.fromJson<String?>(json['sex']),
      ),
      birthDate: serializer.fromJson<DateTime?>(json['birthDate']),
      heightCm: serializer.fromJson<double?>(json['heightCm']),
      activityLevel: $ProfilesTable.$converteractivityLeveln.fromJson(
        serializer.fromJson<String?>(json['activityLevel']),
      ),
      weightGoal: $ProfilesTable.$converterweightGoaln.fromJson(
        serializer.fromJson<String?>(json['weightGoal']),
      ),
      trackedNutrients: serializer.fromJson<String>(json['trackedNutrients']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'sex': serializer.toJson<String?>(
        $ProfilesTable.$convertersexn.toJson(sex),
      ),
      'birthDate': serializer.toJson<DateTime?>(birthDate),
      'heightCm': serializer.toJson<double?>(heightCm),
      'activityLevel': serializer.toJson<String?>(
        $ProfilesTable.$converteractivityLeveln.toJson(activityLevel),
      ),
      'weightGoal': serializer.toJson<String?>(
        $ProfilesTable.$converterweightGoaln.toJson(weightGoal),
      ),
      'trackedNutrients': serializer.toJson<String>(trackedNutrients),
    };
  }

  Profile copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<Sex?> sex = const Value.absent(),
    Value<DateTime?> birthDate = const Value.absent(),
    Value<double?> heightCm = const Value.absent(),
    Value<ActivityLevel?> activityLevel = const Value.absent(),
    Value<WeightGoal?> weightGoal = const Value.absent(),
    String? trackedNutrients,
  }) => Profile(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    sex: sex.present ? sex.value : this.sex,
    birthDate: birthDate.present ? birthDate.value : this.birthDate,
    heightCm: heightCm.present ? heightCm.value : this.heightCm,
    activityLevel: activityLevel.present
        ? activityLevel.value
        : this.activityLevel,
    weightGoal: weightGoal.present ? weightGoal.value : this.weightGoal,
    trackedNutrients: trackedNutrients ?? this.trackedNutrients,
  );
  Profile copyWithCompanion(ProfilesCompanion data) {
    return Profile(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      sex: data.sex.present ? data.sex.value : this.sex,
      birthDate: data.birthDate.present ? data.birthDate.value : this.birthDate,
      heightCm: data.heightCm.present ? data.heightCm.value : this.heightCm,
      activityLevel: data.activityLevel.present
          ? data.activityLevel.value
          : this.activityLevel,
      weightGoal: data.weightGoal.present
          ? data.weightGoal.value
          : this.weightGoal,
      trackedNutrients: data.trackedNutrients.present
          ? data.trackedNutrients.value
          : this.trackedNutrients,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Profile(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('sex: $sex, ')
          ..write('birthDate: $birthDate, ')
          ..write('heightCm: $heightCm, ')
          ..write('activityLevel: $activityLevel, ')
          ..write('weightGoal: $weightGoal, ')
          ..write('trackedNutrients: $trackedNutrients')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    sex,
    birthDate,
    heightCm,
    activityLevel,
    weightGoal,
    trackedNutrients,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Profile &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.sex == this.sex &&
          other.birthDate == this.birthDate &&
          other.heightCm == this.heightCm &&
          other.activityLevel == this.activityLevel &&
          other.weightGoal == this.weightGoal &&
          other.trackedNutrients == this.trackedNutrients);
}

class ProfilesCompanion extends UpdateCompanion<Profile> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<Sex?> sex;
  final Value<DateTime?> birthDate;
  final Value<double?> heightCm;
  final Value<ActivityLevel?> activityLevel;
  final Value<WeightGoal?> weightGoal;
  final Value<String> trackedNutrients;
  final Value<int> rowid;
  const ProfilesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.sex = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.heightCm = const Value.absent(),
    this.activityLevel = const Value.absent(),
    this.weightGoal = const Value.absent(),
    this.trackedNutrients = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProfilesCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.sex = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.heightCm = const Value.absent(),
    this.activityLevel = const Value.absent(),
    this.weightGoal = const Value.absent(),
    this.trackedNutrients = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<Profile> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? sex,
    Expression<DateTime>? birthDate,
    Expression<double>? heightCm,
    Expression<String>? activityLevel,
    Expression<String>? weightGoal,
    Expression<String>? trackedNutrients,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (sex != null) 'sex': sex,
      if (birthDate != null) 'birth_date': birthDate,
      if (heightCm != null) 'height_cm': heightCm,
      if (activityLevel != null) 'activity_level': activityLevel,
      if (weightGoal != null) 'weight_goal': weightGoal,
      if (trackedNutrients != null) 'tracked_nutrients': trackedNutrients,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProfilesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<Sex?>? sex,
    Value<DateTime?>? birthDate,
    Value<double?>? heightCm,
    Value<ActivityLevel?>? activityLevel,
    Value<WeightGoal?>? weightGoal,
    Value<String>? trackedNutrients,
    Value<int>? rowid,
  }) {
    return ProfilesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      sex: sex ?? this.sex,
      birthDate: birthDate ?? this.birthDate,
      heightCm: heightCm ?? this.heightCm,
      activityLevel: activityLevel ?? this.activityLevel,
      weightGoal: weightGoal ?? this.weightGoal,
      trackedNutrients: trackedNutrients ?? this.trackedNutrients,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(
        $ProfilesTable.$convertersexn.toSql(sex.value),
      );
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (heightCm.present) {
      map['height_cm'] = Variable<double>(heightCm.value);
    }
    if (activityLevel.present) {
      map['activity_level'] = Variable<String>(
        $ProfilesTable.$converteractivityLeveln.toSql(activityLevel.value),
      );
    }
    if (weightGoal.present) {
      map['weight_goal'] = Variable<String>(
        $ProfilesTable.$converterweightGoaln.toSql(weightGoal.value),
      );
    }
    if (trackedNutrients.present) {
      map['tracked_nutrients'] = Variable<String>(trackedNutrients.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfilesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('sex: $sex, ')
          ..write('birthDate: $birthDate, ')
          ..write('heightCm: $heightCm, ')
          ..write('activityLevel: $activityLevel, ')
          ..write('weightGoal: $weightGoal, ')
          ..write('trackedNutrients: $trackedNutrients, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WeightLogTable extends WeightLog
    with TableInfo<$WeightLogTable, WeightEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeightLogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: newId,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<String> day = GeneratedColumn<String>(
    'day',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 10,
      maxTextLength: 10,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightKgMeta = const VerificationMeta(
    'weightKg',
  );
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
    'weight_kg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    day,
    weightKg,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weight_log';
  @override
  VerificationContext validateIntegrity(
    Insertable<WeightEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('day')) {
      context.handle(
        _dayMeta,
        day.isAcceptableOrUnknown(data['day']!, _dayMeta),
      );
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    if (data.containsKey('weight_kg')) {
      context.handle(
        _weightKgMeta,
        weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta),
      );
    } else if (isInserting) {
      context.missing(_weightKgMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeightEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeightEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      day: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}day'],
      )!,
      weightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_kg'],
      )!,
    );
  }

  @override
  $WeightLogTable createAlias(String alias) {
    return $WeightLogTable(attachedDatabase, alias);
  }
}

class WeightEntry extends DataClass implements Insertable<WeightEntry> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String day;
  final double weightKg;
  const WeightEntry({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.day,
    required this.weightKg,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['day'] = Variable<String>(day);
    map['weight_kg'] = Variable<double>(weightKg);
    return map;
  }

  WeightLogCompanion toCompanion(bool nullToAbsent) {
    return WeightLogCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      day: Value(day),
      weightKg: Value(weightKg),
    );
  }

  factory WeightEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeightEntry(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      day: serializer.fromJson<String>(json['day']),
      weightKg: serializer.fromJson<double>(json['weightKg']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'day': serializer.toJson<String>(day),
      'weightKg': serializer.toJson<double>(weightKg),
    };
  }

  WeightEntry copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? day,
    double? weightKg,
  }) => WeightEntry(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    day: day ?? this.day,
    weightKg: weightKg ?? this.weightKg,
  );
  WeightEntry copyWithCompanion(WeightLogCompanion data) {
    return WeightEntry(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      day: data.day.present ? data.day.value : this.day,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeightEntry(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('day: $day, ')
          ..write('weightKg: $weightKg')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, updatedAt, deletedAt, day, weightKg);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeightEntry &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.day == this.day &&
          other.weightKg == this.weightKg);
}

class WeightLogCompanion extends UpdateCompanion<WeightEntry> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> day;
  final Value<double> weightKg;
  final Value<int> rowid;
  const WeightLogCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.day = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WeightLogCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String day,
    required double weightKg,
    this.rowid = const Value.absent(),
  }) : day = Value(day),
       weightKg = Value(weightKg);
  static Insertable<WeightEntry> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? day,
    Expression<double>? weightKg,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (day != null) 'day': day,
      if (weightKg != null) 'weight_kg': weightKg,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WeightLogCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? day,
    Value<double>? weightKg,
    Value<int>? rowid,
  }) {
    return WeightLogCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      day: day ?? this.day,
      weightKg: weightKg ?? this.weightKg,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (day.present) {
      map['day'] = Variable<String>(day.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeightLogCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('day: $day, ')
          ..write('weightKg: $weightKg, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GoalsTable extends Goals with TableInfo<$GoalsTable, Goal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: newId,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<GoalMode, String> mode =
      GeneratedColumn<String>(
        'mode',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(GoalMode.auto.name),
      ).withConverter<GoalMode>($GoalsTable.$convertermode);
  static const VerificationMeta _kcalMeta = const VerificationMeta('kcal');
  @override
  late final GeneratedColumn<double> kcal = GeneratedColumn<double>(
    'kcal',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _proteinMeta = const VerificationMeta(
    'protein',
  );
  @override
  late final GeneratedColumn<double> protein = GeneratedColumn<double>(
    'protein',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fatMeta = const VerificationMeta('fat');
  @override
  late final GeneratedColumn<double> fat = GeneratedColumn<double>(
    'fat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _carbsMeta = const VerificationMeta('carbs');
  @override
  late final GeneratedColumn<double> carbs = GeneratedColumn<double>(
    'carbs',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _extraMeta = const VerificationMeta('extra');
  @override
  late final GeneratedColumn<String> extra = GeneratedColumn<String>(
    'extra',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    mode,
    kcal,
    protein,
    fat,
    carbs,
    extra,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<Goal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('kcal')) {
      context.handle(
        _kcalMeta,
        kcal.isAcceptableOrUnknown(data['kcal']!, _kcalMeta),
      );
    }
    if (data.containsKey('protein')) {
      context.handle(
        _proteinMeta,
        protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta),
      );
    }
    if (data.containsKey('fat')) {
      context.handle(
        _fatMeta,
        fat.isAcceptableOrUnknown(data['fat']!, _fatMeta),
      );
    }
    if (data.containsKey('carbs')) {
      context.handle(
        _carbsMeta,
        carbs.isAcceptableOrUnknown(data['carbs']!, _carbsMeta),
      );
    }
    if (data.containsKey('extra')) {
      context.handle(
        _extraMeta,
        extra.isAcceptableOrUnknown(data['extra']!, _extraMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Goal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Goal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      mode: $GoalsTable.$convertermode.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}mode'],
        )!,
      ),
      kcal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}kcal'],
      ),
      protein: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}protein'],
      ),
      fat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fat'],
      ),
      carbs: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}carbs'],
      ),
      extra: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}extra'],
      ),
    );
  }

  @override
  $GoalsTable createAlias(String alias) {
    return $GoalsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<GoalMode, String, String> $convertermode =
      const EnumNameConverter<GoalMode>(GoalMode.values);
}

class Goal extends DataClass implements Insertable<Goal> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final GoalMode mode;
  final double? kcal;
  final double? protein;
  final double? fat;
  final double? carbs;
  final String? extra;
  const Goal({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.mode,
    this.kcal,
    this.protein,
    this.fat,
    this.carbs,
    this.extra,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    {
      map['mode'] = Variable<String>($GoalsTable.$convertermode.toSql(mode));
    }
    if (!nullToAbsent || kcal != null) {
      map['kcal'] = Variable<double>(kcal);
    }
    if (!nullToAbsent || protein != null) {
      map['protein'] = Variable<double>(protein);
    }
    if (!nullToAbsent || fat != null) {
      map['fat'] = Variable<double>(fat);
    }
    if (!nullToAbsent || carbs != null) {
      map['carbs'] = Variable<double>(carbs);
    }
    if (!nullToAbsent || extra != null) {
      map['extra'] = Variable<String>(extra);
    }
    return map;
  }

  GoalsCompanion toCompanion(bool nullToAbsent) {
    return GoalsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      mode: Value(mode),
      kcal: kcal == null && nullToAbsent ? const Value.absent() : Value(kcal),
      protein: protein == null && nullToAbsent
          ? const Value.absent()
          : Value(protein),
      fat: fat == null && nullToAbsent ? const Value.absent() : Value(fat),
      carbs: carbs == null && nullToAbsent
          ? const Value.absent()
          : Value(carbs),
      extra: extra == null && nullToAbsent
          ? const Value.absent()
          : Value(extra),
    );
  }

  factory Goal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Goal(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      mode: $GoalsTable.$convertermode.fromJson(
        serializer.fromJson<String>(json['mode']),
      ),
      kcal: serializer.fromJson<double?>(json['kcal']),
      protein: serializer.fromJson<double?>(json['protein']),
      fat: serializer.fromJson<double?>(json['fat']),
      carbs: serializer.fromJson<double?>(json['carbs']),
      extra: serializer.fromJson<String?>(json['extra']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'mode': serializer.toJson<String>(
        $GoalsTable.$convertermode.toJson(mode),
      ),
      'kcal': serializer.toJson<double?>(kcal),
      'protein': serializer.toJson<double?>(protein),
      'fat': serializer.toJson<double?>(fat),
      'carbs': serializer.toJson<double?>(carbs),
      'extra': serializer.toJson<String?>(extra),
    };
  }

  Goal copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    GoalMode? mode,
    Value<double?> kcal = const Value.absent(),
    Value<double?> protein = const Value.absent(),
    Value<double?> fat = const Value.absent(),
    Value<double?> carbs = const Value.absent(),
    Value<String?> extra = const Value.absent(),
  }) => Goal(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    mode: mode ?? this.mode,
    kcal: kcal.present ? kcal.value : this.kcal,
    protein: protein.present ? protein.value : this.protein,
    fat: fat.present ? fat.value : this.fat,
    carbs: carbs.present ? carbs.value : this.carbs,
    extra: extra.present ? extra.value : this.extra,
  );
  Goal copyWithCompanion(GoalsCompanion data) {
    return Goal(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      mode: data.mode.present ? data.mode.value : this.mode,
      kcal: data.kcal.present ? data.kcal.value : this.kcal,
      protein: data.protein.present ? data.protein.value : this.protein,
      fat: data.fat.present ? data.fat.value : this.fat,
      carbs: data.carbs.present ? data.carbs.value : this.carbs,
      extra: data.extra.present ? data.extra.value : this.extra,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Goal(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('mode: $mode, ')
          ..write('kcal: $kcal, ')
          ..write('protein: $protein, ')
          ..write('fat: $fat, ')
          ..write('carbs: $carbs, ')
          ..write('extra: $extra')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    updatedAt,
    deletedAt,
    mode,
    kcal,
    protein,
    fat,
    carbs,
    extra,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Goal &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.mode == this.mode &&
          other.kcal == this.kcal &&
          other.protein == this.protein &&
          other.fat == this.fat &&
          other.carbs == this.carbs &&
          other.extra == this.extra);
}

class GoalsCompanion extends UpdateCompanion<Goal> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<GoalMode> mode;
  final Value<double?> kcal;
  final Value<double?> protein;
  final Value<double?> fat;
  final Value<double?> carbs;
  final Value<String?> extra;
  final Value<int> rowid;
  const GoalsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.mode = const Value.absent(),
    this.kcal = const Value.absent(),
    this.protein = const Value.absent(),
    this.fat = const Value.absent(),
    this.carbs = const Value.absent(),
    this.extra = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoalsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.mode = const Value.absent(),
    this.kcal = const Value.absent(),
    this.protein = const Value.absent(),
    this.fat = const Value.absent(),
    this.carbs = const Value.absent(),
    this.extra = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<Goal> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? mode,
    Expression<double>? kcal,
    Expression<double>? protein,
    Expression<double>? fat,
    Expression<double>? carbs,
    Expression<String>? extra,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (mode != null) 'mode': mode,
      if (kcal != null) 'kcal': kcal,
      if (protein != null) 'protein': protein,
      if (fat != null) 'fat': fat,
      if (carbs != null) 'carbs': carbs,
      if (extra != null) 'extra': extra,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoalsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<GoalMode>? mode,
    Value<double?>? kcal,
    Value<double?>? protein,
    Value<double?>? fat,
    Value<double?>? carbs,
    Value<String?>? extra,
    Value<int>? rowid,
  }) {
    return GoalsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      mode: mode ?? this.mode,
      kcal: kcal ?? this.kcal,
      protein: protein ?? this.protein,
      fat: fat ?? this.fat,
      carbs: carbs ?? this.carbs,
      extra: extra ?? this.extra,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(
        $GoalsTable.$convertermode.toSql(mode.value),
      );
    }
    if (kcal.present) {
      map['kcal'] = Variable<double>(kcal.value);
    }
    if (protein.present) {
      map['protein'] = Variable<double>(protein.value);
    }
    if (fat.present) {
      map['fat'] = Variable<double>(fat.value);
    }
    if (carbs.present) {
      map['carbs'] = Variable<double>(carbs.value);
    }
    if (extra.present) {
      map['extra'] = Variable<String>(extra.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('mode: $mode, ')
          ..write('kcal: $kcal, ')
          ..write('protein: $protein, ')
          ..write('fat: $fat, ')
          ..write('carbs: $carbs, ')
          ..write('extra: $extra, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $NutrientDefinitionsTable nutrientDefinitions =
      $NutrientDefinitionsTable(this);
  late final $ProductNutrientsTable productNutrients = $ProductNutrientsTable(
    this,
  );
  late final $ProductServingsTable productServings = $ProductServingsTable(
    this,
  );
  late final $DishesTable dishes = $DishesTable(this);
  late final $DishItemsTable dishItems = $DishItemsTable(this);
  late final $MealGroupsTable mealGroups = $MealGroupsTable(this);
  late final $DishMealGroupsTable dishMealGroups = $DishMealGroupsTable(this);
  late final $MediaTable media = $MediaTable(this);
  late final $MediaBlobsTable mediaBlobs = $MediaBlobsTable(this);
  late final $DiaryEntriesTable diaryEntries = $DiaryEntriesTable(this);
  late final $ProfilesTable profiles = $ProfilesTable(this);
  late final $WeightLogTable weightLog = $WeightLogTable(this);
  late final $GoalsTable goals = $GoalsTable(this);
  late final Index diaryEntriesDay = Index(
    'diary_entries_day',
    'CREATE INDEX diary_entries_day ON diary_entries (day)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    products,
    nutrientDefinitions,
    productNutrients,
    productServings,
    dishes,
    dishItems,
    mealGroups,
    dishMealGroups,
    media,
    mediaBlobs,
    diaryEntries,
    profiles,
    weightLog,
    goals,
    diaryEntriesDay,
  ];
}

typedef $$ProductsTableCreateCompanionBuilder = ProductsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<String?> ownerId,
  Value<ContentVisibility> visibility,
  Value<ModerationStatus> status,
  required String name,
  Value<String?> description,
  Value<String?> brand,
  Value<String?> barcode,
  Value<Basis> basis,
  required double kcal,
  required double protein,
  required double fat,
  required double carbs,
  Value<int> rowid,
});
typedef $$ProductsTableUpdateCompanionBuilder = ProductsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<String?> ownerId,
  Value<ContentVisibility> visibility,
  Value<ModerationStatus> status,
  Value<String> name,
  Value<String?> description,
  Value<String?> brand,
  Value<String?> barcode,
  Value<Basis> basis,
  Value<double> kcal,
  Value<double> protein,
  Value<double> fat,
  Value<double> carbs,
  Value<int> rowid,
});

final class $$ProductsTableReferences
    extends BaseReferences<_$AppDatabase, $ProductsTable, Product> {
  $$ProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductNutrientsTable, List<ProductNutrient>>
  _productNutrientsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.productNutrients,
    aliasName: 'products__id__product_nutrients__product_id',
  );

  $$ProductNutrientsTableProcessedTableManager get productNutrientsRefs {
    final manager = $$ProductNutrientsTableTableManager(
      $_db,
      $_db.productNutrients,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _productNutrientsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProductServingsTable, List<ProductServing>>
  _productServingsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.productServings,
    aliasName: 'products__id__product_servings__product_id',
  );

  $$ProductServingsTableProcessedTableManager get productServingsRefs {
    final manager = $$ProductServingsTableTableManager(
      $_db,
      $_db.productServings,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _productServingsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DishItemsTable, List<DishItem>>
  _dishItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dishItems,
    aliasName: 'products__id__dish_items__product_id',
  );

  $$DishItemsTableProcessedTableManager get dishItemsRefs {
    final manager = $$DishItemsTableTableManager(
      $_db,
      $_db.dishItems,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_dishItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DiaryEntriesTable, List<DiaryEntry>>
  _diaryEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.diaryEntries,
    aliasName: 'products__id__diary_entries__product_id',
  );

  $$DiaryEntriesTableProcessedTableManager get diaryEntriesRefs {
    final manager = $$DiaryEntriesTableTableManager(
      $_db,
      $_db.diaryEntries,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_diaryEntriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ContentVisibility, ContentVisibility, String>
  get visibility => $composableBuilder(
    column: $table.visibility,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<ModerationStatus, ModerationStatus, String>
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Basis, Basis, String> get basis =>
      $composableBuilder(
        column: $table.basis,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<double> get kcal => $composableBuilder(
    column: $table.kcal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productNutrientsRefs(
    Expression<bool> Function($$ProductNutrientsTableFilterComposer f) f,
  ) {
    final $$ProductNutrientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productNutrients,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductNutrientsTableFilterComposer(
            $db: $db,
            $table: $db.productNutrients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> productServingsRefs(
    Expression<bool> Function($$ProductServingsTableFilterComposer f) f,
  ) {
    final $$ProductServingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productServings,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductServingsTableFilterComposer(
            $db: $db,
            $table: $db.productServings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dishItemsRefs(
    Expression<bool> Function($$DishItemsTableFilterComposer f) f,
  ) {
    final $$DishItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dishItems,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DishItemsTableFilterComposer(
            $db: $db,
            $table: $db.dishItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> diaryEntriesRefs(
    Expression<bool> Function($$DiaryEntriesTableFilterComposer f) f,
  ) {
    final $$DiaryEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.diaryEntries,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiaryEntriesTableFilterComposer(
            $db: $db,
            $table: $db.diaryEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get visibility => $composableBuilder(
    column: $table.visibility,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get basis => $composableBuilder(
    column: $table.basis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get kcal => $composableBuilder(
    column: $table.kcal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ContentVisibility, String> get visibility =>
      $composableBuilder(
        column: $table.visibility,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<ModerationStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Basis, String> get basis =>
      $composableBuilder(column: $table.basis, builder: (column) => column);

  GeneratedColumn<double> get kcal =>
      $composableBuilder(column: $table.kcal, builder: (column) => column);

  GeneratedColumn<double> get protein =>
      $composableBuilder(column: $table.protein, builder: (column) => column);

  GeneratedColumn<double> get fat =>
      $composableBuilder(column: $table.fat, builder: (column) => column);

  GeneratedColumn<double> get carbs =>
      $composableBuilder(column: $table.carbs, builder: (column) => column);

  Expression<T> productNutrientsRefs<T extends Object>(
    Expression<T> Function($$ProductNutrientsTableAnnotationComposer a) f,
  ) {
    final $$ProductNutrientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productNutrients,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductNutrientsTableAnnotationComposer(
            $db: $db,
            $table: $db.productNutrients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> productServingsRefs<T extends Object>(
    Expression<T> Function($$ProductServingsTableAnnotationComposer a) f,
  ) {
    final $$ProductServingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productServings,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductServingsTableAnnotationComposer(
            $db: $db,
            $table: $db.productServings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> dishItemsRefs<T extends Object>(
    Expression<T> Function($$DishItemsTableAnnotationComposer a) f,
  ) {
    final $$DishItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dishItems,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DishItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.dishItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> diaryEntriesRefs<T extends Object>(
    Expression<T> Function($$DiaryEntriesTableAnnotationComposer a) f,
  ) {
    final $$DiaryEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.diaryEntries,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiaryEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.diaryEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          Product,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (Product, $$ProductsTableReferences),
          Product,
          PrefetchHooks Function({
            bool productNutrientsRefs,
            bool productServingsRefs,
            bool dishItemsRefs,
            bool diaryEntriesRefs,
          })
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> ownerId = const Value.absent(),
                Value<ContentVisibility> visibility = const Value.absent(),
                Value<ModerationStatus> status = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> brand = const Value.absent(),
                Value<String?> barcode = const Value.absent(),
                Value<Basis> basis = const Value.absent(),
                Value<double> kcal = const Value.absent(),
                Value<double> protein = const Value.absent(),
                Value<double> fat = const Value.absent(),
                Value<double> carbs = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                ownerId: ownerId,
                visibility: visibility,
                status: status,
                name: name,
                description: description,
                brand: brand,
                barcode: barcode,
                basis: basis,
                kcal: kcal,
                protein: protein,
                fat: fat,
                carbs: carbs,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> ownerId = const Value.absent(),
                Value<ContentVisibility> visibility = const Value.absent(),
                Value<ModerationStatus> status = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> brand = const Value.absent(),
                Value<String?> barcode = const Value.absent(),
                Value<Basis> basis = const Value.absent(),
                required double kcal,
                required double protein,
                required double fat,
                required double carbs,
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                ownerId: ownerId,
                visibility: visibility,
                status: status,
                name: name,
                description: description,
                brand: brand,
                barcode: barcode,
                basis: basis,
                kcal: kcal,
                protein: protein,
                fat: fat,
                carbs: carbs,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProductsTable, Product>(table),
                  $$ProductsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                productNutrientsRefs = false,
                productServingsRefs = false,
                dishItemsRefs = false,
                diaryEntriesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (productNutrientsRefs) db.productNutrients,
                    if (productServingsRefs) db.productServings,
                    if (dishItemsRefs) db.dishItems,
                    if (diaryEntriesRefs) db.diaryEntries,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (productNutrientsRefs)
                        await $_getPrefetchedDataByColumns<
                          Product,
                          $ProductsTable,
                          ProductNutrient,
                          $ProductNutrientsTable
                        >(
                          currentTable: table,
                          referencedTable: $$ProductsTableReferences
                              ._productNutrientsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).productNutrientsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'product_id',
                          typedResults: items,
                        ),
                      if (productServingsRefs)
                        await $_getPrefetchedDataByColumns<
                          Product,
                          $ProductsTable,
                          ProductServing,
                          $ProductServingsTable
                        >(
                          currentTable: table,
                          referencedTable: $$ProductsTableReferences
                              ._productServingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).productServingsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'product_id',
                          typedResults: items,
                        ),
                      if (dishItemsRefs)
                        await $_getPrefetchedDataByColumns<
                          Product,
                          $ProductsTable,
                          DishItem,
                          $DishItemsTable
                        >(
                          currentTable: table,
                          referencedTable: $$ProductsTableReferences
                              ._dishItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).dishItemsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'product_id',
                          typedResults: items,
                        ),
                      if (diaryEntriesRefs)
                        await $_getPrefetchedDataByColumns<
                          Product,
                          $ProductsTable,
                          DiaryEntry,
                          $DiaryEntriesTable
                        >(
                          currentTable: table,
                          referencedTable: $$ProductsTableReferences
                              ._diaryEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).diaryEntriesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'product_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      Product,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (Product, $$ProductsTableReferences),
      Product,
      PrefetchHooks Function({
        bool productNutrientsRefs,
        bool productServingsRefs,
        bool dishItemsRefs,
        bool diaryEntriesRefs,
      })
    >;
typedef $$NutrientDefinitionsTableCreateCompanionBuilder =
    NutrientDefinitionsCompanion Function({
      required String code,
      required String unit,
      required int sortOrder,
      Value<int> rowid,
    });
typedef $$NutrientDefinitionsTableUpdateCompanionBuilder =
    NutrientDefinitionsCompanion Function({
      Value<String> code,
      Value<String> unit,
      Value<int> sortOrder,
      Value<int> rowid,
    });

final class $$NutrientDefinitionsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $NutrientDefinitionsTable,
          NutrientDefinition
        > {
  $$NutrientDefinitionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ProductNutrientsTable, List<ProductNutrient>>
  _productNutrientsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.productNutrients,
    aliasName: 'nutrient_definitions__code__product_nutrients__nutrient_code',
  );

  $$ProductNutrientsTableProcessedTableManager get productNutrientsRefs {
    final manager =
        $$ProductNutrientsTableTableManager($_db, $_db.productNutrients).filter(
          (f) => f.nutrientCode.code.sqlEquals($_itemColumn<String>('code')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _productNutrientsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$NutrientDefinitionsTableFilterComposer
    extends Composer<_$AppDatabase, $NutrientDefinitionsTable> {
  $$NutrientDefinitionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productNutrientsRefs(
    Expression<bool> Function($$ProductNutrientsTableFilterComposer f) f,
  ) {
    final $$ProductNutrientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.code,
      referencedTable: $db.productNutrients,
      getReferencedColumn: (t) => t.nutrientCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductNutrientsTableFilterComposer(
            $db: $db,
            $table: $db.productNutrients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$NutrientDefinitionsTableOrderingComposer
    extends Composer<_$AppDatabase, $NutrientDefinitionsTable> {
  $$NutrientDefinitionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NutrientDefinitionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NutrientDefinitionsTable> {
  $$NutrientDefinitionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  Expression<T> productNutrientsRefs<T extends Object>(
    Expression<T> Function($$ProductNutrientsTableAnnotationComposer a) f,
  ) {
    final $$ProductNutrientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.code,
      referencedTable: $db.productNutrients,
      getReferencedColumn: (t) => t.nutrientCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductNutrientsTableAnnotationComposer(
            $db: $db,
            $table: $db.productNutrients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$NutrientDefinitionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NutrientDefinitionsTable,
          NutrientDefinition,
          $$NutrientDefinitionsTableFilterComposer,
          $$NutrientDefinitionsTableOrderingComposer,
          $$NutrientDefinitionsTableAnnotationComposer,
          $$NutrientDefinitionsTableCreateCompanionBuilder,
          $$NutrientDefinitionsTableUpdateCompanionBuilder,
          (NutrientDefinition, $$NutrientDefinitionsTableReferences),
          NutrientDefinition,
          PrefetchHooks Function({bool productNutrientsRefs})
        > {
  $$NutrientDefinitionsTableTableManager(
    _$AppDatabase db,
    $NutrientDefinitionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NutrientDefinitionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NutrientDefinitionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$NutrientDefinitionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> code = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NutrientDefinitionsCompanion(
                code: code,
                unit: unit,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String code,
                required String unit,
                required int sortOrder,
                Value<int> rowid = const Value.absent(),
              }) => NutrientDefinitionsCompanion.insert(
                code: code,
                unit: unit,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$NutrientDefinitionsTable, NutrientDefinition>(
                    table,
                  ),
                  $$NutrientDefinitionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productNutrientsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (productNutrientsRefs) db.productNutrients,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productNutrientsRefs)
                    await $_getPrefetchedDataByColumns<
                      NutrientDefinition,
                      $NutrientDefinitionsTable,
                      ProductNutrient,
                      $ProductNutrientsTable
                    >(
                      currentTable: table,
                      referencedTable: $$NutrientDefinitionsTableReferences
                          ._productNutrientsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$NutrientDefinitionsTableReferences(
                            db,
                            table,
                            p0,
                          ).productNutrientsRefs,
                      currentColumn: 'code',
                      referencedColumn: 'nutrient_code',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$NutrientDefinitionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NutrientDefinitionsTable,
      NutrientDefinition,
      $$NutrientDefinitionsTableFilterComposer,
      $$NutrientDefinitionsTableOrderingComposer,
      $$NutrientDefinitionsTableAnnotationComposer,
      $$NutrientDefinitionsTableCreateCompanionBuilder,
      $$NutrientDefinitionsTableUpdateCompanionBuilder,
      (NutrientDefinition, $$NutrientDefinitionsTableReferences),
      NutrientDefinition,
      PrefetchHooks Function({bool productNutrientsRefs})
    >;
typedef $$ProductNutrientsTableCreateCompanionBuilder =
    ProductNutrientsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String productId,
      required String nutrientCode,
      required double amountPer100,
      Value<int> rowid,
    });
typedef $$ProductNutrientsTableUpdateCompanionBuilder =
    ProductNutrientsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> productId,
      Value<String> nutrientCode,
      Value<double> amountPer100,
      Value<int> rowid,
    });

final class $$ProductNutrientsTableReferences
    extends
        BaseReferences<_$AppDatabase, $ProductNutrientsTable, ProductNutrient> {
  $$ProductNutrientsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias('product_nutrients__product_id__products__id');

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $NutrientDefinitionsTable _nutrientCodeTable(_$AppDatabase db) =>
      db.nutrientDefinitions.createAlias(
        'product_nutrients__nutrient_code__nutrient_definitions__code',
      );

  $$NutrientDefinitionsTableProcessedTableManager get nutrientCode {
    final $_column = $_itemColumn<String>('nutrient_code')!;

    final manager = $$NutrientDefinitionsTableTableManager(
      $_db,
      $_db.nutrientDefinitions,
    ).filter((f) => f.code.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_nutrientCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProductNutrientsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductNutrientsTable> {
  $$ProductNutrientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amountPer100 => $composableBuilder(
    column: $table.amountPer100,
    builder: (column) => ColumnFilters(column),
  );

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$NutrientDefinitionsTableFilterComposer get nutrientCode {
    final $$NutrientDefinitionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.nutrientCode,
      referencedTable: $db.nutrientDefinitions,
      getReferencedColumn: (t) => t.code,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NutrientDefinitionsTableFilterComposer(
            $db: $db,
            $table: $db.nutrientDefinitions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductNutrientsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductNutrientsTable> {
  $$ProductNutrientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amountPer100 => $composableBuilder(
    column: $table.amountPer100,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$NutrientDefinitionsTableOrderingComposer get nutrientCode {
    final $$NutrientDefinitionsTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.nutrientCode,
          referencedTable: $db.nutrientDefinitions,
          getReferencedColumn: (t) => t.code,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$NutrientDefinitionsTableOrderingComposer(
                $db: $db,
                $table: $db.nutrientDefinitions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ProductNutrientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductNutrientsTable> {
  $$ProductNutrientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<double> get amountPer100 => $composableBuilder(
    column: $table.amountPer100,
    builder: (column) => column,
  );

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$NutrientDefinitionsTableAnnotationComposer get nutrientCode {
    final $$NutrientDefinitionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.nutrientCode,
          referencedTable: $db.nutrientDefinitions,
          getReferencedColumn: (t) => t.code,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$NutrientDefinitionsTableAnnotationComposer(
                $db: $db,
                $table: $db.nutrientDefinitions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ProductNutrientsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductNutrientsTable,
          ProductNutrient,
          $$ProductNutrientsTableFilterComposer,
          $$ProductNutrientsTableOrderingComposer,
          $$ProductNutrientsTableAnnotationComposer,
          $$ProductNutrientsTableCreateCompanionBuilder,
          $$ProductNutrientsTableUpdateCompanionBuilder,
          (ProductNutrient, $$ProductNutrientsTableReferences),
          ProductNutrient,
          PrefetchHooks Function({bool productId, bool nutrientCode})
        > {
  $$ProductNutrientsTableTableManager(
    _$AppDatabase db,
    $ProductNutrientsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductNutrientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductNutrientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductNutrientsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<String> nutrientCode = const Value.absent(),
                Value<double> amountPer100 = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductNutrientsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                productId: productId,
                nutrientCode: nutrientCode,
                amountPer100: amountPer100,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String productId,
                required String nutrientCode,
                required double amountPer100,
                Value<int> rowid = const Value.absent(),
              }) => ProductNutrientsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                productId: productId,
                nutrientCode: nutrientCode,
                amountPer100: amountPer100,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProductNutrientsTable, ProductNutrient>(table),
                  $$ProductNutrientsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productId = false, nutrientCode = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (productId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.productId,
                        referencedTable: $$ProductNutrientsTableReferences
                            ._productIdTable(db),
                        referencedColumn: $$ProductNutrientsTableReferences
                            ._productIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (nutrientCode) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.nutrientCode,
                        referencedTable: $$ProductNutrientsTableReferences
                            ._nutrientCodeTable(db),
                        referencedColumn: $$ProductNutrientsTableReferences
                            ._nutrientCodeTable(db)
                            .code,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProductNutrientsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductNutrientsTable,
      ProductNutrient,
      $$ProductNutrientsTableFilterComposer,
      $$ProductNutrientsTableOrderingComposer,
      $$ProductNutrientsTableAnnotationComposer,
      $$ProductNutrientsTableCreateCompanionBuilder,
      $$ProductNutrientsTableUpdateCompanionBuilder,
      (ProductNutrient, $$ProductNutrientsTableReferences),
      ProductNutrient,
      PrefetchHooks Function({bool productId, bool nutrientCode})
    >;
typedef $$ProductServingsTableCreateCompanionBuilder =
    ProductServingsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String productId,
      required String label,
      required double grams,
      Value<int> rowid,
    });
typedef $$ProductServingsTableUpdateCompanionBuilder =
    ProductServingsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> productId,
      Value<String> label,
      Value<double> grams,
      Value<int> rowid,
    });

final class $$ProductServingsTableReferences
    extends
        BaseReferences<_$AppDatabase, $ProductServingsTable, ProductServing> {
  $$ProductServingsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias('product_servings__product_id__products__id');

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProductServingsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductServingsTable> {
  $$ProductServingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get grams => $composableBuilder(
    column: $table.grams,
    builder: (column) => ColumnFilters(column),
  );

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductServingsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductServingsTable> {
  $$ProductServingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get grams => $composableBuilder(
    column: $table.grams,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductServingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductServingsTable> {
  $$ProductServingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<double> get grams =>
      $composableBuilder(column: $table.grams, builder: (column) => column);

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductServingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductServingsTable,
          ProductServing,
          $$ProductServingsTableFilterComposer,
          $$ProductServingsTableOrderingComposer,
          $$ProductServingsTableAnnotationComposer,
          $$ProductServingsTableCreateCompanionBuilder,
          $$ProductServingsTableUpdateCompanionBuilder,
          (ProductServing, $$ProductServingsTableReferences),
          ProductServing,
          PrefetchHooks Function({bool productId})
        > {
  $$ProductServingsTableTableManager(
    _$AppDatabase db,
    $ProductServingsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductServingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductServingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductServingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<double> grams = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductServingsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                productId: productId,
                label: label,
                grams: grams,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String productId,
                required String label,
                required double grams,
                Value<int> rowid = const Value.absent(),
              }) => ProductServingsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                productId: productId,
                label: label,
                grams: grams,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProductServingsTable, ProductServing>(table),
                  $$ProductServingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (productId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.productId,
                        referencedTable: $$ProductServingsTableReferences
                            ._productIdTable(db),
                        referencedColumn: $$ProductServingsTableReferences
                            ._productIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProductServingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductServingsTable,
      ProductServing,
      $$ProductServingsTableFilterComposer,
      $$ProductServingsTableOrderingComposer,
      $$ProductServingsTableAnnotationComposer,
      $$ProductServingsTableCreateCompanionBuilder,
      $$ProductServingsTableUpdateCompanionBuilder,
      (ProductServing, $$ProductServingsTableReferences),
      ProductServing,
      PrefetchHooks Function({bool productId})
    >;
typedef $$DishesTableCreateCompanionBuilder = DishesCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<String?> ownerId,
  Value<ContentVisibility> visibility,
  required String name,
  Value<String?> description,
  Value<double?> cookedWeightG,
  Value<int> rowid,
});
typedef $$DishesTableUpdateCompanionBuilder = DishesCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<String?> ownerId,
  Value<ContentVisibility> visibility,
  Value<String> name,
  Value<String?> description,
  Value<double?> cookedWeightG,
  Value<int> rowid,
});

final class $$DishesTableReferences
    extends BaseReferences<_$AppDatabase, $DishesTable, Dish> {
  $$DishesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DishItemsTable, List<DishItem>>
  _dishItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dishItems,
    aliasName: 'dishes__id__dish_items__dish_id',
  );

  $$DishItemsTableProcessedTableManager get dishItemsRefs {
    final manager = $$DishItemsTableTableManager(
      $_db,
      $_db.dishItems,
    ).filter((f) => f.dishId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_dishItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DishMealGroupsTable, List<DishMealGroup>>
  _dishMealGroupsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dishMealGroups,
    aliasName: 'dishes__id__dish_meal_groups__dish_id',
  );

  $$DishMealGroupsTableProcessedTableManager get dishMealGroupsRefs {
    final manager = $$DishMealGroupsTableTableManager(
      $_db,
      $_db.dishMealGroups,
    ).filter((f) => f.dishId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_dishMealGroupsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DiaryEntriesTable, List<DiaryEntry>>
  _diaryEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.diaryEntries,
    aliasName: 'dishes__id__diary_entries__dish_id',
  );

  $$DiaryEntriesTableProcessedTableManager get diaryEntriesRefs {
    final manager = $$DiaryEntriesTableTableManager(
      $_db,
      $_db.diaryEntries,
    ).filter((f) => f.dishId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_diaryEntriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DishesTableFilterComposer
    extends Composer<_$AppDatabase, $DishesTable> {
  $$DishesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ContentVisibility, ContentVisibility, String>
  get visibility => $composableBuilder(
    column: $table.visibility,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cookedWeightG => $composableBuilder(
    column: $table.cookedWeightG,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> dishItemsRefs(
    Expression<bool> Function($$DishItemsTableFilterComposer f) f,
  ) {
    final $$DishItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dishItems,
      getReferencedColumn: (t) => t.dishId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DishItemsTableFilterComposer(
            $db: $db,
            $table: $db.dishItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dishMealGroupsRefs(
    Expression<bool> Function($$DishMealGroupsTableFilterComposer f) f,
  ) {
    final $$DishMealGroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dishMealGroups,
      getReferencedColumn: (t) => t.dishId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DishMealGroupsTableFilterComposer(
            $db: $db,
            $table: $db.dishMealGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> diaryEntriesRefs(
    Expression<bool> Function($$DiaryEntriesTableFilterComposer f) f,
  ) {
    final $$DiaryEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.diaryEntries,
      getReferencedColumn: (t) => t.dishId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiaryEntriesTableFilterComposer(
            $db: $db,
            $table: $db.diaryEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DishesTableOrderingComposer
    extends Composer<_$AppDatabase, $DishesTable> {
  $$DishesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get visibility => $composableBuilder(
    column: $table.visibility,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cookedWeightG => $composableBuilder(
    column: $table.cookedWeightG,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DishesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DishesTable> {
  $$DishesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ContentVisibility, String> get visibility =>
      $composableBuilder(
        column: $table.visibility,
        builder: (column) => column,
      );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<double> get cookedWeightG => $composableBuilder(
    column: $table.cookedWeightG,
    builder: (column) => column,
  );

  Expression<T> dishItemsRefs<T extends Object>(
    Expression<T> Function($$DishItemsTableAnnotationComposer a) f,
  ) {
    final $$DishItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dishItems,
      getReferencedColumn: (t) => t.dishId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DishItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.dishItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> dishMealGroupsRefs<T extends Object>(
    Expression<T> Function($$DishMealGroupsTableAnnotationComposer a) f,
  ) {
    final $$DishMealGroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dishMealGroups,
      getReferencedColumn: (t) => t.dishId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DishMealGroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.dishMealGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> diaryEntriesRefs<T extends Object>(
    Expression<T> Function($$DiaryEntriesTableAnnotationComposer a) f,
  ) {
    final $$DiaryEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.diaryEntries,
      getReferencedColumn: (t) => t.dishId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiaryEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.diaryEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DishesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DishesTable,
          Dish,
          $$DishesTableFilterComposer,
          $$DishesTableOrderingComposer,
          $$DishesTableAnnotationComposer,
          $$DishesTableCreateCompanionBuilder,
          $$DishesTableUpdateCompanionBuilder,
          (Dish, $$DishesTableReferences),
          Dish,
          PrefetchHooks Function({
            bool dishItemsRefs,
            bool dishMealGroupsRefs,
            bool diaryEntriesRefs,
          })
        > {
  $$DishesTableTableManager(_$AppDatabase db, $DishesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DishesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DishesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DishesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> ownerId = const Value.absent(),
                Value<ContentVisibility> visibility = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<double?> cookedWeightG = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DishesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                ownerId: ownerId,
                visibility: visibility,
                name: name,
                description: description,
                cookedWeightG: cookedWeightG,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> ownerId = const Value.absent(),
                Value<ContentVisibility> visibility = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<double?> cookedWeightG = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DishesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                ownerId: ownerId,
                visibility: visibility,
                name: name,
                description: description,
                cookedWeightG: cookedWeightG,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DishesTable, Dish>(table),
                  $$DishesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                dishItemsRefs = false,
                dishMealGroupsRefs = false,
                diaryEntriesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (dishItemsRefs) db.dishItems,
                    if (dishMealGroupsRefs) db.dishMealGroups,
                    if (diaryEntriesRefs) db.diaryEntries,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (dishItemsRefs)
                        await $_getPrefetchedDataByColumns<
                          Dish,
                          $DishesTable,
                          DishItem,
                          $DishItemsTable
                        >(
                          currentTable: table,
                          referencedTable: $$DishesTableReferences
                              ._dishItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DishesTableReferences(
                                db,
                                table,
                                p0,
                              ).dishItemsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'dish_id',
                          typedResults: items,
                        ),
                      if (dishMealGroupsRefs)
                        await $_getPrefetchedDataByColumns<
                          Dish,
                          $DishesTable,
                          DishMealGroup,
                          $DishMealGroupsTable
                        >(
                          currentTable: table,
                          referencedTable: $$DishesTableReferences
                              ._dishMealGroupsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DishesTableReferences(
                                db,
                                table,
                                p0,
                              ).dishMealGroupsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'dish_id',
                          typedResults: items,
                        ),
                      if (diaryEntriesRefs)
                        await $_getPrefetchedDataByColumns<
                          Dish,
                          $DishesTable,
                          DiaryEntry,
                          $DiaryEntriesTable
                        >(
                          currentTable: table,
                          referencedTable: $$DishesTableReferences
                              ._diaryEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DishesTableReferences(
                                db,
                                table,
                                p0,
                              ).diaryEntriesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'dish_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DishesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DishesTable,
      Dish,
      $$DishesTableFilterComposer,
      $$DishesTableOrderingComposer,
      $$DishesTableAnnotationComposer,
      $$DishesTableCreateCompanionBuilder,
      $$DishesTableUpdateCompanionBuilder,
      (Dish, $$DishesTableReferences),
      Dish,
      PrefetchHooks Function({
        bool dishItemsRefs,
        bool dishMealGroupsRefs,
        bool diaryEntriesRefs,
      })
    >;
typedef $$DishItemsTableCreateCompanionBuilder = DishItemsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  required String dishId,
  required String productId,
  required double grams,
  Value<int> sortOrder,
  Value<int> rowid,
});
typedef $$DishItemsTableUpdateCompanionBuilder = DishItemsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<String> dishId,
  Value<String> productId,
  Value<double> grams,
  Value<int> sortOrder,
  Value<int> rowid,
});

final class $$DishItemsTableReferences
    extends BaseReferences<_$AppDatabase, $DishItemsTable, DishItem> {
  $$DishItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DishesTable _dishIdTable(_$AppDatabase db) =>
      db.dishes.createAlias('dish_items__dish_id__dishes__id');

  $$DishesTableProcessedTableManager get dishId {
    final $_column = $_itemColumn<String>('dish_id')!;

    final manager = $$DishesTableTableManager(
      $_db,
      $_db.dishes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dishIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias('dish_items__product_id__products__id');

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DishItemsTableFilterComposer
    extends Composer<_$AppDatabase, $DishItemsTable> {
  $$DishItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get grams => $composableBuilder(
    column: $table.grams,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  $$DishesTableFilterComposer get dishId {
    final $$DishesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dishId,
      referencedTable: $db.dishes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DishesTableFilterComposer(
            $db: $db,
            $table: $db.dishes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DishItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $DishItemsTable> {
  $$DishItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get grams => $composableBuilder(
    column: $table.grams,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  $$DishesTableOrderingComposer get dishId {
    final $$DishesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dishId,
      referencedTable: $db.dishes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DishesTableOrderingComposer(
            $db: $db,
            $table: $db.dishes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DishItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DishItemsTable> {
  $$DishItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<double> get grams =>
      $composableBuilder(column: $table.grams, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  $$DishesTableAnnotationComposer get dishId {
    final $$DishesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dishId,
      referencedTable: $db.dishes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DishesTableAnnotationComposer(
            $db: $db,
            $table: $db.dishes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DishItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DishItemsTable,
          DishItem,
          $$DishItemsTableFilterComposer,
          $$DishItemsTableOrderingComposer,
          $$DishItemsTableAnnotationComposer,
          $$DishItemsTableCreateCompanionBuilder,
          $$DishItemsTableUpdateCompanionBuilder,
          (DishItem, $$DishItemsTableReferences),
          DishItem,
          PrefetchHooks Function({bool dishId, bool productId})
        > {
  $$DishItemsTableTableManager(_$AppDatabase db, $DishItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DishItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DishItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DishItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> dishId = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<double> grams = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DishItemsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                dishId: dishId,
                productId: productId,
                grams: grams,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String dishId,
                required String productId,
                required double grams,
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DishItemsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                dishId: dishId,
                productId: productId,
                grams: grams,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DishItemsTable, DishItem>(table),
                  $$DishItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dishId = false, productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (dishId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.dishId,
                        referencedTable: $$DishItemsTableReferences
                            ._dishIdTable(db),
                        referencedColumn: $$DishItemsTableReferences
                            ._dishIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (productId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.productId,
                        referencedTable: $$DishItemsTableReferences
                            ._productIdTable(db),
                        referencedColumn: $$DishItemsTableReferences
                            ._productIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DishItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DishItemsTable,
      DishItem,
      $$DishItemsTableFilterComposer,
      $$DishItemsTableOrderingComposer,
      $$DishItemsTableAnnotationComposer,
      $$DishItemsTableCreateCompanionBuilder,
      $$DishItemsTableUpdateCompanionBuilder,
      (DishItem, $$DishItemsTableReferences),
      DishItem,
      PrefetchHooks Function({bool dishId, bool productId})
    >;
typedef $$MealGroupsTableCreateCompanionBuilder = MealGroupsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<String?> systemKey,
  Value<String?> customName,
  Value<int> sortOrder,
  Value<bool> isHidden,
  Value<int> rowid,
});
typedef $$MealGroupsTableUpdateCompanionBuilder = MealGroupsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<String?> systemKey,
  Value<String?> customName,
  Value<int> sortOrder,
  Value<bool> isHidden,
  Value<int> rowid,
});

final class $$MealGroupsTableReferences
    extends BaseReferences<_$AppDatabase, $MealGroupsTable, MealGroup> {
  $$MealGroupsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DishMealGroupsTable, List<DishMealGroup>>
  _dishMealGroupsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dishMealGroups,
    aliasName: 'meal_groups__id__dish_meal_groups__meal_group_id',
  );

  $$DishMealGroupsTableProcessedTableManager get dishMealGroupsRefs {
    final manager = $$DishMealGroupsTableTableManager(
      $_db,
      $_db.dishMealGroups,
    ).filter((f) => f.mealGroupId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_dishMealGroupsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DiaryEntriesTable, List<DiaryEntry>>
  _diaryEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.diaryEntries,
    aliasName: 'meal_groups__id__diary_entries__meal_group_id',
  );

  $$DiaryEntriesTableProcessedTableManager get diaryEntriesRefs {
    final manager = $$DiaryEntriesTableTableManager(
      $_db,
      $_db.diaryEntries,
    ).filter((f) => f.mealGroupId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_diaryEntriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MealGroupsTableFilterComposer
    extends Composer<_$AppDatabase, $MealGroupsTable> {
  $$MealGroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get systemKey => $composableBuilder(
    column: $table.systemKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customName => $composableBuilder(
    column: $table.customName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isHidden => $composableBuilder(
    column: $table.isHidden,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> dishMealGroupsRefs(
    Expression<bool> Function($$DishMealGroupsTableFilterComposer f) f,
  ) {
    final $$DishMealGroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dishMealGroups,
      getReferencedColumn: (t) => t.mealGroupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DishMealGroupsTableFilterComposer(
            $db: $db,
            $table: $db.dishMealGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> diaryEntriesRefs(
    Expression<bool> Function($$DiaryEntriesTableFilterComposer f) f,
  ) {
    final $$DiaryEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.diaryEntries,
      getReferencedColumn: (t) => t.mealGroupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiaryEntriesTableFilterComposer(
            $db: $db,
            $table: $db.diaryEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MealGroupsTableOrderingComposer
    extends Composer<_$AppDatabase, $MealGroupsTable> {
  $$MealGroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get systemKey => $composableBuilder(
    column: $table.systemKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customName => $composableBuilder(
    column: $table.customName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isHidden => $composableBuilder(
    column: $table.isHidden,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MealGroupsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealGroupsTable> {
  $$MealGroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get systemKey =>
      $composableBuilder(column: $table.systemKey, builder: (column) => column);

  GeneratedColumn<String> get customName => $composableBuilder(
    column: $table.customName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<bool> get isHidden =>
      $composableBuilder(column: $table.isHidden, builder: (column) => column);

  Expression<T> dishMealGroupsRefs<T extends Object>(
    Expression<T> Function($$DishMealGroupsTableAnnotationComposer a) f,
  ) {
    final $$DishMealGroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dishMealGroups,
      getReferencedColumn: (t) => t.mealGroupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DishMealGroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.dishMealGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> diaryEntriesRefs<T extends Object>(
    Expression<T> Function($$DiaryEntriesTableAnnotationComposer a) f,
  ) {
    final $$DiaryEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.diaryEntries,
      getReferencedColumn: (t) => t.mealGroupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiaryEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.diaryEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MealGroupsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MealGroupsTable,
          MealGroup,
          $$MealGroupsTableFilterComposer,
          $$MealGroupsTableOrderingComposer,
          $$MealGroupsTableAnnotationComposer,
          $$MealGroupsTableCreateCompanionBuilder,
          $$MealGroupsTableUpdateCompanionBuilder,
          (MealGroup, $$MealGroupsTableReferences),
          MealGroup,
          PrefetchHooks Function({
            bool dishMealGroupsRefs,
            bool diaryEntriesRefs,
          })
        > {
  $$MealGroupsTableTableManager(_$AppDatabase db, $MealGroupsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealGroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealGroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealGroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> systemKey = const Value.absent(),
                Value<String?> customName = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<bool> isHidden = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MealGroupsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                systemKey: systemKey,
                customName: customName,
                sortOrder: sortOrder,
                isHidden: isHidden,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> systemKey = const Value.absent(),
                Value<String?> customName = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<bool> isHidden = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MealGroupsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                systemKey: systemKey,
                customName: customName,
                sortOrder: sortOrder,
                isHidden: isHidden,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MealGroupsTable, MealGroup>(table),
                  $$MealGroupsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({dishMealGroupsRefs = false, diaryEntriesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (dishMealGroupsRefs) db.dishMealGroups,
                    if (diaryEntriesRefs) db.diaryEntries,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (dishMealGroupsRefs)
                        await $_getPrefetchedDataByColumns<
                          MealGroup,
                          $MealGroupsTable,
                          DishMealGroup,
                          $DishMealGroupsTable
                        >(
                          currentTable: table,
                          referencedTable: $$MealGroupsTableReferences
                              ._dishMealGroupsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MealGroupsTableReferences(
                                db,
                                table,
                                p0,
                              ).dishMealGroupsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'meal_group_id',
                          typedResults: items,
                        ),
                      if (diaryEntriesRefs)
                        await $_getPrefetchedDataByColumns<
                          MealGroup,
                          $MealGroupsTable,
                          DiaryEntry,
                          $DiaryEntriesTable
                        >(
                          currentTable: table,
                          referencedTable: $$MealGroupsTableReferences
                              ._diaryEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MealGroupsTableReferences(
                                db,
                                table,
                                p0,
                              ).diaryEntriesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'meal_group_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$MealGroupsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MealGroupsTable,
      MealGroup,
      $$MealGroupsTableFilterComposer,
      $$MealGroupsTableOrderingComposer,
      $$MealGroupsTableAnnotationComposer,
      $$MealGroupsTableCreateCompanionBuilder,
      $$MealGroupsTableUpdateCompanionBuilder,
      (MealGroup, $$MealGroupsTableReferences),
      MealGroup,
      PrefetchHooks Function({bool dishMealGroupsRefs, bool diaryEntriesRefs})
    >;
typedef $$DishMealGroupsTableCreateCompanionBuilder =
    DishMealGroupsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String dishId,
      required String mealGroupId,
      Value<int> rowid,
    });
typedef $$DishMealGroupsTableUpdateCompanionBuilder =
    DishMealGroupsCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> dishId,
      Value<String> mealGroupId,
      Value<int> rowid,
    });

final class $$DishMealGroupsTableReferences
    extends BaseReferences<_$AppDatabase, $DishMealGroupsTable, DishMealGroup> {
  $$DishMealGroupsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DishesTable _dishIdTable(_$AppDatabase db) =>
      db.dishes.createAlias('dish_meal_groups__dish_id__dishes__id');

  $$DishesTableProcessedTableManager get dishId {
    final $_column = $_itemColumn<String>('dish_id')!;

    final manager = $$DishesTableTableManager(
      $_db,
      $_db.dishes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dishIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MealGroupsTable _mealGroupIdTable(_$AppDatabase db) => db.mealGroups
      .createAlias('dish_meal_groups__meal_group_id__meal_groups__id');

  $$MealGroupsTableProcessedTableManager get mealGroupId {
    final $_column = $_itemColumn<String>('meal_group_id')!;

    final manager = $$MealGroupsTableTableManager(
      $_db,
      $_db.mealGroups,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mealGroupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DishMealGroupsTableFilterComposer
    extends Composer<_$AppDatabase, $DishMealGroupsTable> {
  $$DishMealGroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DishesTableFilterComposer get dishId {
    final $$DishesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dishId,
      referencedTable: $db.dishes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DishesTableFilterComposer(
            $db: $db,
            $table: $db.dishes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MealGroupsTableFilterComposer get mealGroupId {
    final $$MealGroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealGroupId,
      referencedTable: $db.mealGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealGroupsTableFilterComposer(
            $db: $db,
            $table: $db.mealGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DishMealGroupsTableOrderingComposer
    extends Composer<_$AppDatabase, $DishMealGroupsTable> {
  $$DishMealGroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DishesTableOrderingComposer get dishId {
    final $$DishesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dishId,
      referencedTable: $db.dishes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DishesTableOrderingComposer(
            $db: $db,
            $table: $db.dishes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MealGroupsTableOrderingComposer get mealGroupId {
    final $$MealGroupsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealGroupId,
      referencedTable: $db.mealGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealGroupsTableOrderingComposer(
            $db: $db,
            $table: $db.mealGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DishMealGroupsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DishMealGroupsTable> {
  $$DishMealGroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$DishesTableAnnotationComposer get dishId {
    final $$DishesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dishId,
      referencedTable: $db.dishes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DishesTableAnnotationComposer(
            $db: $db,
            $table: $db.dishes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MealGroupsTableAnnotationComposer get mealGroupId {
    final $$MealGroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealGroupId,
      referencedTable: $db.mealGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealGroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.mealGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DishMealGroupsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DishMealGroupsTable,
          DishMealGroup,
          $$DishMealGroupsTableFilterComposer,
          $$DishMealGroupsTableOrderingComposer,
          $$DishMealGroupsTableAnnotationComposer,
          $$DishMealGroupsTableCreateCompanionBuilder,
          $$DishMealGroupsTableUpdateCompanionBuilder,
          (DishMealGroup, $$DishMealGroupsTableReferences),
          DishMealGroup,
          PrefetchHooks Function({bool dishId, bool mealGroupId})
        > {
  $$DishMealGroupsTableTableManager(
    _$AppDatabase db,
    $DishMealGroupsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DishMealGroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DishMealGroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DishMealGroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> dishId = const Value.absent(),
                Value<String> mealGroupId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DishMealGroupsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                dishId: dishId,
                mealGroupId: mealGroupId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String dishId,
                required String mealGroupId,
                Value<int> rowid = const Value.absent(),
              }) => DishMealGroupsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                dishId: dishId,
                mealGroupId: mealGroupId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DishMealGroupsTable, DishMealGroup>(table),
                  $$DishMealGroupsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dishId = false, mealGroupId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (dishId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.dishId,
                        referencedTable: $$DishMealGroupsTableReferences
                            ._dishIdTable(db),
                        referencedColumn: $$DishMealGroupsTableReferences
                            ._dishIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (mealGroupId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.mealGroupId,
                        referencedTable: $$DishMealGroupsTableReferences
                            ._mealGroupIdTable(db),
                        referencedColumn: $$DishMealGroupsTableReferences
                            ._mealGroupIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DishMealGroupsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DishMealGroupsTable,
      DishMealGroup,
      $$DishMealGroupsTableFilterComposer,
      $$DishMealGroupsTableOrderingComposer,
      $$DishMealGroupsTableAnnotationComposer,
      $$DishMealGroupsTableCreateCompanionBuilder,
      $$DishMealGroupsTableUpdateCompanionBuilder,
      (DishMealGroup, $$DishMealGroupsTableReferences),
      DishMealGroup,
      PrefetchHooks Function({bool dishId, bool mealGroupId})
    >;
typedef $$MediaTableCreateCompanionBuilder = MediaCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  required MediaOwner ownerType,
  required String ownerId,
  required MediaKind kind,
  Value<String?> localPath,
  Value<String?> remoteUrl,
  Value<String?> thumbPath,
  Value<int> sortOrder,
  Value<int?> width,
  Value<int?> height,
  Value<double?> durationS,
  Value<int> rowid,
});
typedef $$MediaTableUpdateCompanionBuilder = MediaCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<MediaOwner> ownerType,
  Value<String> ownerId,
  Value<MediaKind> kind,
  Value<String?> localPath,
  Value<String?> remoteUrl,
  Value<String?> thumbPath,
  Value<int> sortOrder,
  Value<int?> width,
  Value<int?> height,
  Value<double?> durationS,
  Value<int> rowid,
});

class $$MediaTableFilterComposer extends Composer<_$AppDatabase, $MediaTable> {
  $$MediaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MediaOwner, MediaOwner, String>
  get ownerType => $composableBuilder(
    column: $table.ownerType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MediaKind, MediaKind, String> get kind =>
      $composableBuilder(
        column: $table.kind,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteUrl => $composableBuilder(
    column: $table.remoteUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbPath => $composableBuilder(
    column: $table.thumbPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get durationS => $composableBuilder(
    column: $table.durationS,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MediaTableOrderingComposer
    extends Composer<_$AppDatabase, $MediaTable> {
  $$MediaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerType => $composableBuilder(
    column: $table.ownerType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteUrl => $composableBuilder(
    column: $table.remoteUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbPath => $composableBuilder(
    column: $table.thumbPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get durationS => $composableBuilder(
    column: $table.durationS,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MediaTableAnnotationComposer
    extends Composer<_$AppDatabase, $MediaTable> {
  $$MediaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MediaOwner, String> get ownerType =>
      $composableBuilder(column: $table.ownerType, builder: (column) => column);

  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MediaKind, String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<String> get remoteUrl =>
      $composableBuilder(column: $table.remoteUrl, builder: (column) => column);

  GeneratedColumn<String> get thumbPath =>
      $composableBuilder(column: $table.thumbPath, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<int> get width =>
      $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<int> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<double> get durationS =>
      $composableBuilder(column: $table.durationS, builder: (column) => column);
}

class $$MediaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MediaTable,
          MediaData,
          $$MediaTableFilterComposer,
          $$MediaTableOrderingComposer,
          $$MediaTableAnnotationComposer,
          $$MediaTableCreateCompanionBuilder,
          $$MediaTableUpdateCompanionBuilder,
          (MediaData, BaseReferences<_$AppDatabase, $MediaTable, MediaData>),
          MediaData,
          PrefetchHooks Function()
        > {
  $$MediaTableTableManager(_$AppDatabase db, $MediaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MediaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MediaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MediaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<MediaOwner> ownerType = const Value.absent(),
                Value<String> ownerId = const Value.absent(),
                Value<MediaKind> kind = const Value.absent(),
                Value<String?> localPath = const Value.absent(),
                Value<String?> remoteUrl = const Value.absent(),
                Value<String?> thumbPath = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int?> width = const Value.absent(),
                Value<int?> height = const Value.absent(),
                Value<double?> durationS = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MediaCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                ownerType: ownerType,
                ownerId: ownerId,
                kind: kind,
                localPath: localPath,
                remoteUrl: remoteUrl,
                thumbPath: thumbPath,
                sortOrder: sortOrder,
                width: width,
                height: height,
                durationS: durationS,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required MediaOwner ownerType,
                required String ownerId,
                required MediaKind kind,
                Value<String?> localPath = const Value.absent(),
                Value<String?> remoteUrl = const Value.absent(),
                Value<String?> thumbPath = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int?> width = const Value.absent(),
                Value<int?> height = const Value.absent(),
                Value<double?> durationS = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MediaCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                ownerType: ownerType,
                ownerId: ownerId,
                kind: kind,
                localPath: localPath,
                remoteUrl: remoteUrl,
                thumbPath: thumbPath,
                sortOrder: sortOrder,
                width: width,
                height: height,
                durationS: durationS,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MediaTable, MediaData>(table),
                  BaseReferences<_$AppDatabase, $MediaTable, MediaData>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MediaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MediaTable,
      MediaData,
      $$MediaTableFilterComposer,
      $$MediaTableOrderingComposer,
      $$MediaTableAnnotationComposer,
      $$MediaTableCreateCompanionBuilder,
      $$MediaTableUpdateCompanionBuilder,
      (MediaData, BaseReferences<_$AppDatabase, $MediaTable, MediaData>),
      MediaData,
      PrefetchHooks Function()
    >;
typedef $$MediaBlobsTableCreateCompanionBuilder = MediaBlobsCompanion Function({
  required String key,
  required Uint8List bytes,
  Value<int> rowid,
});
typedef $$MediaBlobsTableUpdateCompanionBuilder = MediaBlobsCompanion Function({
  Value<String> key,
  Value<Uint8List> bytes,
  Value<int> rowid,
});

class $$MediaBlobsTableFilterComposer
    extends Composer<_$AppDatabase, $MediaBlobsTable> {
  $$MediaBlobsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get bytes => $composableBuilder(
    column: $table.bytes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MediaBlobsTableOrderingComposer
    extends Composer<_$AppDatabase, $MediaBlobsTable> {
  $$MediaBlobsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get bytes => $composableBuilder(
    column: $table.bytes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MediaBlobsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MediaBlobsTable> {
  $$MediaBlobsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<Uint8List> get bytes =>
      $composableBuilder(column: $table.bytes, builder: (column) => column);
}

class $$MediaBlobsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MediaBlobsTable,
          MediaBlob,
          $$MediaBlobsTableFilterComposer,
          $$MediaBlobsTableOrderingComposer,
          $$MediaBlobsTableAnnotationComposer,
          $$MediaBlobsTableCreateCompanionBuilder,
          $$MediaBlobsTableUpdateCompanionBuilder,
          (
            MediaBlob,
            BaseReferences<_$AppDatabase, $MediaBlobsTable, MediaBlob>,
          ),
          MediaBlob,
          PrefetchHooks Function()
        > {
  $$MediaBlobsTableTableManager(_$AppDatabase db, $MediaBlobsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MediaBlobsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MediaBlobsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MediaBlobsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<Uint8List> bytes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) => MediaBlobsCompanion(key: key, bytes: bytes, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required Uint8List bytes,
                Value<int> rowid = const Value.absent(),
              }) => MediaBlobsCompanion.insert(
                key: key,
                bytes: bytes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MediaBlobsTable, MediaBlob>(table),
                  BaseReferences<_$AppDatabase, $MediaBlobsTable, MediaBlob>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MediaBlobsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MediaBlobsTable,
      MediaBlob,
      $$MediaBlobsTableFilterComposer,
      $$MediaBlobsTableOrderingComposer,
      $$MediaBlobsTableAnnotationComposer,
      $$MediaBlobsTableCreateCompanionBuilder,
      $$MediaBlobsTableUpdateCompanionBuilder,
      (MediaBlob, BaseReferences<_$AppDatabase, $MediaBlobsTable, MediaBlob>),
      MediaBlob,
      PrefetchHooks Function()
    >;
typedef $$DiaryEntriesTableCreateCompanionBuilder =
    DiaryEntriesCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      required String day,
      Value<String?> mealGroupId,
      Value<String?> productId,
      Value<String?> dishId,
      required double grams,
      required double snapshotKcal,
      required double snapshotProtein,
      required double snapshotFat,
      required double snapshotCarbs,
      Value<String?> snapshotExtra,
      Value<int> rowid,
    });
typedef $$DiaryEntriesTableUpdateCompanionBuilder =
    DiaryEntriesCompanion Function({
      Value<String> id,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> day,
      Value<String?> mealGroupId,
      Value<String?> productId,
      Value<String?> dishId,
      Value<double> grams,
      Value<double> snapshotKcal,
      Value<double> snapshotProtein,
      Value<double> snapshotFat,
      Value<double> snapshotCarbs,
      Value<String?> snapshotExtra,
      Value<int> rowid,
    });

final class $$DiaryEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $DiaryEntriesTable, DiaryEntry> {
  $$DiaryEntriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MealGroupsTable _mealGroupIdTable(_$AppDatabase db) => db.mealGroups
      .createAlias('diary_entries__meal_group_id__meal_groups__id');

  $$MealGroupsTableProcessedTableManager? get mealGroupId {
    final $_column = $_itemColumn<String>('meal_group_id');
    if ($_column == null) return null;
    final manager = $$MealGroupsTableTableManager(
      $_db,
      $_db.mealGroups,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mealGroupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias('diary_entries__product_id__products__id');

  $$ProductsTableProcessedTableManager? get productId {
    final $_column = $_itemColumn<String>('product_id');
    if ($_column == null) return null;
    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DishesTable _dishIdTable(_$AppDatabase db) =>
      db.dishes.createAlias('diary_entries__dish_id__dishes__id');

  $$DishesTableProcessedTableManager? get dishId {
    final $_column = $_itemColumn<String>('dish_id');
    if ($_column == null) return null;
    final manager = $$DishesTableTableManager(
      $_db,
      $_db.dishes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dishIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DiaryEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $DiaryEntriesTable> {
  $$DiaryEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get grams => $composableBuilder(
    column: $table.grams,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get snapshotKcal => $composableBuilder(
    column: $table.snapshotKcal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get snapshotProtein => $composableBuilder(
    column: $table.snapshotProtein,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get snapshotFat => $composableBuilder(
    column: $table.snapshotFat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get snapshotCarbs => $composableBuilder(
    column: $table.snapshotCarbs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get snapshotExtra => $composableBuilder(
    column: $table.snapshotExtra,
    builder: (column) => ColumnFilters(column),
  );

  $$MealGroupsTableFilterComposer get mealGroupId {
    final $$MealGroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealGroupId,
      referencedTable: $db.mealGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealGroupsTableFilterComposer(
            $db: $db,
            $table: $db.mealGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DishesTableFilterComposer get dishId {
    final $$DishesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dishId,
      referencedTable: $db.dishes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DishesTableFilterComposer(
            $db: $db,
            $table: $db.dishes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DiaryEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $DiaryEntriesTable> {
  $$DiaryEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get grams => $composableBuilder(
    column: $table.grams,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get snapshotKcal => $composableBuilder(
    column: $table.snapshotKcal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get snapshotProtein => $composableBuilder(
    column: $table.snapshotProtein,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get snapshotFat => $composableBuilder(
    column: $table.snapshotFat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get snapshotCarbs => $composableBuilder(
    column: $table.snapshotCarbs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get snapshotExtra => $composableBuilder(
    column: $table.snapshotExtra,
    builder: (column) => ColumnOrderings(column),
  );

  $$MealGroupsTableOrderingComposer get mealGroupId {
    final $$MealGroupsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealGroupId,
      referencedTable: $db.mealGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealGroupsTableOrderingComposer(
            $db: $db,
            $table: $db.mealGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DishesTableOrderingComposer get dishId {
    final $$DishesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dishId,
      referencedTable: $db.dishes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DishesTableOrderingComposer(
            $db: $db,
            $table: $db.dishes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DiaryEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DiaryEntriesTable> {
  $$DiaryEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);

  GeneratedColumn<double> get grams =>
      $composableBuilder(column: $table.grams, builder: (column) => column);

  GeneratedColumn<double> get snapshotKcal => $composableBuilder(
    column: $table.snapshotKcal,
    builder: (column) => column,
  );

  GeneratedColumn<double> get snapshotProtein => $composableBuilder(
    column: $table.snapshotProtein,
    builder: (column) => column,
  );

  GeneratedColumn<double> get snapshotFat => $composableBuilder(
    column: $table.snapshotFat,
    builder: (column) => column,
  );

  GeneratedColumn<double> get snapshotCarbs => $composableBuilder(
    column: $table.snapshotCarbs,
    builder: (column) => column,
  );

  GeneratedColumn<String> get snapshotExtra => $composableBuilder(
    column: $table.snapshotExtra,
    builder: (column) => column,
  );

  $$MealGroupsTableAnnotationComposer get mealGroupId {
    final $$MealGroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.mealGroupId,
      referencedTable: $db.mealGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MealGroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.mealGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DishesTableAnnotationComposer get dishId {
    final $$DishesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dishId,
      referencedTable: $db.dishes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DishesTableAnnotationComposer(
            $db: $db,
            $table: $db.dishes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DiaryEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DiaryEntriesTable,
          DiaryEntry,
          $$DiaryEntriesTableFilterComposer,
          $$DiaryEntriesTableOrderingComposer,
          $$DiaryEntriesTableAnnotationComposer,
          $$DiaryEntriesTableCreateCompanionBuilder,
          $$DiaryEntriesTableUpdateCompanionBuilder,
          (DiaryEntry, $$DiaryEntriesTableReferences),
          DiaryEntry,
          PrefetchHooks Function({
            bool mealGroupId,
            bool productId,
            bool dishId,
          })
        > {
  $$DiaryEntriesTableTableManager(_$AppDatabase db, $DiaryEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DiaryEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DiaryEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DiaryEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> day = const Value.absent(),
                Value<String?> mealGroupId = const Value.absent(),
                Value<String?> productId = const Value.absent(),
                Value<String?> dishId = const Value.absent(),
                Value<double> grams = const Value.absent(),
                Value<double> snapshotKcal = const Value.absent(),
                Value<double> snapshotProtein = const Value.absent(),
                Value<double> snapshotFat = const Value.absent(),
                Value<double> snapshotCarbs = const Value.absent(),
                Value<String?> snapshotExtra = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DiaryEntriesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                day: day,
                mealGroupId: mealGroupId,
                productId: productId,
                dishId: dishId,
                grams: grams,
                snapshotKcal: snapshotKcal,
                snapshotProtein: snapshotProtein,
                snapshotFat: snapshotFat,
                snapshotCarbs: snapshotCarbs,
                snapshotExtra: snapshotExtra,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String day,
                Value<String?> mealGroupId = const Value.absent(),
                Value<String?> productId = const Value.absent(),
                Value<String?> dishId = const Value.absent(),
                required double grams,
                required double snapshotKcal,
                required double snapshotProtein,
                required double snapshotFat,
                required double snapshotCarbs,
                Value<String?> snapshotExtra = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DiaryEntriesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                day: day,
                mealGroupId: mealGroupId,
                productId: productId,
                dishId: dishId,
                grams: grams,
                snapshotKcal: snapshotKcal,
                snapshotProtein: snapshotProtein,
                snapshotFat: snapshotFat,
                snapshotCarbs: snapshotCarbs,
                snapshotExtra: snapshotExtra,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DiaryEntriesTable, DiaryEntry>(table),
                  $$DiaryEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({mealGroupId = false, productId = false, dishId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
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
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (mealGroupId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.mealGroupId,
                            referencedTable: $$DiaryEntriesTableReferences
                                ._mealGroupIdTable(db),
                            referencedColumn: $$DiaryEntriesTableReferences
                                ._mealGroupIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (productId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.productId,
                            referencedTable: $$DiaryEntriesTableReferences
                                ._productIdTable(db),
                            referencedColumn: $$DiaryEntriesTableReferences
                                ._productIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (dishId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.dishId,
                            referencedTable: $$DiaryEntriesTableReferences
                                ._dishIdTable(db),
                            referencedColumn: $$DiaryEntriesTableReferences
                                ._dishIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$DiaryEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DiaryEntriesTable,
      DiaryEntry,
      $$DiaryEntriesTableFilterComposer,
      $$DiaryEntriesTableOrderingComposer,
      $$DiaryEntriesTableAnnotationComposer,
      $$DiaryEntriesTableCreateCompanionBuilder,
      $$DiaryEntriesTableUpdateCompanionBuilder,
      (DiaryEntry, $$DiaryEntriesTableReferences),
      DiaryEntry,
      PrefetchHooks Function({bool mealGroupId, bool productId, bool dishId})
    >;
typedef $$ProfilesTableCreateCompanionBuilder = ProfilesCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<Sex?> sex,
  Value<DateTime?> birthDate,
  Value<double?> heightCm,
  Value<ActivityLevel?> activityLevel,
  Value<WeightGoal?> weightGoal,
  Value<String> trackedNutrients,
  Value<int> rowid,
});
typedef $$ProfilesTableUpdateCompanionBuilder = ProfilesCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<Sex?> sex,
  Value<DateTime?> birthDate,
  Value<double?> heightCm,
  Value<ActivityLevel?> activityLevel,
  Value<WeightGoal?> weightGoal,
  Value<String> trackedNutrients,
  Value<int> rowid,
});

class $$ProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Sex?, Sex, String> get sex =>
      $composableBuilder(
        column: $table.sex,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get heightCm => $composableBuilder(
    column: $table.heightCm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ActivityLevel?, ActivityLevel, String>
  get activityLevel => $composableBuilder(
    column: $table.activityLevel,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<WeightGoal?, WeightGoal, String>
  get weightGoal => $composableBuilder(
    column: $table.weightGoal,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get trackedNutrients => $composableBuilder(
    column: $table.trackedNutrients,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get heightCm => $composableBuilder(
    column: $table.heightCm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activityLevel => $composableBuilder(
    column: $table.activityLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weightGoal => $composableBuilder(
    column: $table.weightGoal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trackedNutrients => $composableBuilder(
    column: $table.trackedNutrients,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Sex?, String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<DateTime> get birthDate =>
      $composableBuilder(column: $table.birthDate, builder: (column) => column);

  GeneratedColumn<double> get heightCm =>
      $composableBuilder(column: $table.heightCm, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ActivityLevel?, String> get activityLevel =>
      $composableBuilder(
        column: $table.activityLevel,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<WeightGoal?, String> get weightGoal =>
      $composableBuilder(
        column: $table.weightGoal,
        builder: (column) => column,
      );

  GeneratedColumn<String> get trackedNutrients => $composableBuilder(
    column: $table.trackedNutrients,
    builder: (column) => column,
  );
}

class $$ProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProfilesTable,
          Profile,
          $$ProfilesTableFilterComposer,
          $$ProfilesTableOrderingComposer,
          $$ProfilesTableAnnotationComposer,
          $$ProfilesTableCreateCompanionBuilder,
          $$ProfilesTableUpdateCompanionBuilder,
          (Profile, BaseReferences<_$AppDatabase, $ProfilesTable, Profile>),
          Profile,
          PrefetchHooks Function()
        > {
  $$ProfilesTableTableManager(_$AppDatabase db, $ProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<Sex?> sex = const Value.absent(),
                Value<DateTime?> birthDate = const Value.absent(),
                Value<double?> heightCm = const Value.absent(),
                Value<ActivityLevel?> activityLevel = const Value.absent(),
                Value<WeightGoal?> weightGoal = const Value.absent(),
                Value<String> trackedNutrients = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProfilesCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                sex: sex,
                birthDate: birthDate,
                heightCm: heightCm,
                activityLevel: activityLevel,
                weightGoal: weightGoal,
                trackedNutrients: trackedNutrients,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<Sex?> sex = const Value.absent(),
                Value<DateTime?> birthDate = const Value.absent(),
                Value<double?> heightCm = const Value.absent(),
                Value<ActivityLevel?> activityLevel = const Value.absent(),
                Value<WeightGoal?> weightGoal = const Value.absent(),
                Value<String> trackedNutrients = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProfilesCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                sex: sex,
                birthDate: birthDate,
                heightCm: heightCm,
                activityLevel: activityLevel,
                weightGoal: weightGoal,
                trackedNutrients: trackedNutrients,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProfilesTable, Profile>(table),
                  BaseReferences<_$AppDatabase, $ProfilesTable, Profile>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProfilesTable,
      Profile,
      $$ProfilesTableFilterComposer,
      $$ProfilesTableOrderingComposer,
      $$ProfilesTableAnnotationComposer,
      $$ProfilesTableCreateCompanionBuilder,
      $$ProfilesTableUpdateCompanionBuilder,
      (Profile, BaseReferences<_$AppDatabase, $ProfilesTable, Profile>),
      Profile,
      PrefetchHooks Function()
    >;
typedef $$WeightLogTableCreateCompanionBuilder = WeightLogCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  required String day,
  required double weightKg,
  Value<int> rowid,
});
typedef $$WeightLogTableUpdateCompanionBuilder = WeightLogCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<String> day,
  Value<double> weightKg,
  Value<int> rowid,
});

class $$WeightLogTableFilterComposer
    extends Composer<_$AppDatabase, $WeightLogTable> {
  $$WeightLogTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WeightLogTableOrderingComposer
    extends Composer<_$AppDatabase, $WeightLogTable> {
  $$WeightLogTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WeightLogTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeightLogTable> {
  $$WeightLogTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);
}

class $$WeightLogTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WeightLogTable,
          WeightEntry,
          $$WeightLogTableFilterComposer,
          $$WeightLogTableOrderingComposer,
          $$WeightLogTableAnnotationComposer,
          $$WeightLogTableCreateCompanionBuilder,
          $$WeightLogTableUpdateCompanionBuilder,
          (
            WeightEntry,
            BaseReferences<_$AppDatabase, $WeightLogTable, WeightEntry>,
          ),
          WeightEntry,
          PrefetchHooks Function()
        > {
  $$WeightLogTableTableManager(_$AppDatabase db, $WeightLogTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeightLogTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeightLogTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeightLogTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> day = const Value.absent(),
                Value<double> weightKg = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WeightLogCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                day: day,
                weightKg: weightKg,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String day,
                required double weightKg,
                Value<int> rowid = const Value.absent(),
              }) => WeightLogCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                day: day,
                weightKg: weightKg,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$WeightLogTable, WeightEntry>(table),
                  BaseReferences<_$AppDatabase, $WeightLogTable, WeightEntry>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WeightLogTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WeightLogTable,
      WeightEntry,
      $$WeightLogTableFilterComposer,
      $$WeightLogTableOrderingComposer,
      $$WeightLogTableAnnotationComposer,
      $$WeightLogTableCreateCompanionBuilder,
      $$WeightLogTableUpdateCompanionBuilder,
      (
        WeightEntry,
        BaseReferences<_$AppDatabase, $WeightLogTable, WeightEntry>,
      ),
      WeightEntry,
      PrefetchHooks Function()
    >;
typedef $$GoalsTableCreateCompanionBuilder = GoalsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<GoalMode> mode,
  Value<double?> kcal,
  Value<double?> protein,
  Value<double?> fat,
  Value<double?> carbs,
  Value<String?> extra,
  Value<int> rowid,
});
typedef $$GoalsTableUpdateCompanionBuilder = GoalsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<GoalMode> mode,
  Value<double?> kcal,
  Value<double?> protein,
  Value<double?> fat,
  Value<double?> carbs,
  Value<String?> extra,
  Value<int> rowid,
});

class $$GoalsTableFilterComposer extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<GoalMode, GoalMode, String> get mode =>
      $composableBuilder(
        column: $table.mode,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<double> get kcal => $composableBuilder(
    column: $table.kcal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get extra => $composableBuilder(
    column: $table.extra,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get kcal => $composableBuilder(
    column: $table.kcal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get extra => $composableBuilder(
    column: $table.extra,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<GoalMode, String> get mode =>
      $composableBuilder(column: $table.mode, builder: (column) => column);

  GeneratedColumn<double> get kcal =>
      $composableBuilder(column: $table.kcal, builder: (column) => column);

  GeneratedColumn<double> get protein =>
      $composableBuilder(column: $table.protein, builder: (column) => column);

  GeneratedColumn<double> get fat =>
      $composableBuilder(column: $table.fat, builder: (column) => column);

  GeneratedColumn<double> get carbs =>
      $composableBuilder(column: $table.carbs, builder: (column) => column);

  GeneratedColumn<String> get extra =>
      $composableBuilder(column: $table.extra, builder: (column) => column);
}

class $$GoalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GoalsTable,
          Goal,
          $$GoalsTableFilterComposer,
          $$GoalsTableOrderingComposer,
          $$GoalsTableAnnotationComposer,
          $$GoalsTableCreateCompanionBuilder,
          $$GoalsTableUpdateCompanionBuilder,
          (Goal, BaseReferences<_$AppDatabase, $GoalsTable, Goal>),
          Goal,
          PrefetchHooks Function()
        > {
  $$GoalsTableTableManager(_$AppDatabase db, $GoalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<GoalMode> mode = const Value.absent(),
                Value<double?> kcal = const Value.absent(),
                Value<double?> protein = const Value.absent(),
                Value<double?> fat = const Value.absent(),
                Value<double?> carbs = const Value.absent(),
                Value<String?> extra = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GoalsCompanion(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                mode: mode,
                kcal: kcal,
                protein: protein,
                fat: fat,
                carbs: carbs,
                extra: extra,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<GoalMode> mode = const Value.absent(),
                Value<double?> kcal = const Value.absent(),
                Value<double?> protein = const Value.absent(),
                Value<double?> fat = const Value.absent(),
                Value<double?> carbs = const Value.absent(),
                Value<String?> extra = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GoalsCompanion.insert(
                id: id,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                mode: mode,
                kcal: kcal,
                protein: protein,
                fat: fat,
                carbs: carbs,
                extra: extra,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$GoalsTable, Goal>(table),
                  BaseReferences<_$AppDatabase, $GoalsTable, Goal>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GoalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GoalsTable,
      Goal,
      $$GoalsTableFilterComposer,
      $$GoalsTableOrderingComposer,
      $$GoalsTableAnnotationComposer,
      $$GoalsTableCreateCompanionBuilder,
      $$GoalsTableUpdateCompanionBuilder,
      (Goal, BaseReferences<_$AppDatabase, $GoalsTable, Goal>),
      Goal,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$NutrientDefinitionsTableTableManager get nutrientDefinitions =>
      $$NutrientDefinitionsTableTableManager(_db, _db.nutrientDefinitions);
  $$ProductNutrientsTableTableManager get productNutrients =>
      $$ProductNutrientsTableTableManager(_db, _db.productNutrients);
  $$ProductServingsTableTableManager get productServings =>
      $$ProductServingsTableTableManager(_db, _db.productServings);
  $$DishesTableTableManager get dishes =>
      $$DishesTableTableManager(_db, _db.dishes);
  $$DishItemsTableTableManager get dishItems =>
      $$DishItemsTableTableManager(_db, _db.dishItems);
  $$MealGroupsTableTableManager get mealGroups =>
      $$MealGroupsTableTableManager(_db, _db.mealGroups);
  $$DishMealGroupsTableTableManager get dishMealGroups =>
      $$DishMealGroupsTableTableManager(_db, _db.dishMealGroups);
  $$MediaTableTableManager get media =>
      $$MediaTableTableManager(_db, _db.media);
  $$MediaBlobsTableTableManager get mediaBlobs =>
      $$MediaBlobsTableTableManager(_db, _db.mediaBlobs);
  $$DiaryEntriesTableTableManager get diaryEntries =>
      $$DiaryEntriesTableTableManager(_db, _db.diaryEntries);
  $$ProfilesTableTableManager get profiles =>
      $$ProfilesTableTableManager(_db, _db.profiles);
  $$WeightLogTableTableManager get weightLog =>
      $$WeightLogTableTableManager(_db, _db.weightLog);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db, _db.goals);
}
