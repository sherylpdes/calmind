import 'package:flutter/material.dart';

class DetailHomeScreen extends StatelessWidget {
  final String title, image;

  const DetailHomeScreen({
    super.key,
    required this.title,
    required this.image,
  });

  String _getDailyInfo() {
    switch (title) {
      case 'Mental Health Tips':
        return 'Here are some mental health tips to improve your daily well-being: \n'
            '1. Stay active and exercise daily. \n'
            '2. Practice mindfulness or meditation. \n'
            '3. Reach out for support when needed. \n'
            '4. Maintain a balanced diet.';
      case 'Saya pantas mendapatkan kebahagiaan':
        return 'Setiap orang berhak merasakan kebahagiaan. Ucapkan afirmasi ini untuk mengingatkan dirimu bahwa kamu layak merasakan hal-hal positif dalam hidup.';
      case 'Meditasi':
        return "Cara: Duduk dengan nyaman, fokus pada napas. Ketika pikiran mengembara, bawa kembali fokus ke napas.";
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
                    'Daily Information',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    _getDailyInfo(),
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
