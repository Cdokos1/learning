
import 'dart:io';
import 'package:sqlite3/sqlite3.dart';

class DatabaseHelper {
  late Database _database;

  // Constructor
  DatabaseHelper(String path) {
    _openDatabase(path);
  }

  // Open database
  void _openDatabase(String path) {
    _database = sqlite3.open(path);
  }

  // Close database
  void closeDatabase() {
    _database.dispose();
  }

  // Create table
  void createTable() {
    _database.execute('''
      CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        surname TEXT,
        age INTEGER
      )
    ''');
  }

  // Insert user
  void insertUser(String name, int age) {
    _database.execute('''
      INSERT INTO users (name, age)
      VALUES (?, ?)
    ''', [name, age]);
  }

  // Update user
  void updateUser(int id, String name, int age) {
    _database.execute('''
      UPDATE users
      SET name = ?, age = ?
      WHERE id = ?
    ''', [name, age, id]);
  }

  // Delete user
  void deleteUser(int id) {
    _database.execute('''
      DELETE FROM users
      WHERE id = ?
    ''', [id]);

  }

  // Delete a range of user
  void deleteRangeUser(int id,int idEnd) {for (int i =id; i <= idEnd; i++ ){
    _database.execute('''
      DELETE FROM users
      WHERE id = ?
    ''', [id]);
    id = i;}
  }
List<Map<String, dynamic>> selectRangeName(String name){
    final list = _database.select('''
    SELECT * FROM users
    WHERE name = ?
    ''', [name]);
    return list;
}
  // Fetch all users
  List<Map<String, dynamic>> getUsers() {
    final result = _database.select('SELECT * FROM users ');
    return result;
  }
}

void main() {
  final databasePath = 'example.db';
  final databaseHelper = DatabaseHelper(databasePath);

  // Create table
  databaseHelper.createTable();

  // Insert user
  databaseHelper.insertUser('John Doe', 30);

  // Update user
  databaseHelper.updateUser(1, 'Updated Name', 35);

  // Fetch users
  final users = databaseHelper.getUsers();
  print(users);

  // Close database
  databaseHelper.closeDatabase();
}
