import 'package:quizapp/models/questions.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; //singleton databasehelper
  static Database _database; //singleton database

  String qtable = 'qtable';
  String colqno = 'qno';
  String colques = 'ques';
  String colopt1 = 'opt1';
  String colopt2 = 'opt2';
  String colopt3 = 'opt3';
  String colopt4 = 'opt4';
  String colans = 'ans';

  //named constructor for creating instance of the helper class
  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      //will be executed only one to declare the singleton
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    //get the path to store the database
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'quizapp.db';

    //Create database
    var db = await openDatabase(path, version: 1, onCreate: _createDb);
    return db;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $qtable($colqno INTEGER PRIMARY KEY, $colques TEXT, $colopt1 TEXT, $colopt2 TEXT, $colopt3 TEXT, $colopt4 TEXT, $colans INTEGER)');

    //adding all the questions for the quiz
    await db.insert(qtable, {
      colqno: 1,
      colques:
          'In the TRAGEDY OF DARTH PLAGIUS THE WISE, who was the apperentics that killed Darth Plagius?',
      colopt1: 'Darth Sidious',
      colopt2: 'Darth Maul',
      colopt3: 'Darth Vader',
      colopt4: 'Darth Jar Jar',
      colans: 1
    });
    await db.insert(qtable, {
      colqno: 2,
      colques:
          'Duchess Satine was an honourable ruler of what planetary system?',
      colopt1: 'Naboo',
      colopt2: 'Tatooine',
      colopt3: 'Lothal',
      colopt4: 'Mandalore',
      colans: 4
    });
    await db.insert(qtable, {
      colqno: 3,
      colques: 'Who was the host of the Clone Army for the republic?',
      colopt1: 'Boba Fett',
      colopt2: 'Jango Fett',
      colopt3: 'Din Djarin',
      colopt4: 'Sabine Wren',
      colans: 2
    });
    await db.insert(qtable, {
      colqno: 1,
      colques: 'Which Jedi held the Amethyst blade during galactic republic?',
      colopt1: 'Obi-Wan Kenobi',
      colopt2: 'Qui-Gon Gin',
      colopt3: 'Mace Windu',
      colopt4: 'Ki-Adi Mundi',
      colans: 3
    });
    await db.insert(qtable, {
      colqno: 1,
      colques: 'According to the prophecy who was the chosen one?',
      colopt1: 'Luke Skywalker',
      colopt2: 'Anakin Skywalker',
      colopt3: 'Leia Organa',
      colopt4: 'Ben Solo',
      colans: 2
    });
  }

  //fetch
  Future<List<Question>> getQuestions() async {
    Database db = await this.database;

    var result = await db.rawQuery('SELECT * FROM $qtable');
    List<Question> allque;
    for (int i = 0; i < result.length; i++) {
      allque.add(Question.fromMap(result[i]));
    }
    return allque;
  }
}
