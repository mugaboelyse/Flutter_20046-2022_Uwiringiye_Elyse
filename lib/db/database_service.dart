/*
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal();

  Future<Database> _getDatabase() async {
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
    await db.execute('''CREATE TABLE parked_cars (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      make TEXT,
      model TEXT,
      color TEXT,
      licenseNumber TEXT,
      parkedMinutes INTEGER
    )''');

    await db.execute('''CREATE TABLE parking_meters (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      purchasedMinutes INTEGER
    )''');

    await db.execute('''CREATE TABLE parking_tickets (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      make TEXT,
      model TEXT,
      color TEXT,
      licenseNumber TEXT,
      fine REAL,
      officerName TEXT,
      badgeNumber TEXT
    )''');
  }

  Future<int> insert(String table, Map<String, dynamic> row) async {
    final db = await _getDatabase();
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAll(String table) async {
    final db = await _getDatabase();
    return await db.query(table);
  }

  Future<int> delete(String table, int id) async {
    final db = await _getDatabase();
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
*/
