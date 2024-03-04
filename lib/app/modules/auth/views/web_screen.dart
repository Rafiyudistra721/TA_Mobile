import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/modules/auth/controllers/auth_controller.dart';
import 'package:ta_mobile/app/utils/scalesize.dart';

class WebScreenAuth extends GetView<AuthController> {
  final GlobalKey<FormState> formKey = GlobalKey();
  WebScreenAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthContainers = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned(
              top: 20,
              bottom: 20,
              left: 20,
              child: Container(
                  width: widthContainers * .49,
                  // alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(-1, -2),
                          blurRadius: 15,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      gradient: LinearGradient(colors: <Color>[
                        Color(0xff004D47),
                        Color(0xff128277)
                      ])),
                  child: Obx(() => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            controller.isRegis
                                ? 'Halo!'
                                : 'Selamat Datang Kembali!',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textScaler: TextScaler.linear(
                                ScaleSize.textScaleFactor(context,
                                    maxTextScaleFactor: 3)),
                          ),
                          20.height,
                          Text(
                            controller.isRegis
                                ? 'Silahkan lengkapi data-data di samping ini untuk mendaftar'
                                : 'Masukkan Email dan Password anda untuk masuk',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textScaler: TextScaler.linear(
                                ScaleSize.textScaleFactor(context,
                                    maxTextScaleFactor: 1.4)),
                          ),
                          50.height,
                          Text(
                            controller.isRegis
                                ? 'Anda sudah memiliki akun? klik tombol dibawah ini'
                                : 'Anda belum memiliki akun? klik tombol dibawah ini',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textScaler: TextScaler.linear(
                                ScaleSize.textScaleFactor(context,
                                    maxTextScaleFactor: 1.1)),
                          ),
                          20.height,
                          OutlinedButton(
                              onPressed: () {
                                controller.isRegis = !controller.isRegis;
                              },
                              style: const ButtonStyle(
                                  foregroundColor:
                                      MaterialStatePropertyAll(Colors.white),
                                  side: MaterialStatePropertyAll(
                                      BorderSide(color: Colors.white))),
                              child: Text(
                                controller.isRegis ? "Masuk" : "Daftar",
                                style: const TextStyle(fontSize: 18),
                              ))
                        ],
                      )))),
          Positioned(
            top: 20,
            bottom: 20,
            right: 20,
            child: Container(
              width: widthContainers * .49,
              // alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(-1, -2),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/logofinalfinal.png',
                      height: 350,
                      width: 350,
                    ),
                    20.height,
                    Obx(
                      () => Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: Column(
                            children: [
                              if (controller.isRegis)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
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
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: Colors.white),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: Colors.white),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: AppTextField(
                                    textFieldType: TextFieldType.PASSWORD,
                                    decoration: InputDecoration(
                                        hintText: 'Konfirmasi Password',
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey.shade400,
                                            fontWeight: FontWeight.bold),
                                        contentPadding:
                                            const EdgeInsets.all(25),
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            controller
                                                .togglePasswordVisibility();
                                          },
                                          icon: controller.isPassHidden.value
                                              ? const Icon(
                                                  Icons.visibility_off,
                                                  color: Colors.black,
                                                )
                                              : const Icon(
                                                  Icons.visibility,
                                                  color: Colors.black,
                                                ),
                                        )),
                                    obscuringCharacter: '*',
                                    isPassword: controller.isPassHidden.value,
                                    controller: controller.passC2,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Konfirmasikan password yang telah anda masukkan sebelumnya';
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
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
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: Colors.white),
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
                              20.height,
                              ElevatedButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    if (controller.isRegis) {
                                      if (controller.isSaving) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const AlertDialog(
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  CircularProgressIndicator(),
                                                  SizedBox(height: 15),
                                                  Text(
                                                    "Mohon tunggu sebentar...",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        controller.signup();
                                      }
                                    } else {
                                      if (controller.isSaving) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const AlertDialog(
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  CircularProgressIndicator(),
                                                  SizedBox(height: 15),
                                                  Center(
                                                    child: Text(
                                                      'Loading..',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
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
                                  height: 40,
                                  width: double.infinity,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      controller.isRegis ? 'Daftar' : 'Masuk',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.blue[300],
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              50.height,
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
