import 'package:flutter/material.dart';

class AzkarDetails extends StatelessWidget {
  final String zekr;

  const AzkarDetails({super.key, required this.zekr});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الذكر"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          zekr,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}