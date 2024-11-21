import 'package:flutter/material.dart';

class DetailRelaxation extends StatelessWidget {
  final String title, image;

  const DetailRelaxation({
    super.key,
    required this.title,
    required this.image,
  });

  String _getRelexationActivity() {
    switch (title) {
      case 'Meditasi':
        return 'Menenangkan pikiran';  
      case 'Yoga':
        return 'Menggabungkan gerakan pernapasan, fisik, dan meditasi'; 
      case 'Deep Breath':
        return 'Menarik nafas dalam'; 
      case 'Jalan-Jalan':
        return 'Mengurangi stres'; 
      case 'Mendengar Musik':
        return 'Menenangkan suasana hati'; 
      case 'Baca Buku':
        return 'Mengurangi stres';  
      case 'Menulis Jurnal':
        return 'Mengurangi beban emosional'; 
      case 'Mandi Air Hangat':
        return 'Meredakan otot yang tegang'; 
      case 'Family Time':
        return 'Meningkatkan kebahagiaan'; 
      case 'Hobi Baru':
        return 'Meningkatkan rasa pencapaian';
      default:
        return 'Unknown'; 
    }
  }

   String _getRelaxationDetail() {
    switch (title) {
      case 'Meditasi':
        return "Cara: Duduk dengan nyaman, fokus pada napas. Ketika pikiran mengembara, bawa kembali fokus ke napas."
"\n Deskripsi: Meditasi membantu menenangkan pikiran dan mengurangi stres. Ada banyak jenis meditasi, seperti meditasi kesadaran penuh (mindfulness) atau meditasi berfokus pada objek.";  
      case 'Yoga':
        return "Cara: Ikuti pose-pose yoga yang sesuai dengan kemampuanmu. Fokus pada pernapasan dan pergerakan tubuh."
   "\n Deskripsi: Yoga menggabungkan gerakan fisik, pernapasan, dan meditasi. Selain merelaksasi tubuh, juga membantu meningkatkan fleksibilitas dan kekuatan."; 
      case 'Deep Breath':
        return "Cara: Tarik napas dalam-dalam melalui hidung, tahan sebentar, lalu hembuskan perlahan melalui mulut."
   "\n Deskripsi: Teknik pernapasan dalam membantu menenangkan sistem saraf dan mengurangi kecemasan. "; 
      case 'Jalan-Jalan':
        return "Cara: Cari tempat yang tenang seperti taman atau hutan, lalu berjalan santai sambil menikmati pemandangan."
   "\n Deskripsi: Berada di alam dapat membantu mengurangi stres dan meningkatkan suasana hati."; 
      case 'Mendengar Musik':
        return "Cara: Dengarkan musik yang menenangkan atau sesuai dengan suasana hatimu."
   "\n Deskripsi: Musik dapat menjadi sarana relaksasi yang efektif. Beberapa jenis musik, seperti musik klasik atau alam, sering kali digunakan untuk relaksasi."; 
      case 'Baca Buku':
        return "Cara: Pilih buku yang menarik dan nikmati cerita di dalamnya."
   "\n Deskripsi: Membaca adalah cara yang bagus untuk melarikan diri dari rutinitas sehari-hari dan mengurangi stres.";  
      case 'Menulis Jurnal':
        return "Cara: Tuliskan pikiran dan perasaanmu dalam jurnal."
   "\n Deskripsi: Menulis jurnal dapat membantu mengklarifikasi pikiran dan mengurangi beban emosional."; 
      case 'Mandi Air Hangat':
        return "Cara: Tambahkan beberapa tetes minyak esensial seperti lavender atau chamomile ke dalam air mandi."
   "\n Deskripsi: Mandi air hangat dapat membantu meredakan otot yang tegang dan menenangkan pikiran."; 
      case 'Family Time':
        return "Cara: Habiskan waktu bersama teman atau keluarga."
   "\n Deskripsi: Hubungan sosial yang kuat sangat penting untuk kesehatan mental. Berinteraksi dengan orang yang kita sayangi dapat meningkatkan kebahagiaan."; 
      case 'Hobi Baru':
        return "Cara: Cobalah aktivitas baru yang menarik minatmu, seperti melukis, bermain musik, atau berkebun."
   "\n Deskripsi: Mempelajari hal baru dapat memberikan rasa pencapaian dan mengurangi kebosanan.";
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
                    'Aktivitas Relaksasi',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    _getRelexationActivity(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    _getRelaxationDetail(),
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