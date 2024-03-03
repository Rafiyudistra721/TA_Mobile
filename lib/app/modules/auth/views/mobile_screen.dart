import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:ta_mobile/app/modules/auth/controllers/auth_controller.dart';

class MobileScreenAuth extends GetView<AuthController> {
  final GlobalKey<FormState> formKey = GlobalKey();
  MobileScreenAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffc1dbfe),),
      body: Container(
        color: const Color(0xffc1dbfe),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: const Color(0xffc1dbfe),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20, left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              controller.isRegis ? 'Daftar' : 'Masuk',
                              style: GoogleFonts.urbanist(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                          )),
                      14.height,
                      Obx(() => Text(
                            controller.isRegis
                                ? 'Hai, Selamat datang di SmartLib, silahkan isi \ndata dibawah ini untuk mendaftar.'
                                : "Masukkan email dan password kamu untuk login",
                            style: GoogleFonts.urbanist(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(-1, -2),
                          blurRadius: 15),
                    ],
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.elliptical(50,40))),
                child: Obx(
                  () => Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          children: [
                            // 50.height,
                            if (controller.isRegis)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: AppTextField(
                                  textFieldType: TextFieldType.NAME,
                                  enableSuggestions: true,
                                  decoration: InputDecoration(
                                    hintText: 'Nama Pengguna',
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade400,
                                        fontWeight: FontWeight.bold),
                                    contentPadding: const EdgeInsets.all(25),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Icon(
                                        Icons.person_2_rounded,
                                        size: 25,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    fillColor: Colors.grey.shade200,
                                    focusColor: Colors.grey.shade200,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(80),
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  controller: controller.nameC,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Masukkan nama anda terlebih dahulu...';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            12.height,
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: AppTextField(
                                textFieldType: TextFieldType.EMAIL,
                                decoration: InputDecoration(
                                  hintText: 'Email Pengguna',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.bold),
                                  contentPadding: const EdgeInsets.all(25),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Icon(
                                      Icons.email_rounded,
                                      size: 25,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  fillColor: Colors.grey.shade200,
                                  focusColor: Colors.grey.shade200,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(80),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                ),
                                controller: controller.emailC,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Masukkan email anda terlebih dahulu...';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            12.height,
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: AppTextField(
                                textFieldType: TextFieldType.PASSWORD,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade400,
                                        fontWeight: FontWeight.bold),
                                    contentPadding: const EdgeInsets.all(25),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Icon(
                                        Icons.password,
                                        size: 25,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    fillColor: Colors.grey.shade200,
                                    focusColor: Colors.grey.shade200,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(80),
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.togglePasswordVisibility();
                                      },
                                      icon: controller.isPassHidden.value
                                          ? const Icon(Icons.visibility_off)
                                          : const Icon(Icons.visibility),
                                    )),
                                obscuringCharacter: '*',
                                isPassword: controller.isPassHidden.value,
                                controller: controller.passC,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Masukkan password anda terlebih dahulu...';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            12.height,
                            if (controller.isRegis)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: AppTextField(
                                  textFieldType: TextFieldType.PASSWORD,
                                  decoration: InputDecoration(
                                      hintText: 'Konfirmasi Password',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade400,
                                          fontWeight: FontWeight.bold),
                                      contentPadding: const EdgeInsets.all(25),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Icon(
                                          Icons.password,
                                          size: 25,
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                      fillColor: Colors.grey.shade200,
                                      focusColor: Colors.grey.shade200,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(80),
                                        borderSide:
                                            const BorderSide(color: Colors.white),
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          controller.togglePasswordVisibility();
                                        },
                                        icon: controller.isPassHidden.value
                                            ? const Icon(Icons.visibility_off, color: Colors.black)
                                            : const Icon(Icons.visibility, color: Colors.black),
                                      )),
                                  obscuringCharacter: '*',
                                  isPassword: controller.isPassHidden.value,
                                  controller: controller.passC2,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Masukkan password anda terlebih dahulu...';
                                    }
                                    if (val != controller.passC.text) {
                                      return 'Kata sandi yang anda masukkan tidak cocok';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            12.height,
                            if (controller.isRegis)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: AppTextField(
                                  textFieldType: TextFieldType.MULTILINE,
                                  decoration: InputDecoration(
                                    hintText: 'Alamat',
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade400,
                                        fontWeight: FontWeight.bold),
                                    contentPadding: const EdgeInsets.all(25),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Icon(
                                        Icons.location_on,
                                        size: 25,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    fillColor: Colors.grey.shade200,
                                    focusColor: Colors.grey.shade200,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(80),
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  controller: controller.adressC,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Masukkan alamat rumah anda terlebih dahulu...';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            10.height,
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shadowColor: MaterialStateProperty.all(
                                    Colors.black,
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.black,
                                  ),
                                ),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    if (controller.isRegis) {
                                      if (controller.isSaving) {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                content: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    const CircularProgressIndicator(),
                                                    15.height,
                                                    const Text(
                                                      "Mohon tunggu sebentar...",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                              );
                                            });
                                      } else {
                                        controller.signup();
                                      }
                                    } else {
                                      if (controller.isSaving) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  const CircularProgressIndicator(),
                                                  15.height,
                                                  const Center(
                                                    child: Text(
                                                      'Loading..',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        controller.login();
                                      }
                                    }
                                  }
                                },
                                child: SizedBox(
                                  height: 60,
                                  width: double.infinity,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      controller.isRegis ? 'Daftar' : 'Masuk',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            10.height,
                            Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  controller.isRegis = !controller.isRegis;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Text(
                                    controller.isRegis
                                        ? 'Sudah Punya Akun? Login Disini'
                                        : 'Belum Punya Akun? Daftar Disini',
                                    style: const TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                            ),
                            if (!kIsWeb || controller.isRegis)
                              InkWell(
                                onTap: () async {
                                  await controller.signInWithGoogle();
                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.height / 4,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                    colors: [
                                      Colors.grey.shade50,
                                      Colors.grey.shade50,
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  )),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Container(
                                          height: 70,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            gradient: LinearGradient(
                                                colors: [
                                                  Colors.grey.shade50,
                                                  Colors.white,
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade300,
                                                offset: const Offset(2, 3),
                                                blurRadius: 10,
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Transform.scale(
                                                scale: 0.5,
                                                child: Image.asset(
                                                  'assets/icons/google.png',
                                                ),
                                              ),
                                              Text(
                                                'Daftar dengan Google',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 14,
                                                    color: Colors.grey.shade800),
                                              ),
                                              const Icon(
                                                Icons.arrow_forward,
                                                size: 30,
                                                color: Colors.black,
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
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
