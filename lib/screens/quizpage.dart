import 'package:flutter/material.dart';
import 'package:quizapp/widgets/bg.dart';
import 'package:quizapp/widgets/list_tiles.dart';
import 'package:sqflite/sqflite.dart';
import '../globals.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //list of all the questions
  List questions;

  //to fetch the questions
  void updateList() async {
    final Future<Database> dbFuture = dbHelp.database;
    dbFuture.then((value) {
      Future<List<dynamic>> quest = dbHelp.getQuestions();
      quest.then((value) {
        setState(() {
          this.questions = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //fetch the questions only once
    if (questions == null) {
      updateList();
    }
    return Scaffold(
      body: questions == null || questions.isEmpty
          ? Center(
              child: Stack(
                children: [
                  getbg(),
                  Text(
                    'Please Wait...',
                    style: TextStyle(
                      fontFamily: 'Impact',
                      fontSize: 24,
                      color: const Color(0xffffff06),
                      height: 3.3846153846153846,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : Stack(
              children: [
                getbg(),
                ListView(
                  children: questTiles(questions) +
                      [
                        Row(
                          children: [
                            Expanded(child: Container()),
                            ElevatedButton(
                              onPressed: null,
                              child: Text('Submit'),
                            )
                          ],
                        )
                      ],
                ),
              ],
            ),
    );
  }
}
