import 'package:flutter/material.dart';
import 'package:tic_tac_toe/colors/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  bool oTurn = true;
  int tapCounter = 0;
  String resultDeclaration = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Expanded(
                  flex: 1, child: Center(child: Text("Score Board"))),
              Expanded(
                  flex: 3,
                  child: GridView.builder(
                      itemCount: 9,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            if (displayXO[index] == '') {
                              _tapped(index);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 5,
                                color: MainColor.primaryColor,
                              ),
                              color: MainColor.secondaryColor,
                            ),
                            child: Center(
                              child: Text(
                                displayXO[index],
                                style: GoogleFonts.coiny(
                                    textStyle: TextStyle(
                                        fontSize: 64,
                                        color: MainColor.accentColor)),
                              ),
                            ),
                          ),
                        );
                      })),
              Expanded(flex: 2, child: Text(resultDeclaration)),
            ],
          ),
        ));
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn == true && displayXO[index] == '') {
        displayXO[index] = 'O';
      } else if (oTurn == false && displayXO[index] == '') {
        displayXO[index] = 'X';
      }
      oTurn = !oTurn;
      tapCounter++;
      if (tapCounter >= 5) checkWinner();
    });
  }

  void checkWinner() {
    //Row
    int i = 0;
    int interIndex = 0;
    while (i < 3) {
      rowCheck(interIndex);
      interIndex += 3;
      i++;
    }
    //Col
    for (var i = 0; i < 3; i++) {
      colCheck(i);
    }
    //Dialognal
    diagonalCheck();
  }

  void rowCheck(int index) {
    if (displayXO[index] == displayXO[index + 1] &&
        displayXO[index] == displayXO[index + 2] &&
        displayXO[index] != '') {
      resultDeclare(index);
    }
  }

  void colCheck(int index) {
    if (displayXO[index] == displayXO[index + 3] &&
        displayXO[index] == displayXO[index + 6] &&
        displayXO[index] != '') {
      resultDeclare(index);
    }
  }

  void diagonalCheck() {
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      resultDeclare(0);
    } else if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      resultDeclare(2);
    }
  }

  resultDeclare(int index) {
    setState(() {
      resultDeclaration = 'PLAYER ${displayXO[index]} WINS!!';
    });
  }
  
}
