import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widget/custom_snackbar.dart';

class ExpenditureDatePage extends StatefulWidget {
  const ExpenditureDatePage({super.key});

  @override
  State<ExpenditureDatePage> createState() => _ExpenditureDatePageState();
}

class _ExpenditureDatePageState extends State<ExpenditureDatePage> {
  String userId = '';
  String userName = '';
  String userGroupName = '';
  String token = '';
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    loadSharedPreference();
  }

  Future<void> loadSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('user_id')!;
      userName = prefs.getString('username')!;
      userGroupName = prefs.getString('user_group_name')!;
      token = prefs.getString('token')!;
      startDate = DateTime.parse(prefs.getString('start_date')!);
      endDate = DateTime.parse(prefs.getString('end_date')!);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget confirmButton = ElevatedButton.icon(
      icon: const Icon(
        Icons.save,
        color: Colors.white,
        size: 18,
      ),
      label: const Text(
        'Simpan',
        style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat'
        ),
      ),
      onPressed: () {
        saveDate(context);
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color.fromRGBO(163, 163, 163, 1.0),
        backgroundColor: const Color.fromRGBO(30, 30, 30, 1.0),
        shadowColor: const Color.fromRGBO(20, 20, 20, 1.0),
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
      ),
    );

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      snap: true,
      snapSizes: const [0.7, 1],
      minChildSize: 0.7,
      expand: false,
      shouldCloseOnMinExtent: false,
      builder: (context, scrollController) {
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(39, 39, 39, 1.0),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)
              )
          ),
          padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 10
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                    bottom: 10
                ),
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
                  "Pilih Tanggal",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Card(
                                  color: Color.fromRGBO(30, 30, 30, 1.0),
                                  elevation: 2,
                                  shadowColor: Color.fromRGBO(20, 20, 20, 1.0),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 10
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Tanggal Mulai',
                                          style: TextStyle(
                                            color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(8),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black.withOpacity(0.15),
                                                        blurRadius: 6,
                                                      )
                                                    ],
                                                  ),
                                                  child: TextFormField(
                                                    readOnly: true,
                                                    initialValue: startDate.toString().substring(0, 10),
                                                    key: Key(startDate.toString().substring(0, 10)),
                                                    onTap: () {
                                                      _selectStartDate();
                                                    },
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.normal
                                                    ),
                                                    decoration: const InputDecoration(
                                                      border: InputBorder.none,
                                                      contentPadding: EdgeInsets.symmetric(
                                                          vertical: 15,
                                                          horizontal: 15
                                                      ),
                                                      hintText: 'Tanggal mulai',
                                                      hintStyle: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.normal
                                                      ),
                                                    ),
                                                  ),
                                                )
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Card(
                                  color: Color.fromRGBO(30, 30, 30, 1.0),
                                  elevation: 2,
                                  shadowColor: Color.fromRGBO(20, 20, 20, 1.0),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 10
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Tanggal Akhir',
                                          style: TextStyle(
                                            color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(8),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black.withOpacity(0.15),
                                                        blurRadius: 6,
                                                      )
                                                    ],
                                                  ),
                                                  child: TextFormField(
                                                    readOnly: true,
                                                    initialValue: endDate.toString().substring(0, 10),
                                                    key: Key(endDate.toString().substring(0, 10)),
                                                    onTap: () {
                                                      _selectEndDate();
                                                    },
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.normal
                                                    ),
                                                    decoration: const InputDecoration(
                                                      border: InputBorder.none,
                                                      contentPadding: EdgeInsets.symmetric(
                                                          vertical: 15,
                                                          horizontal: 15
                                                      ),
                                                      hintText: 'Tanggal akhir',
                                                      hintStyle: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.normal
                                                      ),
                                                    ),
                                                  ),
                                                )
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                confirmButton
                              ],
                            ),
                          ],
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

  void _selectStartDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: startDate,
        firstDate: DateTime(2016),
        lastDate: DateTime(2069));
    if (picked != null) setState(() => startDate = picked);
    /*print(startDate);*/
  }

  void _selectEndDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: endDate,
        firstDate: DateTime(2016),
        lastDate: DateTime(2069));
    if (picked != null) setState(() => endDate = picked);
    /*print(endDate);*/
  }

  void saveDate(context) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('start_date', startDate.toString());
    await prefs.setString('end_date', endDate.toString());

    Navigator.pop(context, true);
    // Message
    CustomSnackbar.show(context, 'Tanggal Berhasil Disimpan');
  }
}
