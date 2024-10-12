import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

showLoaderDialog(context) {
  Material loading = Material(
    color: Colors.transparent,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: LoadingAnimationWidget.discreteCircle(
                color: const Color(0xff434343),
                size: 50,
                secondRingColor: const Color(0xff5e5e5e),
                thirdRingColor: const Color(0xffacacac),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Loading...',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  fontSize: 12
              ),
            ),
          ],
        )
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return loading;
    },
  );
}

hideLoaderDialog(context) {
  return Navigator.pop(context);
}
