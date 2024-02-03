import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/tic_tac_toe_game.dart';

void main() {
  runApp(TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: TicTacToeGame(),
    );
  }
}

