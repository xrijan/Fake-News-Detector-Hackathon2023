import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/news_model.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'bookmark.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE  bookmark (
  author TEXT,
  title TEXT,
  description TEXT,
  url TEXT,
  urlToImage TEXT,
  publishedAt TEXT
)
''');
  }

  Future<NewsModel> insert(NewsModel newsModel) async{
    var dbClient = await db;
    await dbClient!.insert('bookmark', newsModel.toMap());
    return newsModel;
  }

  Future<List<NewsModel>> getBookmarks() async {
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient!.query('bookmark');
    List<NewsModel> bookmarks = [];
    if (maps.isNotEmpty) {
      for (var map in maps) {
        bookmarks.add(
          NewsModel(
            author: map['author'],
            title: map['title'],
            description: map['description'],
            url: map['url'],
            urlToImage: map['urlToImage'],
            publishedAt: map['publishedAt'],
          ),
        );
      }
    }
    return bookmarks;
  }
}
