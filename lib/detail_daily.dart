import 'package:flutter/material.dart';

class DetailDailyScreen extends StatelessWidget {
  final String title, image;

  const DetailDailyScreen({
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
      case 'Stress Management':
        return 'To manage stress, consider the following strategies: \n'
               '1. Identify the sources of your stress. \n'
               '2. Practice relaxation techniques like deep breathing. \n'
               '3. Take breaks and rest when needed. \n'
               '4. Focus on positive thinking.';
      case 'Self-Care Routines':
        return 'Incorporating self-care into your routine is essential for mental health: \n'
               '1. Create a morning routine that energizes you. \n'
               '2. Schedule “me time” to relax and unwind. \n'
               '3. Get quality sleep every night. \n'
               '4. Practice gratitude daily.';
      case 'Mindfulness Practices':
        return 'Mindfulness can help with emotional regulation: \n'
               '1. Try mindful breathing techniques. \n'
               '2. Engage in mindful activities like eating or walking. \n'
               '3. Stay present and focus on the moment.';
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
