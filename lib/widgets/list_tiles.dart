import 'package:flutter/material.dart';
import 'package:quizapp/models/questions.dart';
import 'package:quizapp/widgets/questiontile.dart';

List<Widget> questTiles(List<Question> quest) {
  List<Widget> tiles =
      List<Column>.generate(quest.length, (i) => colQuestion(i));
  return tiles;
}
