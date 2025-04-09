import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('cards.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE selected_cards (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            image TEXT NOT NULL
          )
        ''');
      },
    );
  }

  // Insert selected cards
  Future<void> saveSelectedCards(List<String> cardImages) async {
    final db = await instance.database;
    await db.delete('selected_cards'); // Clear previous selection
    for (var image in cardImages) {
      await db.insert('selected_cards', {'image': image});
    }
  }

  // Retrieve selected cards
  Future<List<String>> getSelectedCards() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('selected_cards');
    return maps.map((e) => e['image'] as String).toList();
  }

  // Clear selected cards
  Future<void> clearSelectedCards() async {
    final db = await instance.database;
    await db.delete('selected_cards');
  }

}
