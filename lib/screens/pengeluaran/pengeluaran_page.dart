import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PengeluaranPage extends StatelessWidget {
  const PengeluaranPage ({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Pengeluaran',
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
        child: Text("Pengeluaran"),
      ),
    );
  }
}
