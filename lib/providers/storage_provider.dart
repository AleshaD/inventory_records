import 'package:inventory/models/count_item.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class StorageProvider {
  StorageProvider() {
    init();
  }

  late Database _db;
  final int _dbVersion = 1;
  final String countItemsDb = 'countItems';

  void init() async {
    Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'count_items_database.db'),
      onCreate: (db, version) async {
        print('Create DB: v $version');
        await db.execute(
          "CREATE TABLE $countItemsDb(id INTEGER PRIMARY KEY, name TEXT, value INTEGER)",
        );
      },
      version: _dbVersion,
    );
    _db = await database;
  }

  Future<void> insertCountItem(CountItem item) async {
    await _db.insert(
      countItemsDb,
      item.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateCountItem(CountItem item) async {
    await _db.update(
      countItemsDb,
      item.toJson(),
      where: "id = ?",
      whereArgs: [item.id],
    );
  }

  Future<List<CountItem>> fetchProfiles() async {
    final List<Map<String, dynamic>> maps = await _db.query(countItemsDb);

    return List.generate(maps.length, (i) {
      return CountItem.fromJson(maps[i]);
    });
  }

  Future<void> deleteProfile(int id) async {
    await _db.delete(
      countItemsDb,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
