import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                'Pengeluaran',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
