import 'package:cbt_app/common/constants/colors.dart';
import 'package:flutter/material.dart';

class OpsiPage extends StatefulWidget {
  const OpsiPage({super.key});

  @override
  State<OpsiPage> createState() => _OpsiPageState();
}

class _OpsiPageState extends State<OpsiPage> {
  String fileName = "Upload Gambar";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Soal',
          style: TextStyle(
            fontSize: 20,
            color: ColorName.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Opsi A',
                  border: OutlineInputBorder(),
                ),
                // ...
              ),
              const SizedBox(height: 20),
              Row(
                children: [

                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(
                              255, 238, 238, 238), // Warna garis border
                        ),
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(8),
                            topRight: Radius.circular(
                                8)), // Membuat garis border melingkar
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          fileName,
                          style: const TextStyle(color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Opsi A',
                  border: OutlineInputBorder(),
                ),
                // ...
              ),
              const SizedBox(height: 20),
              Row(
                children: [

                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(
                              255, 238, 238, 238), // Warna garis border
                        ),
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(8),
                            topRight: Radius.circular(
                                8)), // Membuat garis border melingkar
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          fileName,
                          style: const TextStyle(color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Opsi A',
                  border: OutlineInputBorder(),
                ),
                // ...
              ),
              const SizedBox(height: 20),
              Row(
                children: [

                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(
                              255, 238, 238, 238), // Warna garis border
                        ),
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(8),
                            topRight: Radius.circular(
                                8)), // Membuat garis border melingkar
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          fileName,
                          style: const TextStyle(color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Opsi A',
                  border: OutlineInputBorder(),
                ),
                // ...
              ),
              const SizedBox(height: 20),
              Row(
                children: [


                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(
                              255, 238, 238, 238), // Warna garis border
                        ),
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(8),
                            topRight: Radius.circular(
                                8)), // Membuat garis border melingkar
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          fileName,
                          style: const TextStyle(color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Opsi A',
                  border: OutlineInputBorder(),
                ),
                // ...
              ),
              const SizedBox(height: 20),
              Row(
                children: [


                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(
                              255, 238, 238, 238), // Warna garis border
                        ),
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(8),
                            topRight: Radius.circular(
                                8)), // Membuat garis border melingkar
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          fileName,
                          style: const TextStyle(color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    ));
  }
}
