import 'dart:math';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  // ignore: no_logic_in_create_state
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List options = ["papel", "tesoura", "pedra"];
  String _message = "Faça sua escolha!";
  String _imagePath = "images/default.png";
  void _play(String playerChoice) {
    String appChoice = options[Random().nextInt(options.length)];
    this._imagePath = "images/$appChoice.png";
    print("Player escolheu: $playerChoice + computador escolheu: $appChoice");

    if ((playerChoice == "papel" && appChoice == "pedra") ||
        (playerChoice == "tesoura" && appChoice == "papel") ||
        (playerChoice == "pedra" && appChoice == "tesoura")) {
      setState(() {
        _message = "Parabéns, você venceu!";
      });
    } else if ((appChoice == "papel" && playerChoice == "pedra") ||
        (appChoice == "tesoura" && playerChoice == "papel") ||
        (appChoice == "pedra" && playerChoice == "tesoura")) {
      setState(() {
        _message = "Computador venceu!";
      });
    } else {
      setState(() {
        _message = "Empate!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokenPo"),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                _message,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(_imagePath, height: 150),
            Text("Escolha uma opção"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _play("papel"),
                  child: Image.asset("images/papel.png", height: 80),
                ),
                GestureDetector(
                  onTap: () => _play("tesoura"),
                  child: Image.asset("images/tesoura.png", height: 90),
                ),
                GestureDetector(
                  onTap: () => _play("pedra"),
                  child: Image.asset("images/pedra.png", height: 80),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}