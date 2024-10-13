import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant/app_constant.dart';
import '../../widget/custom_snackbar.dart';
import '../category/category_page.dart';
import 'capital_money_page.dart';
import 'change_password_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      snap: true,
      snapSizes: const [0.6, 1],
      minChildSize: 0.6,
      expand: false,
      shouldCloseOnMinExtent: false,
      builder: (context, scrollController) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(39, 39, 39, 1.0),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 4,
                width: double.infinity,
                child: SvgPicture.asset(
                  'assets/icons/divider-icon.svg',
                  color: Colors.black26,
                  height: 4,
                  width: 50,
                ),
              ),
              const Center(
                child: Text(
                  "Menu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                              Icons.lock,
                              color: Color.fromRGBO(255, 220, 106, 1.0),
                          ),
                          title: const Text
                            ('Ganti Password',
                              style: TextStyle(
                                  color: Colors.white)
                          ),
                          trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                          ),
                          onTap: () {Future.delayed(const Duration(milliseconds: 600), () {Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ChangePasswordPage()),
                              );
                            });
                          },
                        ),
                        ListTile(
                          leading: const Icon(
                              Icons.money,
                              color: Color.fromRGBO(123, 255, 78, 1.0),
                          ),
                          title: const Text(
                              'Uang Modal',
                              style: TextStyle(
                                  color: Colors.white)
                          ),
                          trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                          ),
                          onTap: () {
                            Future.delayed(const Duration(milliseconds: 600), () {Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CapitalMoneyPage()),
                              );
                            });
                          },
                        ),
                        ListTile(
                          leading: const Icon(
                              Icons.menu,
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                          ),
                          title: const Text(
                              'Menu Baru',
                              style: TextStyle(
                                  color: Colors.white)
                          ),
                          trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                          ),
                          onTap: () {Future.delayed(const Duration(milliseconds: 600), () {Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CategoryPage()),
                              );
                            });
                          },
                        ),
                        ListTile(
                          leading: const Icon(
                              Icons.store,
                              color: Color.fromRGBO(106, 255, 228, 1.0),
                          ),
                          title: const Text(
                              'Bantuan Vendor',
                              style: TextStyle(
                                  color: Colors.white)
                          ),
                          trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                          ),
                          onTap: () {
                            Future.delayed(const Duration(milliseconds: 600), () {_launchWhatsapp(context);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _launchWhatsapp(BuildContext context) async {
    var contact = companyPhone;
    var androidUrl = "whatsapp://send?phone=$contact&text=Halo, saya tertarik dengan produk Cipta Solutindo Tech";
    var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Halo, saya tertarik dengan produk Cipta Solutindo Tech')}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } catch (e) {
      CustomSnackbar.show(context, 'WhatsApp belum terinstall di perangkat anda', backgroundColor: Colors.red);
    }
  }
}