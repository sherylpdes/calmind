import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, image;

  const DetailScreen({
    super.key,
    required this.title,
    required this.image,
  });

  String _getEmergencyNumber() {
    switch (title) {
      case 'Ambulance':
        return '119';  
      case 'Call Center':
        return '1500 567 \n +62 812 6050 0567 \n +62 812 8156 2620'; 
      case 'Sejiwa':
        return '(021) 5682841'; 
      case 'Yayasan Pulih':
        return '+62 811 8436 633'; 
      case 'Bisa Helpline':
        return '+62 811 385 5472'; 
      default:
        return 'Unknown'; 
    }
  }

   String _getEmergencyDetail() {
    switch (title) {
      case 'Ambulance':
        return "Indonesia memiliki nomor darurat 119 untuk menghubungi ambulans atau Kementerian Kesehatan (Kemenkes). "
        "Secara khusus, nomor ini bisa kamu hubungi apabila keluarga atau teman terdekat mengalami gangguan mental yang bersifat parah dan memerlukan penanganan medis sesegera mungkin. "
        "Misalnya, ketika orang terdekatmu depresi sampai melakukan tindakan percobaan bunuh diri, kamu bisa segera menelepon 119. Nantinya, pihak gawat darurat akan mengirim ambulans untuk memberikan pertolongan pertama. ";  
      case 'Call Center':
        return "lewat call center ini, kamu bisa menanyakan lokasi bantuan terdekat dari tempat tinggalmu. "
        "Untuk menghubungi Halo Kemenkes, kamu bisa menelepon langsung ke nomor 1500 567. Bisa juga menghubungi lewat WhatsApp dengan nomor +62 812 6050 0567 atau melalui SMS di nomor +62 812 8156 2620."; 
      case 'Sejiwa':
        return "Sejiwa merupakan layanan kesehatan mental yang disediakan oleh pemerintah Indonesia sejak April 2020. Layanan ini difasilitasi oleh Rumah Sakit Jiwa dr. Soeharto Heerdjan. "
        "Kamu bisa menghubungi Sejiwa lewat kontak darurat 119 dengan ekstensi 8. Nantinya, pihak Sejiwa akan memberikan dukungan berupa rekomendasi pencegahan serta tindakan yang perlu dilakukan."
        "Tapi, meskipun bisa diakses lewat kontak gawat darurat, Sejiwa tidak menyediakan fasilitas pertolongan pertama untuk kasus bunuh diri. "
        "Layanan ini bisa membantu mengantar dan menjemput pasien, serta melakukan mental health check up. "; 
      case 'Yayasan Pulih':
        return " Yayasan Pulih, sebuah lembaga swadaya masyarakat non-profit yang berfokus pada kesehatan psikososial. Yayasan ini menyediakan tiga jenis konseling psikologis, yaitu konseling individu, konseling pasangan, dan konseling keluarga."
        "Untuk menggunakan layanan dari Yayasan Pulih, kamu bisa menghubungi kontak WhatsApp mereka di +62 811 8436 633. Setelah itu, kamu akan diminta mengisi formulir pendaftaran."
        "Selanjutnya, pihak admin akan menyesuaikan jadwal psikolog dengan jadwalmu selaku pasien. Kemudian, kamu akan diminta untuk datang pada sesi konseling yang telah disepakati. "
        "Konseling bisa dilakukan secara online maupun offline. Untuk konseling offline, prosesnya dilakukan di kantor Yayasan Pulih di kawasan Pasar Minggu, Jakarta Selatan. "; 
      case 'Bisa Helpline':
        return "BISA merupakan program baru dari Love Inside Suicide Awareness (LISA), sebuah program dukungan kesehatan jiwa yang berasal dari Bali. Nama BISA mulai dipakai sejak tahun 2023."
        "Secara khusus, BISA berkomitmen untuk melayani pasien jiwa dengan masalah kecanduan, melukai diri sendiri, atau usaha percobaan bunuh diri. Tapi, layanan teleponnya juga bisa dipakai untuk berkonsultasi mengenai isu kejiwaan lainnya." 
        "Call center BISA tidak beroperasi selama 24 jam dan hanya bisa diakses lewat situs resmi BISA Helpline. Jika tidak ada balasan dari call center, kamu bisa juga menghubungi BISA lewat WhatsApp di +62 811 385 5472."; 
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
                    'Nomor Telepon Darurat',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    _getEmergencyNumber(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    _getEmergencyDetail(),
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