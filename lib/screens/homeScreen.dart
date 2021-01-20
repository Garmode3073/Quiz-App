import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:quizapp/widgets/bg.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: Stack(
        children: <Widget>[
          getbg(),
          Transform.translate(
            offset: Offset(width * 0.141, height * 0.17),
            child: SizedBox(
              width: width * 0.75,
              child: Text(
                'STAR\nWARS',
                style: TextStyle(
                  fontFamily: 'Impact',
                  fontSize: 92,
                  color: const Color(0xffffff06),
                  height: 0.9565217391304348,
                  shadows: [
                    Shadow(
                      color: const Color(0xdeffcc09),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(width * 0.001, height * 0.38),
            child: SizedBox(
              width: width * 0.998,
              child: Text(
                'A fun quiz app based on stars wars',
                style: TextStyle(
                  fontFamily: 'Impact',
                  fontSize: 24,
                  color: const Color(0xffffff06),
                  height: 3.3846153846153846,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(width * 0.19, 572.0),
            child: SizedBox(
              width: width * 0.64,
              height: height * 0.1,
              child: FlatButton(
                onPressed: null,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 301.0, 89.0),
                      size: Size(301.0, 89.0),
                      pinLeft: true,
                      pinRight: true,
                      pinTop: true,
                      pinBottom: true,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45.0),
                          color: const Color(0xffffff00),
                        ),
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(88.0, 4.0, 126.0, 85.0),
                      size: Size(301.0, 89.0),
                      pinTop: true,
                      pinBottom: true,
                      fixedWidth: true,
                      child: Text(
                        'PLAY',
                        style: TextStyle(
                          fontFamily: 'Impact',
                          fontSize: 55,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
