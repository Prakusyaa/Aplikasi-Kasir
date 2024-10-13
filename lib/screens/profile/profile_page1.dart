import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(45, 45, 45, 1.0),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                var screenWidth = constraints.maxWidth;
                var screenHeight = constraints.maxHeight;

                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: screenWidth * 0.95,
                        constraints: BoxConstraints(
                          minHeight: screenHeight * 0.95,
                        ),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(30, 30, 30, 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 4),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            const Positioned(
                              top: 15,
                              left: 20,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.account_circle,
                                    color: Colors.grey,
                                    size: 80,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Username',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Positioned(
                              top: 20,
                              right: 20,
                              child: Icon(
                                Icons.settings,
                                color: Colors.grey,
                                size: 30,
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 120.0),
                                child: Container(
                                  width: screenWidth * 0.91,
                                  constraints: BoxConstraints(
                                    minHeight: screenHeight * 0.715,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(20, 20, 20, 1.0),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0, 4),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            onTap: () {
                                              // Belum di import jir logikanya
                                            },
                                            title: const Text(
                                              'Printer Kasir',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            subtitle: const Text(
                                              'Setting Nama Printer Kasir.',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            leading: const Icon(
                                              Icons.print_rounded,
                                              color: Colors.lightBlueAccent,
                                              size: 30,
                                            ),
                                            trailing: const Icon(
                                              Icons.chevron_right,
                                              color: Color.fromRGBO(255, 255, 255, 1.0),
                                            ),
                                          ),
                                          const Divider(color: Color.fromRGBO(60, 60, 60, 1.0)),
                                          ListTile(
                                            onTap: () {
                                              // Belum di import jir logikanya
                                            },
                                            title: const Text(
                                              'Printer Dapur',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            subtitle: const Text(
                                              'Setting Nama Printer Dapur.',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            leading: const Icon(
                                              Icons.soup_kitchen_rounded,
                                              color: Colors.brown,
                                              size: 30,
                                            ),
                                            trailing: const Icon(
                                              Icons.chevron_right,
                                              color: Color.fromRGBO(255, 255, 255, 1.0),
                                            ),
                                          ),
                                          const Divider(color: Color.fromRGBO(60, 60, 60, 1.0)),
                                          ListTile(
                                            onTap: () {
                                              // Belum di import jir logikanya
                                            },
                                            title: const Text(
                                              'Bantuan',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            subtitle: const Text(
                                              'Bantuan Pemakaian Aplikasi.',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            leading: const Icon(
                                              Icons.help_outline,
                                              color: Colors.green,
                                              size: 30,
                                            ),
                                            trailing: const Icon(
                                              Icons.chevron_right,
                                              color: Color.fromRGBO(255, 255, 255, 1.0),
                                            ),
                                          ),
                                          const Divider(color: Color.fromRGBO(60, 60, 60, 1.0)),
                                          ListTile(
                                            onTap: () {
                                              // Belum di import jir logikanya
                                            },
                                            title: const Text(
                                              'Tentang Aplikasi',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            subtitle: const Text(
                                              'Tentang Aplikasi dan Copyright.',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            leading: const Icon(
                                              Icons.copyright_outlined,
                                              color: Colors.yellow,
                                              size: 30,
                                            ),
                                            trailing: const Icon(
                                              Icons.chevron_right,
                                              color: Color.fromRGBO(255, 255, 255, 1.0),
                                            ),
                                          ),
                                          const Divider(color: Color.fromRGBO(60, 60, 60, 1.0)),
                                          ListTile(
                                            onTap: () {
                                              // Belum di import jir logikanya
                                            },
                                            title: const Text(
                                              'Keluar',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            subtitle: const Text(
                                              'Keluar Aplikasi.',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            leading: const Icon(
                                              Icons.exit_to_app_outlined,
                                              color: Colors.red,
                                              size: 30,
                                            ),
                                            trailing: const Icon(
                                              Icons.chevron_right,
                                              color: Color.fromRGBO(255, 255, 255, 1.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}