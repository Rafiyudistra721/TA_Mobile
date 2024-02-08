// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print, prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/user_model.dart';
import 'package:ta_mobile/app/integrations/firestore.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';
import 'package:ta_mobile/app/utils/colors.dart';

class AuthController extends GetxController {
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController passC2 = TextEditingController();
  TextEditingController adressC = TextEditingController();



  //fungsi login dengan google
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signInSilently(reAuthenticate: true);
      if (googleUser == null) {
        final  GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        if (googleUser == null) {
          throw Exception('Tidak dapat mengambil data pengguna dari Google.');
        }
      }

        final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        final User? user = userCredential.user;

        if (user == null) {
          throw Exception('Tidak dapat mengambil data pengguna dari Firebase.');
        }

        await saveGoogleUserToFirestore(user);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  
  //Menyimpan data user dari google ke firestore
  Future<void> saveGoogleUserToFirestore(User users) async {
    try {
      UserModel userModel = UserModel(
        id: users.uid,
        username: users.displayName ?? '',
        email: users.email!,
        alamat: '',
        fotoProfil: users.photoURL ?? '',
        level: 'Peminjam',
        dibuatTanggal: DateTime.now(),
      );

      await firebaseFirestore
          .collection(usersCollection)
          .doc(users.uid)
          .set(userModel.toJson);

      
      switch (user.level) {
        case "Admin":
        Get.offAndToNamed(Routes.DASHBOARD);
        break;
        case "Petugas":
        Get.offAndToNamed(Routes.DASHBOARD);
        break;
        case "Peminjam":
        Get.offAndToNamed(Routes.HOME);
        break;
      }
    } catch (e) {
      print('Error saving Google user to Firestore: $e');
      rethrow;
    }
  }



  RxBool isPassHidden = true.obs;

  void togglePasswordVisibility() {
    isPassHidden.value = !isPassHidden.value;
  }

  var currUser = UserModel().obs;
  UserModel get user => currUser.value;
  set user(UserModel value) => currUser.value = value;

  final _isRegis = false.obs;
  bool get isRegis => _isRegis.value;
  set isRegis(bool val) => _isRegis.value = val;

  final _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool val) => _isSaving.value = val;

  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  late Rx<User?> firebaseUser;

  //fungsi login dengan menggunakan email dan password
  login() async {
    try {
      final myUser = await auth.signInWithEmailAndPassword(
          email: emailC.text, password: passC.text);
      if (myUser.user!.emailVerified) {
        switch (user.level) {
        case "Admin":
        Get.offAndToNamed(Routes.DASHBOARD);
        break;
        case "Petugas":
        Get.offAndToNamed(Routes.DASHBOARD);
        break;
        case "Peminjam":
        Get.offAndToNamed(Routes.HOME);
        break;
      }
      } else {
        Get.defaultDialog(
          title: 'Verifikasi',
          titleStyle: const TextStyle(color: black),
          middleText:
              'Verifikasi email anda terlebih dahulu, Apakah verifikasi perlu dikirim ulang?',
          middleTextStyle: const TextStyle(color: greenColor),
          onConfirm: () async {
            await myUser.user!.sendEmailVerification();
            Get.back();
            Get.snackbar(
                'Berhasil', 'Kode verifikasi telah dikirimkan ke email Anda');
          },
          textConfirm: 'Iya',
          textCancel: 'Tidak',
          buttonColor: greenColor,
          confirmTextColor: white,
          cancelTextColor: white,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toast('Tidak ada user untuk email ini');
      } else if (e.code == 'wrong-password') {
        toast('Password salah untuk email ini');
      } else {
        toast(e.message);
      }
    } catch (e) {
      toast(e.toString());
    }
  }

  //fungsi daftar dengan menggunakan email dan password
  signup() async {
    try {
      isSaving = true;
      UserModel user = UserModel(
        username: nameC.text,
        email: emailC.text,
        alamat: adressC.text,
        fotoProfil: '',
        level: 'Peminjam',
        dibuatTanggal: DateTime.now(),
      );
      UserCredential myUser = await auth.createUserWithEmailAndPassword(
        email: emailC.text,
        password: passC.text,
      );
      await myUser.user!.sendEmailVerification();
      user.id = myUser.user!.uid;
      if (user.id != null) {
        firebaseFirestore
            .collection(usersCollection)
            .doc(user.id)
            .set(user.toJson)
            .then((value) {
          Get.defaultDialog(
              title: "Verifikasi Email",
              middleText: "Kami telah mengirimkan verifikasi ke Email anda",
              textConfirm: "Oke",
              onConfirm: () {
                nameC.clear();
                passC.clear();
                emailC.clear();
                adressC.clear();
                passC2.clear();
                Get.back();
                isRegis = false;
              },
              buttonColor: colorPrimary,
              cancelTextColor: colorPrimary,
              confirmTextColor: Colors.white,
              titleStyle: const TextStyle(color: colorPrimary),
              middleTextStyle: const TextStyle(color: colorPrimary));
        });
      }
      isSaving = false;
    } on FirebaseAuthException catch (e) {
      isSaving = false;
      if (e.code == 'weak-password') {
        toast('Password terlalu lemah');
      } else if (e.code == 'email-already-in-use') {
        toast('Akun sudah ada untuk email ini');
      } else {
        toast(e.message);
      }
    }
  }

  //fungsi logout
  logout() async {
    Get.defaultDialog(
      title: 'Logout',
      middleText: 'Anda yakin ingin keluar?',
      onConfirm: () async {
        await FirebaseAuth.instance.signOut();
        Get.back();
        isSaving = false;
        emailC.clear();
        passC.clear();
        Get.offAndToNamed(Routes.AUTH);
      },
      textConfirm: 'Iya',
      textCancel: 'Tidak',
      buttonColor: colorPrimary,
      confirmTextColor: Colors.black,
      cancelTextColor: colorPrimary,
      titleStyle: const TextStyle(color: colorPrimary),
      middleTextStyle: const TextStyle(color: colorPrimary),
    );
  }

  //fungsi reset password
  resetPassword(String email) async {
    if (email != '' && GetUtils.isEmail(email)) {
      await auth.sendPasswordResetEmail(email: email);
      Get.defaultDialog(
          title: 'Reset Password',
          middleText: 'Berhasil mengirim link reset password ke $email',
          onConfirm: () {
            Get.back();
            Get.back();
          },
          textConfirm: 'Oke',
          buttonColor: colorPrimary,
          cancelTextColor: colorPrimary,
          confirmTextColor: Colors.white,
          titleStyle: const TextStyle(color: colorPrimary),
          middleTextStyle: const TextStyle(color: colorPrimary));
    } else {
      Get.defaultDialog(
          title: 'Error',
          middleText: 'Email yang anda kirim tidak valid',
          textConfirm: 'Oke',
          onConfirm: () => Get.back(),
          buttonColor: colorPrimary,
          cancelTextColor: colorPrimary,
          confirmTextColor: Colors.white,
          titleStyle: const TextStyle(color: colorPrimary),
          middleTextStyle: const TextStyle(color: colorPrimary));
    }
  }

  streamUser(User? fuser) {
    if (fuser != null) {
      currUser.bindStream(UserModel().streamList(fuser.uid));
      print('auth id = ' + fuser.uid);
    } else {
      print('null auth');
      user = UserModel();
    }
  }

  @override
  void onInit() {
    super.onInit();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, streamUser);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() { 
    emailC.clear();
    passC.clear();
    passC2.clear();
    nameC.clear();
    adressC.clear();
    super.onClose();
  }
}
