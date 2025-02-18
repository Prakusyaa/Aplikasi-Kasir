import 'package:flutter/material.dart';
import 'package:mozaic_app/style/custom_background.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String userName = '';
  String userGroupName = '';
  String token = '';
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    loadSharedPreference();
    myFocusNode = FocusNode();
  }

  Future<void> loadSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('username')!;
      userGroupName = prefs.getString('user_group_name')!;
      token = prefs.getString('token')!;
    });
  }

  @override
  Widget build(BuildContext context) {

    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.landscape ? LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            double columnWidth = screenWidth / 2;
            return Scaffold(
                backgroundColor: const Color.fromRGBO(45, 45, 45, 1.0),
                appBar: AppBar(
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  backgroundColor: Color.fromRGBO(25, 25, 25, 1.0),
                  title: const Text(
                    'Tentang Aplikasi',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    ),
                  ),
                  elevation: 0,
                ),
              body: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: columnWidth,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/mozaic/logo-baru-set-05.png',
                            height: 180,
                            width: 180,
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Mozaic Holyville',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40
                                    ),
                                  ),
                                  Text(
                                    'Aplikasi Point of Sale Mozaic powered by Cipta Solutindo Tech',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: VerticalDivider(
                      width: 1,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),
                  SizedBox(
                    width: columnWidth,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icons/cipta.png',
                            height: 180,
                            width: 180,
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Cipta Solutindo Tech',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40
                                    ),
                                  ),
                                  const Text(
                                    'Jl. Solo - Tawangmangu Km 8 Tegal Triyagan - Mojolaban Sukoharjo, Jawa Tengah',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      _launchInBrowser();
                                    },
                                    child: const Text(
                                      'www.ciptasolutindo.id',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          decoration: TextDecoration.underline
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            );
          }
        ) : CustomPaint(
          painter: MainBackground(),
          child: Material(
            color: Color.fromRGBO(44, 44, 44, 1.0),
            child: SafeArea(
              child: Container(
                  margin: const EdgeInsets.only(top: kToolbarHeight),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tentang Aplikasi',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            CloseButton(color: Colors.white)
                          ],
                        ),
                        const SizedBox(height: 20),
                        Flexible(
                          child: ListView(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(30, 30, 30, 1.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: const Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: const BorderRadius.all(Radius.circular(10)
                                    )
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                          children: [
                                            SizedBox(
                                              height: 100,
                                              width: 100,
                                              child: Stack(
                                                  children: [
                                                    Positioned(
                                                      left: 5,
                                                      bottom: -5,
                                                      child: SizedBox(
                                                        height: 85,
                                                        width: 85,
                                                        child: Transform.scale(
                                                          scale: 1.2,
                                                          child: Image.asset(
                                                              'assets/bottom_yellow.png'
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 8,
                                                      left: 6,
                                                      child: SizedBox(
                                                          height: 85,
                                                          width: 85,
                                                          child: Image.asset(
                                                              'assets/mozaic/logo-baru-set-07.png'
                                                          )
                                                      ),
                                                    )
                                                  ]
                                              ),
                                            ),
                                            const Flexible(
                                              child: Column(
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                          'Aplikasi Mozaic',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 18
                                                          )
                                                      ),
                                                    ),
                                                    SizedBox(height: 6),
                                                    Text(
                                                        'Aplikasi point of sale untuk merekap data penjualan dan pembelian',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            color: Color.fromRGBO(
                                                                166, 166, 166,
                                                                1.0),
                                                            fontSize: 12
                                                        )
                                                    )
                                                  ]
                                              ),
                                            )
                                          ]
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.all(14),
                                          decoration: const BoxDecoration(
                                              color: Color.fromRGBO(
                                                  51, 51, 51, 1.0),
                                              borderRadius: BorderRadius.only(
                                                  bottomRight: Radius.circular(5),
                                                  bottomLeft: Radius.circular(5)
                                              )
                                          ),
                                          child: const Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                'Share your feedback',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10
                                                ),
                                              )
                                          )
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 25),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(30, 30, 30, 1.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: const Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: const BorderRadius.all(Radius.circular(10)
                                    )
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                          children: [
                                            SizedBox(
                                              height: 130,
                                              width: 130,
                                              child: Stack(
                                                  children: [
                                                    Positioned(
                                                      left: 5,
                                                      bottom: 8,
                                                      child: SizedBox(
                                                        height: 85,
                                                        width: 85,
                                                        child: Transform.scale(
                                                          scale: 1.2,
                                                          child: Image.asset(
                                                              'assets/bottom_yellow.png'
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 22,
                                                      left: 10,
                                                      child: SizedBox(
                                                          height: 75,
                                                          width: 75,
                                                          child: Image.asset(
                                                              'assets/icons/cipta.png'
                                                          )
                                                      ),
                                                    )
                                                  ]
                                              ),
                                            ),
                                            const Flexible(
                                              child: Column(
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                          'Cipta Solutindo Tech',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 18
                                                          )
                                                      ),
                                                    ),
                                                    SizedBox(height: 8),
                                                    Text(
                                                        'Jl. Solo - Tawangmangu Km 8 Tegal Triyagan - Mojolaban Sukoharjo, Jawa Tengah',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 12
                                                        )
                                                    ),
                                                    Text(
                                                        '+62-812-2612-4600',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 12
                                                        )
                                                    ),
                                                    Text(
                                                        'admin@ciptasolutindo.id',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 12
                                                        )
                                                    ),
                                                  ]
                                              ),
                                            )
                                          ]
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _launchInBrowser();
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.all(14),
                                          decoration: const BoxDecoration(
                                              color: Color.fromRGBO(
                                                  51, 51, 51, 1.0),
                                              borderRadius: BorderRadius.only(
                                                  bottomRight: Radius.circular(5),
                                                  bottomLeft: Radius.circular(5)
                                              )
                                          ),
                                          child: const Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                'www.ciptasolutindo.id',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12
                                                ),
                                              )
                                          )
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ]
                  )
              ),
            ),
          ),
        );
      },
    );
  }
}

void _launchInBrowser() async {
  Uri url = Uri.parse('http://www.ciptasolutindo.id');
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}
