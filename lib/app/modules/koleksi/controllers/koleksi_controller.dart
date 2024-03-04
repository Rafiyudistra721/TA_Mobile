// ignore_for_file: unnecessary_overrides, avoid_print, invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:ta_mobile/app/data/Models/buku_model.dart';
import 'package:ta_mobile/app/data/Models/kategori_model.dart';
import 'package:ta_mobile/app/data/Models/koleksi_model.dart';
import 'package:ta_mobile/app/data/Models/user_model.dart';

class KoleksiController extends GetxController {
  var categories = <KategoriModel>[].obs;
  var selectedCategory = ''.obs;
  var allBook = <BukuModel>[].obs;

  String? userId;

  modelToController(UserModel userModel) {
    userId = userModel.id;
    rxKoleksi.bindStream(KoleksiModel(userId: userId).streamlist());
  }

  void fetchCategories() async {
    try {
      final kategoriModel = KategoriModel();
      kategoriModel.streamList().listen((categoriesList) {
        categories.assignAll(categoriesList);
      });
    } catch (e) {
      print('Error fetching categories:  $e');
    }
  }

  void fetchBooks() {
    try {
      final bukuModel = BukuModel();
      bukuModel.streamList().listen((bookList) {
        allBook.assignAll(bookList);
      });
    } catch (e) {
      print('Error fetching books: $e');
    }
  }

  RxList<BukuModel> rxBuku = RxList<BukuModel>();
  List<BukuModel> get listBuku => rxBuku.value;
  set listBuku(List<BukuModel> value) => rxBuku.value = value;

  RxList<KoleksiModel> rxKoleksi = RxList<KoleksiModel>();
  List<KoleksiModel> get listKoleksi => rxKoleksi.value;
  set listKoleksi(List<KoleksiModel> value) => rxKoleksi.value = value;
  
  @override
  void onInit() {
    super.onInit();
    rxBuku.bindStream(BukuModel().streamList());
    fetchCategories();
    fetchBooks();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
