import 'package:basic_calculator/components/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userInput.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        answer.toString(),
                        style: const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ],
                  ),
                )
              ),

              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Button(title: "AC", onPress: (){
                          userInput = '';
                          answer = '';
                          setState(() {});
                        },),
                        Button(title: "+/-", onPress: (){
                          userInput = '$userInput+/-';
                          setState(() {});
                        },),
                        Button(title: "%", onPress: (){
                          userInput = '$userInput%';
                          setState(() {});
                        },),
                        Button(title: "/", color: Colors.deepOrange, onPress: (){
                          userInput = '$userInput/';
                          setState(() {});
                        },),
                      ],
                    ),
                    Row(
                      children: [
                        Button(title: "7", onPress: (){
                          userInput = '${userInput}7';
                          setState(() {});
                        },),
                        Button(title: "8", onPress: (){
                          userInput = '${userInput}8';
                          setState(() {});
                        },),
                        Button(title: "9", onPress: (){
                          userInput = '${userInput}9';
                          setState(() {});
                        },),
                        Button(title: "*", color: Colors.deepOrange, onPress: (){
                          userInput = '$userInput*';
                          setState(() {});
                        },),
                      ],
                    ),
                    Row(
                      children: [
                        Button(title: "4", onPress: (){
                          userInput = '${userInput}4';
                          setState(() {});
                        },),
                        Button(title: "5", onPress: (){
                          userInput = '${userInput}5';
                          setState(() {});
                        },),
                        Button(title: "6", onPress: (){
                          userInput = '${userInput}6';
                          setState(() {});
                        },),
                        Button(title: "-", color: Colors.deepOrange, onPress: (){
                          userInput = '$userInput-';
                          setState(() {});
                        },),
                      ],
                    ),
                    Row(
                      children: [
                        Button(title: "1", onPress: (){
                          userInput = '${userInput}1';
                          setState(() {});
                        },),
                        Button(title: "2", onPress: (){
                          userInput = '${userInput}2';
                          setState(() {});
                        },),
                        Button(title: "3", onPress: (){
                          userInput = '${userInput}3';
                          setState(() {});
                        },),
                        Button(title: "+", color: Colors.deepOrange, onPress: (){
                          userInput = '$userInput+';
                          setState(() {});
                        },),
                      ],
                    ),
                    Row(
                      children: [
                        Button(title: "0", onPress: (){
                          userInput = '${userInput}0';
                          setState(() {});
                        },),
                        Button(title: ".", onPress: (){
                          userInput = '$userInput.';
                          setState(() {});
                        },),
                        Button(title: "DEL", onPress: (){
                          if (userInput.length > 0) {
                            userInput = userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          }
                        },),
                        Button(title: "=", color: Colors.deepOrange, onPress: (){
                          equalPress();
                          setState(() {});
                        },),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    // In case we are using x in user input
    // String finalUserInput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression e = p.parse(userInput);
    ContextModel contextModel = ContextModel();

    try {
      answer = '${e.evaluate(EvaluationType.REAL, contextModel)}';
    } catch (error) {
      answer = 'Error';
    }

  }
}
