import 'package:flutter/material.dart';

class PlayingCards extends StatefulWidget {
  @override
  _PlayingCardsState createState() => _PlayingCardsState();
}

class _PlayingCardsState extends State<PlayingCards> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF212121),
          title: Text('Playing cards'),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Back',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        body: Container(
          color: Color(0xFFCB7D2E),
        ),
      ),
    );
  }
}
