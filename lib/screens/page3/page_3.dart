import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  Page3 extends StatelessWidget {

  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman 3'),
      ),
      body: const Center(
        child: Text('Halaman 3',
        style: TextStyle(fontSize: 24),
        ),
      )
    );
  }
}
