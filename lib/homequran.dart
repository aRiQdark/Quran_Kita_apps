import 'package:alquran/controller/alqurancontroller.dart';

import 'package:alquran/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class beranda extends GetView<alquran> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => alquran());
    return FutureBuilder<List<Datum>>(
      future: controller.getdata(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Color(0xff171212),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xff171212),
            body: Center(
              child: Text('error:${snapshot.error}'),
            ),
          );
        } else {
          final produk = snapshot.data;
          // QuranApi? tes = snapshot.data;
          return Scaffold(
              backgroundColor: Color(0xff171212),
              appBar: AppBar(
                backgroundColor: Color(0xff171212),
                elevation: 0,
                centerTitle: true,
                title: Text(
                  "Quran Masjid Apps",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color(0xffB7AFAF),
                      fontStyle: FontStyle.normal),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Hi",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 30),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        "Mau baca apa hari ni le awak?",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset("assets/images/bannerislam 1.png"),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height:510,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Get.lazyPut(() => alquran());
                          Datum quranapi = snapshot.data![index];
                          print(quranapi.name);

                          return InkWell(
                            onTap: (){
                              Get.defaultDialog(
                                title: 'Tafsir',
                                middleText: '${quranapi.tafsir?.id}',
                             confirm: ElevatedButton(onPressed: () => controller.tes(), child: Text("Selengkapnya"))
                              );
                              
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 15),
                              height: 120,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Color.fromARGB(255, 70, 51, 51)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(255, 46, 44, 44),
                                      child: Text("${quranapi.number}"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 45),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Surah ${quranapi.name?.transliteration?.id ?? 'invalid data'}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${quranapi.numberOfVerses} Ayat | ${quranapi.revelation?.id}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: 15),
                                              ),
                                              Text(
                                                "${quranapi.name?.long}",
                                                style: TextStyle(color: Colors.white),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ));
        }
      },
    );
  }
}
