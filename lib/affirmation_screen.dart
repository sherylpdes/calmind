import 'package:calmind/detail_affirmation.dart';
import 'package:calmind/home_screen.dart'; 
import 'package:calmind/profile_screen.dart'; 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AffirmationScreen extends StatefulWidget {
  const AffirmationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AffirmationScreenState();
}

class _AffirmationScreenState extends State<AffirmationScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> _affirmationData = [
    {'title': 'Saya mampu melakukan apa saja yang saya inginkan', 'img': 'kerja.jpg'},
    {'title': 'Saya pantas mendapatkan kebahagiaan', 'img': 'bahagia.jpg'},
    {'title': 'Saya kuat dan tangguh', 'img': 'kuat.jpg'},
    {'title': 'Saya belajar dan tumbuh setiap hari', 'img': 'bertumbuh.jpg'},
    {'title': 'Saya bersyukur atas semua yang saya miliki', 'img': 'bersyukur.jpg'},
  ];

  List<Map<String, String>> _filteredData = [];

  @override
  void initState() {
    super.initState();
    _filteredData = _affirmationData;
  }

  void _filterSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredData = _affirmationData;
      } else {
        _filteredData = _affirmationData
            .where((item) =>
                item['title']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Positive Affirmation'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen(username: '',)),
                      );
                    },
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/logo.jpg'),
                      radius: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'calMind',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ProfileScreen()),
                      );
                    },
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user.jpg'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Find Posistive Affirmation',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 7),
                          color: Theme.of(context).primaryColor.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        const Icon(
                          CupertinoIcons.search,
                          color: Colors.teal,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            onChanged: _filterSearch,
                            decoration: const InputDecoration(
                              hintText: 'Search',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 7),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  itemCount: _filteredData.length,
                  itemBuilder: (context, index) {
                    final item = _filteredData[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailAffirmation(
                              title: item['title']!,
                              image: item['img']!,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 5,
                        margin: const EdgeInsets.only(bottom: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(10),
                              ),
                              child: Image.asset(
                                'assets/images/${item['img']}',
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    height: 80,
                                    width: 80,
                                    color: Colors.grey[200],
                                    child: const Icon(Icons.image_not_supported),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                item['title']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
