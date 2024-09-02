import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final Color  color;
  final VoidCallback onPress;
  const Button({super.key, required this.title, this.color = Colors.grey, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Center(
              child: Text(title, style: TextStyle(color: Colors.white),),
            ),
          ),
        ),
      ),
    );
  }
}
