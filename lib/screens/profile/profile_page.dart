import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/api_endpoint.dart';
import '../../widget/custom_loading.dart';
import '../../widget/custom_snackbar.dart';
import '../auth/login_page.dart';
import '../category/category_page.dart';
import '../printer/printer_address_page.dart';
import '../printer/printer_kitchen_address_page.dart';
import 'about_page.dart';
import 'help_page.dart';
import 'menu.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userId = '';
  String userName = '';
  String fullName = '';
  String userGroupName = '';
  String token = '';
  int? guestState;

  @override
  void initState() {
    super.initState();
    loadSharedPreference();
  }

  void rebuild() {
    loadSharedPreference();
  }

  Future<void> loadSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('user_id') ?? 'default_id';
      userName = prefs.getString('username') ?? 'default_username';
      fullName = prefs.getString('full_name') ?? 'default_full_name';
      userGroupName = prefs.getString('user_group_name') ?? 'default_group_name';
      guestState = int.tryParse(prefs.getString('guest_state') ?? '0');
      token = prefs.getString('token') ?? 'default_token';
    });

    if (guestState == 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Akun Percobaan"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("username : $userName"),
                  const Text("password : 123456"),
                  const Text("*jika belum diubah",
                      style: TextStyle(fontSize: 10)),
                  const SizedBox(height: 20),
                  const Text(
                    "Akun percobaan hanya berlaku 7 hari !",
                    style: TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Untuk mendapatkan akses penuh silahkan hubungi kontak kami pada halaman 'Tentang Aplikasi' ",
                    style: TextStyle(color: Color.fromARGB(255, 26, 189, 211)),
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                child: const Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      });
    }
  }

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
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ListTile(
                                onTap: () {
                                  fetchSettings(context);
                                },
                                title: Text(
                                  fullName,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                                leading: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 70,
                                ),
                                trailing: const Icon(
                                  Icons.settings,
                                  color: Colors.grey,
                                  size: 30,
                                ),
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
                                              fetchPrinterAddress(context);
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
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                            ),
                                          ),
                                          const Divider(
                                              color: Color.fromRGBO(
                                                  60, 60, 60, 1.0)),
                                          ListTile(
                                            onTap: () {
                                              fetchPrinterKitchenAddress(context);
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
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                            ),
                                          ),
                                          const Divider(
                                              color: Color.fromRGBO(
                                                  60, 60, 60, 1.0)),
                                          ListTile(
                                            onTap: () {
                                              fetchNewMenu(context);
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
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                            ),
                                          ),
                                          const Divider(
                                              color: Color.fromRGBO(
                                                  60, 60, 60, 1.0)),
                                          ListTile(
                                            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AboutPage())),
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
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
                                            ),
                                          ),
                                          const Divider(
                                              color: Color.fromRGBO(
                                                  60, 60, 60, 1.0)),
                                          ListTile(
                                            onTap: () {
                                              fetchLogout(context);
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
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1.0),
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

  void fetchLogout(context) async {
    // Remove data for the 'counter' key.
    final prefs = await SharedPreferences.getInstance();
    showLoaderDialog(context);
    token = prefs.getString('token')!;
    try {
      Response response;
      var dio = Dio();
      dio.options.headers["authorization"] = "Bearer $token";
      response = await dio.post(
        Api.logout,
        data: {},
        options: Options(contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        //berhasil
        hideLoaderDialog(context);
        //setSharedPreference
        await prefs.remove('username');
        await prefs.remove('user_group_name');
        await prefs.remove('created_at');
        await prefs.remove('token');
        await prefs.remove('itemcategory');
        //Messsage
        CustomSnackbar.show(context, 'Logout Berhasil');
        //SettingsPage
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    } on DioException catch (e) {
      hideLoaderDialog(context);
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        //gagal
        String errorMessage = e.response?.data['message'];
        CustomSnackbar.show(context, errorMessage, backgroundColor: Colors.red);
      } else {
        // print(e.message);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    }
  }

  Future <void> fetchPrinterAddress(context) async {
    // Remove data for the 'counter' key.
    final prefs = await SharedPreferences.getInstance();
    showLoaderDialog(context);
    token = prefs.getString('token')!;
    try {
      Response response;
      var dio = Dio();
      dio.options.headers["authorization"] = "Bearer $token";
      response = await dio.post(
        Api.printerAddress,
        data: {
          'user_id': userId
        },
        options: Options(contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        //berhasil
        hideLoaderDialog(context);
        String prefPrinterAddress = response.data['data'].toString();
        await prefs.setString('printer_address', prefPrinterAddress);
        //SettingsPage
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          isDismissible: false,
          builder: (context) => const PrinterAddressPage(),
        ).then((value) => rebuild());
        //Messsage
      }
    } on DioException catch (e) {
      hideLoaderDialog(context);
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        //gagal
        String errorMessage = e.response?.data['message'];
        // Message
        CustomSnackbar.show(context, errorMessage, backgroundColor: Colors.red);
      } else {
        /*print(e.message);*/
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          isDismissible: false,
          builder: (context) => const PrinterAddressPage(),
        ).then((value) => rebuild());
      }
    }
  }

  Future <void> fetchPrinterKitchenAddress(context) async {
    // Remove data for the 'counter' key.
    final prefs = await SharedPreferences.getInstance();
    showLoaderDialog(context);
    token = prefs.getString('token')!;
    try {
      Response response;
      var dio = Dio();
      dio.options.headers["authorization"] = "Bearer $token";
      response = await dio.post(
        Api.printerKitchenAddress,
        data: {
          'user_id': userId
        },
        options: Options(contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // berhasil
        hideLoaderDialog(context);
        String prefPrinterKitchenAddress = response.data['data'].toString();
        await prefs.setString('printer_kitchen_address', prefPrinterKitchenAddress);
        //SettingsPage
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          isDismissible: false,
          builder: (context) => const PrinterKitchenAddressPage(),
        ).then((value) => rebuild());
      }
    } on DioException catch (e) {
      hideLoaderDialog(context);
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        //gagal
        String errorMessage = e.response?.data['message'];
        // Message
        CustomSnackbar.show(context, errorMessage, backgroundColor: Colors.red);
      } else {
        /*print(e.message);*/
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          isDismissible: false,
          builder: (context) => const PrinterKitchenAddressPage(),
        ).then((value) => rebuild());
      }
    }
  }


  fetchCategories(context) async {
    // Remove data for the 'counter' key.
    final prefs = await SharedPreferences.getInstance();
    showLoaderDialog(context);
    token = prefs.getString('token')!;
    try {
      Response response;
      var dio = Dio();
      dio.options.headers["authorization"] = "Bearer $token";
      response = await dio.post(
        Api.itemCategoryNewMenu,
        data: {
          'user_id': userId
        },
        options: Options(contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        //berhasil
        hideLoaderDialog(context);
        String itemCategory = json.encode(response.data['data']);
        await prefs.setString('itemcategory', itemCategory);
        // print(itemCategory[0]);
        //SettingsPage
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CategoryPage()));
      }
    } on DioException catch (e) {
      hideLoaderDialog(context);
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        //gagal
        String errorMessage = e.response?.data['message'];
        CustomSnackbar.show(context, errorMessage, backgroundColor: Colors.red);
      } else {}
    }
  }

  void fetchNewMenu(context) async {
    // Remove data for the 'counter' key.
    final prefs = await SharedPreferences.getInstance();
    // showLoaderDialog(context);
    token = prefs.getString('token')!;
    try {
      Response response;
      var dio = Dio();
      dio.options.headers["authorization"] = "Bearer $token";
      response = await dio.post(
        Api.itemCategoryNewMenu,
        data: {
          'user_id': userId
        },
        options: Options(contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        //berhasil
        // hideLoaderDialog(context);
        String itemCategory = json.encode(response.data['data']);
        await prefs.setString('itemcategory', itemCategory);
        // print(itemCategory[0]);
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HelpPage()));
        /*setState(() {
          itemCategoryJson = response.data['data'];
        });*/
      }
    } on DioException catch (e) {
      // hideLoaderDialog(context);
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        //gagal
        String errorMessage = e.response?.data['message'];
        CustomSnackbar.show(context, errorMessage, backgroundColor: Colors.red);
      } else {

      }
    }
  }

  Future <void> fetchSettings(context) async {
    final prefs = await SharedPreferences.getInstance();
    showLoaderDialog(context);
    token = prefs.getString('token')!;
    try {
      Response response;
      var dio = Dio();
      dio.options.headers["authorization"] = "Bearer $token";
      response = await dio.post(
        Api.printerAddress,
        data: {
          'user_id': userId
        },
        options: Options(contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        //berhasil
        hideLoaderDialog(context);
        //SettingsPage
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          isDismissible: false,
          builder: (context) => const MenuPage(),
        ).then((value) => rebuild());
        //Messsage
      }
    } on DioException catch (e) {
      hideLoaderDialog(context);
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        //gagal
        String errorMessage = e.response?.data['message'];
        // Message
        CustomSnackbar.show(context, errorMessage, backgroundColor: Colors.red);
      } else {
        /*print(e.message);*/
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          isDismissible: false,
          builder: (context) => const MenuPage(),
        ).then((value) => rebuild());
      }
    }
  }
}