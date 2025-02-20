import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
//import 'package:path_provider/path_provider.dart';
//import 'dart:io';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('parking_ticket_system.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE parked_cars (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        make TEXT,
        model TEXT,
        color TEXT,
        licenseNumber TEXT,
        parkedMinutes INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE parking_meters (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        purchasedMinutes INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE parking_tickets (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        make TEXT,
        model TEXT,
        color TEXT,
        licenseNumber TEXT,
        fine REAL,
        officerName TEXT,
        badgeNumber TEXT
      )
    ''');
  }

  Future<int> insert(String table, Map<String, dynamic> row) async {
    final db = await database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAll(String table) async {
    final db = await database;
    return await db.query(table);
  }

  Future<int> delete(String table, int id) async {
    final db = await database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(String table, Map<String, dynamic> row) async {
    final db = await database;
    return await db.update(
      table,
      row,
      where: 'id = ?',
      whereArgs: [row['id']],
    );
  }
}
