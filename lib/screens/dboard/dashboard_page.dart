import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {

  const Dashboard ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Dashboard',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
            )
        ),
        backgroundColor: const Color(0xffFDC054),
        shadowColor: Colors.black,
        elevation: 6,
      ),
      body: const Center(
        child: Text("Dashboard"),
      ),
    );
  }
}
