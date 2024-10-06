import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/app_properties.dart';
import '../expenditure/expenditure_page.dart';

class PengeluaranPage extends StatelessWidget {
  const PengeluaranPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.white,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.335,
                color: const Color(0xFFFECD7E),
              ),
            ),
            const Positioned(
              left: 20,
              top: 10,
              child: Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const ExpenditurePage(),
              ),
            );
          },
          backgroundColor: yellow,
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
