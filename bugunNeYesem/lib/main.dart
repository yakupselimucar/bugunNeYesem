import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const BenimUygulamam(),
  );
}

class BenimUygulamam extends StatelessWidget {
  const BenimUygulamam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "BUGÜN NE YESEM?",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: YemekSayfasi(),
      ),
    );
  }
}

class YemekSayfasi extends StatefulWidget {
  YemekSayfasi({super.key});

  @override
  State<YemekSayfasi> createState() => _YemekSayfasiState();
}

class _YemekSayfasiState extends State<YemekSayfasi> {
  int corbaNo = 1;

  int yemekNo = 1;

  int tatliNo = 1;

  List<String> corbaAdlari = [
    'Mercimek Çorbası',
    'Ezogelin Çorbası',
    'Sebzeli Tavuk Çorbası',
    'Mantar Çorbası',
    'Nohut Çorbası'
  ];

  List<String> yemekAdlari = [
    'Karnıyarık',
    'Mantı',
    'Kuru Fasulye',
    'İçli Köfte',
    'Balık'
  ];

  List<String> tatliAdlari = [
    'kadayıf',
    'Baklava',
    'Sütlaç',
    'Kazandibi',
    'Dondurma'
  ];

  //Tanımlanan fonskiyon burada
  void yemekleriyenile() {
    setState(
      () {
        corbaNo = Random().nextInt(5) + 1;
        yemekNo = Random().nextInt(5) + 1;
        tatliNo = Random().nextInt(5) + 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: yemekleriyenile,
                //direkt olarak süslü parantez olmadan da yazılabilir.
                child: Image.asset('assets/images/corba_$corbaNo.jpg'),
              ),
            ),
          ),
          Text(corbaAdlari[corbaNo - 1]),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    yemekleriyenile();

                    print('Yeni Yemek Numarası: $yemekNo');
                  },
                  child: Image.asset('assets/images/yemek_$yemekNo.jpg')),
            ),
          ),
          Text(yemekAdlari[yemekNo - 1]),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  yemekleriyenile();

                  print('Yeni Tatlı Numarası: $tatliNo');
                },
                child: Image.asset('assets/images/tatli_$tatliNo.jpg'),
              ),
            ),
          ),
          Text(tatliAdlari[tatliNo - 1]),
          //flex özelliği default olarak 1 değerinde gelir. Aşina olabilmek için silmedim.
        ],
      ),
    );
  }
}
