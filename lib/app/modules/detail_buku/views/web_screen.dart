// import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
// import 'package:ta_mobile/app/integrations/firestore.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/buku_model.dart';
import 'package:ta_mobile/app/widgets/AppBar.dart';

import '../controllers/detail_buku_controller.dart';

class Web_Screen extends GetView<DetailBukuController> {
  Web_Screen({Key? key}) : super(key: key);

  BukuModel bukuModel = Get.arguments ?? BukuModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 255, 255, 255), // Updated to blue color
      appBar: appBar,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  children: [
                    const Text(
                      'Detail Buku',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'urbanist',
                          fontSize: 32),
                    ),
                    40.height,
                    Row( 
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Image.network(
                          bukuModel.coverBuku!,
                          height: defaultInkWellRadius,
                          width: 500,
                          fit: BoxFit.scaleDown,
                        ),

                        const SizedBox(width: 40), // Add spacing
                        // Text on the right
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                bukuModel.judul!,
                                style: const TextStyle(
                                    fontSize: 38,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'urbanist'),
                              ),
                              const SizedBox(
                                  height: 10), // Add spacing between texts
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Penulis: ',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'urbanist',
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '${bukuModel.penulis}', // Access and display penulis property
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight
                                            .normal, // Adjust weight if needed
                                        fontFamily: 'urbanist',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                  height: 10), // Add spacing between texts
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Penerbit: ',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'urbanist',
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '${bukuModel.penerbit}', // Access and display penulis property
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight
                                            .normal, // Adjust weight if needed
                                        fontFamily: 'urbanist',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                  height: 10), // Add spacing between texts
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Tahun Terbit: ',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'urbanist',
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '${bukuModel.tahunTerbit}', // Access and display penulis property
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight
                                            .normal, // Adjust weight if needed
                                        fontFamily: 'urbanist',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                  height: 10), // Add spacing between texts
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'kategori: ',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'urbanist',
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '${bukuModel.kategoriId}', // Access and display penulis property
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight
                                            .normal, // Adjust weight if needed
                                        fontFamily: 'urbanist',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Sinopsis: ',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'urbanist',
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '${bukuModel.sinopsis}', // Access and display penulis property
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight
                                            .normal, // Adjust weight if needed
                                        fontFamily: 'urbanist',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Stok: ',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'urbanist',
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '${bukuModel.jumlah}', // Access and display penulis property
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight
                                            .normal, // Adjust weight if needed
                                        fontFamily: 'urbanist',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                                height: 20,
                              ),
                              const Row(// Use another Row to align icon and number
                                  children: [
                                Icon(
                                  // Replace with your desired icon
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 28,
                                ),
                                SizedBox(
                                    width:
                                        5), // Add spacing between icon and number
                                Text(
                                  '4.5', // Replace with your rating value
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.amber,
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                    50.height,
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 50),
                                child: Text(
                                  'Ulasan',
                                  style: TextStyle(
                                      fontSize: 42,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'urbanist'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20, 
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: DataTable(
                            columns: const [
                              DataColumn(label: Text('Name')),
                              DataColumn(label: Text('Rating')),
                              DataColumn(label: Text('Review')),
                            ],
                            rows: const [
                              DataRow(cells: [
                                DataCell(Text('User 1')),
                                DataCell(Text('4.5')),
                                DataCell(Text('Great book!')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('User 2')),
                                DataCell(Text('5')),
                                DataCell(Text('Excellent read.')),
                              ]),
                              // Add more DataRow as needed
                            ],
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
    );
  }
}
