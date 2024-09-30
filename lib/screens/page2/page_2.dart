import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  Page2 extends StatelessWidget {

  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman 2'),
      ),
      body: const Center(
        child: Text('Halaman 2',
        style: TextStyle(fontSize: 24),
        ),
      )
    );
  }
}
