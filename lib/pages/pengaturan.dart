// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../database/dbhelper.dart';

class Pengaturan extends StatefulWidget {
  const Pengaturan({Key? key}) : super(key: key);

  @override
  State<Pengaturan> createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  final formKey = GlobalKey<FormState>();

  TextEditingController passwordInput = TextEditingController();
  TextEditingController confirmPasswordInput = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var db = DBHelper();

  updatePassword() async {
    var res = await db.getPassword();

    if (passwordInput.text.toString() == res.toString()) {
      await db.updatePassword(confirmPasswordInput.text.toString());
      const snackBar = SnackBar(
        content: Text('Password Berhasil Dirubah!'),
        // You can also add other properties like duration and action buttons.
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      const snackBar = SnackBar(
        content: Text('Password Tidak Sama'),
        // You can also add other properties like duration and action buttons.
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      updatePassword();
                    }
                  },
                  child: const Text('Simpan'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                    minimumSize: const Size.fromHeight(50),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('<<Kembali'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                    minimumSize: const Size.fromHeight(50),
                  ),
                ),
              ],
            )),
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Flexible(
              child: Form(
                key: formKey,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Pengaturan',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const Text(
                          'Ganti Password',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Password Saat Ini :',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password saat ini wajib diisi!';
                            }
                            return null;
                          },
                          obscureText: true,
                          controller: passwordInput,
                          decoration: const InputDecoration(
                            labelText: 'Masukkan Password',
                            labelStyle: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                            focusColor: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Password Baru :',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password baru wajib diisi!';
                            }
                            return null;
                          },
                          obscureText: true,
                          controller: confirmPasswordInput,
                          decoration: const InputDecoration(
                            labelText: 'Masukkan Password',
                            labelStyle: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                            focusColor: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 230,
                          child: Card(
                            elevation: 4.0,
                            margin: const EdgeInsets.all(16.0),
                            child: SingleChildScrollView(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: CircleAvatar(
                                          radius: 50.0,
                                          child: Image(
                                            image: Image.asset(
                                                    'assets/icons/brigas.png')
                                                .image,
                                          ),
                                        )),
                                    const Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'ABOUT THIS APP', // Replace with the user's name
                                            style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 8.0),
                                          Text(
                                            'Aplikasi ini dibuat oleh', // Replace with the user's email
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                          Text(
                                            'Brigas Ilham herdiyanto', // Replace with the user's email
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                          Text(
                                            'Nim: 2141764162', // Replace with the user's email
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                          Text(
                                            'Tanggal : 29 September 2023', // Replace with the user's email
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ));
  }
}
