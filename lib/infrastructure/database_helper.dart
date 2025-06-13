import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uiwidgets/domain/personel_model.dart';
import 'dart:io';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'asgard.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE person(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        firstName TEXT,
        lastName TEXT,
        age INTEGER,
        email TEXT,
        notes TEXT
      )
    ''');
  }

  Future<int> insertPerson(Person person) async {
    Database db = await database;
    return await db.insert('person', person.toMap());
  }

  Future<List<Person>> getAllPersons() async {
    Database db = await database;
    List<Map<String, dynamic>> results = await db.query('person');
    return results.map((map) => Person.fromMap(map)).toList();
  }
}
