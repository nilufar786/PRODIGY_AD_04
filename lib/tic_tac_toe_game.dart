import 'package:flutter/material.dart';

class TicTacToeGame extends StatefulWidget {
  @override
  _TicTacToeGameState createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  late List<List<String>> board;
  late bool playerX;
  String? winner;

  @override
  void initState() {
    super.initState();
    initializeGame();
  }

  void initializeGame() {
    board = List.generate(3, (row) => List.filled(3, ' '));
    playerX = true;
    winner = null;
  }

  void resetGame() {
    setState(() {
      initializeGame();
    });
  }

  void makeMove(int row, int col) {
    if (board[row][col] == ' ' && winner == null) {
      setState(() {
        board[row][col] = playerX ? 'X' : 'O';
        checkWinner();
        playerX = !playerX;
      });
    }
  }

  void checkWinner() {
    for (int i = 0; i < 3; i++) {
      // Check rows
      if (board[i][0] == board[i][1] && board[i][1] == board[i][2] && board[i][0] != ' ') {
        setState(() {
          winner = board[i][0];
        });
        return;
      }

      // Check columns
      if (board[0][i] == board[1][i] && board[1][i] == board[2][i] && board[0][i] != ' ') {
        setState(() {
          winner = board[0][i];
        });
        return;
      }
    }

    // Check diagonals
    if (board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != ' ') {
      setState(() {
        winner = board[0][0];
      });
      return;
    }

    if (board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != ' ') {
      setState(() {
        winner = board[0][2];
      });
    }
  }

  Widget buildGrid() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (row) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (col) {
              return GestureDetector(
                onTap: () => makeMove(row, col),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      board[row][col],
                      style: TextStyle(fontSize: 36),
                    ),
                  ),
                ),
              );
            }),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Tic Tac Toe')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (winner != null)
              Text(
                'Winner: $winner',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            buildGrid(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: resetGame,
              child: Text('Reset Game'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TicTacToeGame(),
  ));
}
