import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/modules/auth/controllers/auth_controller.dart';

class WebScreenAuth extends GetView<AuthController> {
  final GlobalKey<FormState> formKey = GlobalKey();
  WebScreenAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffc1dbfe),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(-1, -2),
                blurRadius: 15,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Obx(() => Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.isRegis ? 'Daftar' : 'Masuk',
                        style: const TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    )),
                20.height,
                Obx(() => Text(
                      controller.isRegis
                          ? 'Hai, Selamat datang di SmartLib, silahkan isi data dibawah ini untuk mendaftar.'
                          : "Masukkan email dan password kamu untuk login",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )),
                20.height,
                Obx(
                  () => Form(
                    key: formKey,
                    child: Column(
                      children: [
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
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
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
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
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
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
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
                                        borderRadius: BorderRadius.circular(100),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(100),
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
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
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
                        12.height,
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
                                                fontWeight: FontWeight.bold,
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
                                                  fontWeight: FontWeight.bold,
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
                          child: Text(
                            controller.isRegis ? 'Daftar' : 'Masuk',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.blue[300],
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
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
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
