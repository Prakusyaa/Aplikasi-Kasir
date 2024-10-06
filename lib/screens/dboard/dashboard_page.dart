import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../style/app_properties.dart';
import '../../style/custom_background.dart';
import '../dashboard/tablet/dashboard_date_page_tablet.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return CustomPaint(
              painter: MainBackground(),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  scrolledUnderElevation: 0,
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark,
                    statusBarBrightness: Brightness.light,
                  ),
                  backgroundColor: Colors.transparent,
                  actions: [
                    IconButton(
                      icon: Image.asset(
                        'assets/icons/calendar.png',
                        height: 30,
                        width: 30,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          isDismissible: false,
                          builder: (context) => const DashboardDatePageTablet(),
                        ).then((value) {
                          setState(() {
                          });
                        });
                      },
                    )
                  ],
                  title: const Text(
                    'Dashboard',
                    style: TextStyle(
                        color: darkGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 28),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}