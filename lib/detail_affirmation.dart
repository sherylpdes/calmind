import 'package:flutter/material.dart';

class DetailAffirmation extends StatelessWidget {
  final String title, image;

  const DetailAffirmation({
    super.key,
    required this.title,
    required this.image,
  });

  String _getAffrimationInfo() {
    switch (title) {
      case 'Saya mampu melakukan apa saja yang saya inginkan':
        return 'Afirmasi ini mengingatkanmu bahwa kamu memiliki potensi yang tak terbatas dan bisa mencapai segala tujuan yang kamu tetapkan.';
      case 'Saya pantas mendapatkan kebahagiaan':
        return 'Setiap orang berhak merasakan kebahagiaan. Ucapkan afirmasi ini untuk mengingatkan dirimu bahwa kamu layak merasakan hal-hal positif dalam hidup.';
      case 'Saya kuat dan tangguh':
        return 'Afirmasi ini akan membantumu menghadapi tantangan dengan lebih baik. Ingatkan dirimu bahwa kamu memiliki kekuatan untuk melewati segala kesulitan.';
      case 'Saya belajar dan tumbuh setiap hari':
        return 'Proses belajar adalah hal yang alami. Dengan mengulang afirmasi ini, kamu akan termotivasi untuk terus mengembangkan diri.';
      case 'Saya bersyukur atas semua yang saya miliki':
        return 'Mensyukuri hal-hal kecil dalam hidup akan membantumu merasa lebih bahagia dan puas.';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(title),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),  
            child: Image.asset(
              'assets/images/$image',
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Positive Information',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    _getAffrimationInfo(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
