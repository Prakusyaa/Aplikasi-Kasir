import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/api_endpoint.dart';
import '../../style/app_properties.dart';
import '../../widget/custom_loading.dart';
import '../../widget/custom_snackbar.dart';
import '../main/main_bottom_navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late bool obscureText;
  late bool obscureText2;


  Future<void> _initPackageInfo() async {
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
    obscureText = true;
    obscureText2 = true;
  }

  Widget buildLoginForm(BuildContext context) {
    return Container(
      width: 400,
      height: 450,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(44, 44, 44, 1.0),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: shadow,
      ),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "Alpinjir POS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: const TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(30, 30, 30, 1.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              obscureText: obscureText,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(30, 30, 30, 1.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                prefixIcon: IconButton(
                  icon: Icon(
                    obscureText ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const Spacer(),
            SizedBox(
              width: 400,
              height: 130,
              child: Column(
                children: [
                  ElevatedButton.icon(
                    label: const Text(
                      'Masuk',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {
                      loginValidation(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromRGBO(163, 163, 163, 1.0),
                      backgroundColor: const Color.fromRGBO(30, 30, 30, 1.0),
                      shadowColor: const Color.fromRGBO(20, 20, 20, 1.0),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(200, 40), // Lebar - Tinggi
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    label: const Text(
                      'Buat Akun Demo',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {
                      registerGuest(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromRGBO(163, 163, 163, 1.0),
                      backgroundColor: const Color.fromRGBO(30, 30, 30, 1.0),
                      shadowColor: const Color.fromRGBO(20, 20, 20, 1.0),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(200, 40), // Lebar - Tinggi
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Version 1.0",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(25, 25, 25, 1.0),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(child: buildLoginForm(context));
        },
      ),
    );
  }

  void loginValidation(context) async {
    bool isLoginValid = true;
    FocusScope.of(context).requestFocus(FocusNode());

    if (emailController.text.isEmpty) {
      isLoginValid = false;
      CustomSnackbar.show(context, 'Username Tidak Boleh Kosong', backgroundColor: const Color.fromRGBO(30, 30, 30, 1.0));
    }

    if (passwordController.text.isEmpty) {
      isLoginValid = false;
      CustomSnackbar.show(context, 'Password Tidak Boleh Kosong', backgroundColor: const Color.fromRGBO(30, 30, 30, 1.0));
    }
    if (isLoginValid) {
      fetchLogin(context, emailController.text, passwordController.text);
    }
  }

  Future<void> fetchLogin(context, String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    showLoaderDialog(context);
    try {
      Response response;
      var dio = Dio();
      response = await dio.post(
        Api.login,
        data: {'username': username, 'password': password},
        options: Options(contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        //berhasil
        hideLoaderDialog(context);
        //setSharedPreference
        String prefUserId = response.data['data']['user_id'].toString();
        String prefUsername = response.data['data']['name'];
        String prefFullname = response.data['data']['full_name'];
        String prefUserGroup = response.data['data']['user_group_name'];
        String prefCreated = response.data['data']['created_at'];
        String prefGuestState = response.data['data']['guest_state'].toString();
        String prefToken = response.data['token'];
        await prefs.setString('username', prefUsername);
        await prefs.setString('full_name', prefFullname);
        await prefs.setString('user_id', prefUserId);
        await prefs.setString('user_group_name', prefUserGroup);
        await prefs.setString('created_at', prefCreated);
        await prefs.setString('guest_state', prefGuestState);
        await prefs.setString('token', prefToken);

        if (int.parse(prefGuestState) == 1) {
          final dateCreated = DateTime.parse(response.data['data']['created_at']);
          final dateNow = DateTime.now();
          final dateDifference = dateNow.difference(dateCreated).inDays;
          // print(date_created);
          // print(date_now);
          // print(date_difference);
          if (dateDifference >= 7) {
            expiredGuest(context);
            return;
          }
        }
        //Messsage
        CustomSnackbar.show(context, 'Login Berhasil');
        // homePage
        Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const MainBottomNavigation()));
      }
    } on DioException catch (e) {
      hideLoaderDialog(context);
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        //gagal
        String errorMessage = e.response?.data['message'];
        CustomSnackbar.show(context, errorMessage, backgroundColor: Color.fromRGBO(30, 30, 30, 1.0));
      } else {
        print(e.message);
        CustomSnackbar.show(context, 'Terjadi Kesalahan', backgroundColor: Color.fromRGBO(30, 30, 30, 1.0));
      }
    }
  }

  registerGuest(context) async {
    final prefs = await SharedPreferences.getInstance();
    showLoaderDialog(context);
    try {
      Response response;
      var dio = Dio();
      response = await dio.get(
        Api.register,
        options: Options(contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        //berhasil
        hideLoaderDialog(context);
        //setSharedPreference
        String prefUsername = response.data['data']['name'];
        String prefFullname = response.data['data']['full_name'];
        String prefUserId = response.data['data']['user_id'].toString();
        String prefUserGroup = response.data['data']['user_group_name'];
        String prefCreated = response.data['data']['created_at'];
        String prefGuestState = response.data['data']['guest_state'].toString();
        String prefToken = response.data['token'];
        await prefs.setString('username', prefUsername);
        await prefs.setString('full_name', prefFullname);
        await prefs.setString('user_id', prefUserId);
        await prefs.setString('user_group_name', prefUserGroup);
        await prefs.setString('created_at', prefCreated);
        await prefs.setString('guest_state', prefGuestState);
        await prefs.setString('token', prefToken);
        //Messsage
        CustomSnackbar.show(context, 'Register Berhasil');
        // homePage
        Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const MainBottomNavigation()));
      }
    } on DioException catch (e) {
      hideLoaderDialog(context);
      if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        //gagal
        String errorMessage = e.response?.data['message'];
        CustomSnackbar.show(context, errorMessage, backgroundColor: const Color.fromRGBO(30, 30, 30, 1.0));
      } else {
        print(e.message);
        CustomSnackbar.show(context, 'Terjadi Kesalahan', backgroundColor: const Color.fromRGBO(30, 30, 30, 1.0));
      }
    }
  }

  expiredGuest(context) {
    AlertDialog alert = const AlertDialog(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text(
              "Akun percobaan telah berakhir !",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Untuk mendapatkan akses penuh silahkan hubungi : ",
              style: TextStyle(
                color: Color.fromARGB(255, 26, 189, 211),
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "+62-812-2612-4600",
              style: TextStyle(
                  color: Color.fromARGB(255, 26, 189, 211),
                  fontSize: 12,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "admin@ciptasolutindo.id",
              style: TextStyle(
                color: Color.fromARGB(255, 26, 189, 211),
                fontSize: 12,
              ),
            ),
            Text(
              "www.ciptasolutindo.id",
              style: TextStyle(
                color: Color.fromARGB(255, 26, 189, 211),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return alert;
      },
    );
  }
}
