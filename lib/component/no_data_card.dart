import 'package:flutter/material.dart';

class NoDataCard extends StatelessWidget {
  const NoDataCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      elevation: 2,
      shadowColor: const Color.fromRGBO(20, 20, 20, 1.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(25, 25, 25, 1.0),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 6,
            )
          ],
        ),
        padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.no_food,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              'Tidak ada data',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
            )
          ],
        ),
      ),
    );
  }
}
