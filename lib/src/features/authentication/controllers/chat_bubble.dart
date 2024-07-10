import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chatBubble extends StatelessWidget {
  final String message;

  const chatBubble({
    super.key,
    required this.message,
  });


  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        message,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
