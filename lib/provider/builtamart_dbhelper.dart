import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;

class BuiltaMartDBHelper with ChangeNotifier {
  static const TABLE_USER_STATE = "users_state";

  sql.Database? db;
  static late String databasePath;

  BuiltaMartDBHelper() {
    if(db == null) {
      init();
    }
  }

  void init() async {
    databasePath = join(await sql.getDatabasesPath(), 'builtamart.db');
    db = await sql.openDatabase(
      databasePath,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE IF NOT EXISTS $TABLE_USER_STATE ("
              "user TEXT, "
              "tab TEXT, "
              "image TEXT, "
              "carousel INTEGER "
              ")",
        );
      },
      version: 1,
    );
    notifyListeners();
  }

  static deleteCurrentDatabase() async {
    await sql.deleteDatabase(databasePath);
  }

  Future<List<Map<String, dynamic>>> getUser(String username) async {
    return db!.query(BuiltaMartDBHelper.TABLE_USER_STATE,
        where: "user = ?",
        whereArgs: [username],
        limit: 1
    );
  }

  Future<List<Map<String, dynamic>>> getTabImages(String username, String tab) async {
    return db!.query(BuiltaMartDBHelper.TABLE_USER_STATE,
        where: "user = ? and tab = ?",
        whereArgs: [username, tab]
    );
  }

  Future<List<Map<String, dynamic>>> getCarouselImages(String username) async {
    return db!.query(BuiltaMartDBHelper.TABLE_USER_STATE,
        where: "user = ? and carousel = ?",
        whereArgs: [username, 1]
    );
  }

  Future<void> insert(String table, Map<String, Object> data) async {
    await db!.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.ignore);
  }

  Future<int> updateItem(Map<String, dynamic> data, List<String> args) async {
    return await db!.update(BuiltaMartDBHelper.TABLE_USER_STATE, data, where: "user = ? and image = ?", whereArgs: args);
  }

  Future<List<Map<String, dynamic>>> getData(String table) async {
    return await db!.query(table);
  }

}