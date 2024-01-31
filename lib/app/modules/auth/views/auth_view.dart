// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/utils/colors.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  GlobalKey<FormState> formKey = GlobalKey();
  AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double textFieldWidth = MediaQuery.of(context).size.width - 114;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bgLR.jpg'), fit: BoxFit.cover),
              ),
            ),
            SingleChildScrollView(
              child: Obx(() => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Center(
                          child: Image.asset(
                            'assets/icons/logo_login.png',
                            width: 350,
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: Form(
                                key: formKey,
                                autovalidateMode: AutovalidateMode.always,
                                child: Column(
                                  children: [
                                    //username
                                    10.height,
                                    if (controller.isRegis)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, top: 20),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.person,
                                              color: colorPrimary,
                                            ),
                                            10.width,
                                            SizedBox(
                                              height: 60,
                                              width: textFieldWidth,
                                              child: AppTextField(
                                                textFieldType:
                                                    TextFieldType.NAME,
                                                showCursor: true,
                                                cursorColor: colorPrimary,
                                                controller: controller.nameC,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: const InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            top: 10, bottom: 5),
                                                    labelText: "Username",
                                                    labelStyle: TextStyle(
                                                        color: colorPrimary),
                                                    border: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                grey)),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                colorPrimary)),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                colorPrimary)),
                                                    errorBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                redColor))),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Username wajib diisi';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    5.height,
                                    //email
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.email,
                                            color: colorPrimary,
                                          ),
                                          10.width,
                                          SizedBox(
                                            height: 60,
                                            width: textFieldWidth,
                                            child: AppTextField(
                                              textFieldType:
                                                  TextFieldType.EMAIL,
                                              showCursor: true,
                                              cursorColor: colorPrimary,
                                              controller: controller.emailC,
                                              textInputAction:
                                                  TextInputAction.next,
                                              decoration: const InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          top: 10, bottom: 5),
                                                  labelText: "Email",
                                                  labelStyle: TextStyle(
                                                      color: colorPrimary),
                                                  border: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: grey)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color:
                                                                  colorPrimary)),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color:
                                                                  colorPrimary)),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color:
                                                                  redColor))),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Email wajib diisi';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    5.height,
                                    //password
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.lock_outline,
                                            color: colorPrimary,
                                          ),
                                          10.width,
                                          SizedBox(
                                            height: 60,
                                            width: textFieldWidth,
                                            child: AppTextField(
                                              textFieldType:
                                                  TextFieldType.PASSWORD,
                                              showCursor: true,
                                              isPassword:
                                                  controller.isPassHidden.value,
                                              cursorColor: colorPrimary,
                                              controller: controller.passC,
                                              textInputAction:
                                                  TextInputAction.next,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          top: 10, bottom: 5),
                                                  labelText: "Password",
                                                  labelStyle: const TextStyle(
                                                      color: colorPrimary),
                                                  suffixIcon: IconButton(
                                                    onPressed: () {
                                                      controller
                                                          .togglePasswordVisibility();
                                                    },
                                                    icon: controller
                                                            .isPassHidden.value
                                                        ? const Icon(Icons
                                                            .visibility_off)
                                                        : const Icon(
                                                            Icons.visibility),
                                                  ),
                                                  border:
                                                      const UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color:
                                                                  grey)),
                                                  focusedBorder:
                                                      const OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color:
                                                                  colorPrimary)),
                                                  enabledBorder:
                                                      const OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color:
                                                                  colorPrimary)),
                                                  errorBorder:
                                                        const OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color:
                                                                    redColor))),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Harap isi password Anda';
                                                }
                                                return null;
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    5.height,
                                    //confirm password
                                    if (controller.isRegis)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.lock_outline,
                                              color: colorPrimary,
                                            ),
                                            10.width,
                                            SizedBox(
                                              height: 60,
                                              width: textFieldWidth,
                                              child: AppTextField(
                                                textFieldType:
                                                    TextFieldType.PASSWORD,
                                                showCursor: true,
                                                isPassword: controller
                                                    .isPassHidden.value,
                                                cursorColor: colorPrimary,
                                                controller: controller.passC2,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.only(
                                                            top: 10, bottom: 5),
                                                    labelText:
                                                        "Konfirmasi Password",
                                                    labelStyle: const TextStyle(
                                                        color: colorPrimary),
                                                    suffixIcon: IconButton(
                                                      onPressed: () {
                                                        controller
                                                            .togglePasswordVisibility();
                                                      },
                                                      icon: controller
                                                              .isPassHidden
                                                              .value
                                                          ? const Icon(Icons
                                                              .visibility_off)
                                                          : const Icon(
                                                              Icons.visibility),
                                                    ),
                                                    border: const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                grey)),
                                                    focusedBorder:
                                                        const OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color:
                                                                    colorPrimary)),
                                                    enabledBorder:
                                                        const OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color:
                                                                    colorPrimary)),
                                                    errorBorder:
                                                        const OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color:
                                                                    redColor))),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Harap isi password Anda';
                                                  }
                                                  if (value !=
                                                      controller.passC.text) {
                                                    return 'Kata sandi tidak cocok';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    5.height,
                                    //alamat
                                    if (controller.isRegis)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on,
                                              color: colorPrimary,
                                            ),
                                            10.width,
                                            SizedBox(
                                              height: 60,
                                              width: textFieldWidth,
                                              child: AppTextField(
                                                textFieldType:
                                                    TextFieldType.MULTILINE,
                                                showCursor: true,
                                                cursorColor: colorPrimary,
                                                controller: controller.adressC,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: const InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            top: 10, bottom: 5),
                                                    labelText: 'Alamat',
                                                    labelStyle: TextStyle(
                                                        color: colorPrimary),
                                                    border: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                grey)),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                colorPrimary)),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                colorPrimary)),
                                                    errorBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                redColor))),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Alamat wajib diisi';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (controller.isRegis)
                                    20.height,
                                  ],
                                )),
                          ),
                        ),
                      ),
                      //button
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 25, left: 20, right: 20),
                        child: ElevatedButton(
                          onPressed: () {
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
                                              const CircularProgressIndicator(
                                                  color: colorPrimary),
                                              15.height,
                                              const Text(
                                                "Mohon tunggu sebentar...",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: colorPrimary),
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
                                            const CircularProgressIndicator(
                                                color: colorPrimary),
                                            15.height,
                                            const Center(
                                              child: Text(
                                                'Loading..',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: colorPrimary),
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
                          style: ElevatedButton.styleFrom(
                            elevation: 8,
                            shadowColor: Colors.grey,
                            backgroundColor: colorPrimary,
                            minimumSize: const Size(double.infinity, 45),
                          ),
                          child: Text(
                            controller.isRegis ? 'Daftar' : 'Masuk',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
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
                                  color: colorPrimary,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              controller.resetPassword(controller.emailC.text);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                controller.isRegis ? '' : 'Lupa Password',
                                style: const TextStyle(
                                    color: colorPrimary,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: ElevatedButton.icon(
                            onPressed: () async {
                              await controller.signInWithGoogle();
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 8,
                              shadowColor: Colors.grey,
                              backgroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 45),
                            ),
                            icon: Image.asset(
                              'assets/icons/google.png',
                              width: 20,
                            ),
                            label: const Text(
                              'Sign in With Google',
                              style: TextStyle(
                                color: colorPrimary,
                                fontSize: 15,
                              ),
                            )),
                      )
                    ],
                  )),
            )
          ],
        ));
  }
}
