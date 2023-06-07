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

  
}
