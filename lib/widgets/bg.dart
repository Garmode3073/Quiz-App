import 'package:flutter/material.dart';

Container getbg() {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: const AssetImage('lib/assets/bg1.png'),
        fit: BoxFit.fill,
      ),
    ),
  );
}
