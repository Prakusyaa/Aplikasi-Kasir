import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PengeluaranPage extends StatelessWidget {

  const PengeluaranPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengeluaran'),
      ),
      body: const Center(
        child: Text('Pengeluaran',
        style: TextStyle(fontSize: 24),
        ),
      )
    );
  }
}
