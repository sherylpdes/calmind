import 'package:calmind/detail_relaxation.dart';
import 'package:calmind/emergency_number.dart';
import 'package:calmind/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RelaxationScreen extends StatefulWidget {
  const RelaxationScreen({super.key});

  @override
  State<RelaxationScreen> createState() => _RelaxationScreenState();
}

class _RelaxationScreenState extends State<RelaxationScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> _relaxationData = [
    {'title': 'Meditasi', 'img': 'meditasi.jpg'},
    {'title': 'Yoga', 'img': 'yoga.jpg'},
    {'title': 'Deep Breath', 'img': 'nafas.jpg'},
    {'title': 'Jalan-Jalan', 'img': 'jalan.jpg'},
    {'title': 'Mendengar Musik', 'img': 'musik.jpg'},
    {'title': 'Baca Buku', 'img': 'buku.jpg'},
    {'title': 'Menulis Jurnal', 'img': 'jurnal.jpg'},
    {'title': 'Mandi Air Hangat', 'img': 'mandi.jpg'},
    {'title': 'Family Time', 'img': 'family.jpg'},
    {'title': 'Hobi Baru', 'img': 'hobi.jpg'},
  ];

  List<Map<String, String>> _filteredData = [];

  @override
  void initState() {
    super.initState();
    _filteredData = _relaxationData;
  }

  void _filterSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredData = _relaxationData;
      } else {
        _filteredData = _relaxationData
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
        title: const Text('Relaxation Activity'),
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
                            builder: (_) => const RelaxationScreen()),
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
                    'Find Emergency Number',
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
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.2),
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
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: _filteredData.length,
                  itemBuilder: (context, index) {
                    final item = _filteredData[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailRelaxation(
                              title: item['title']!,
                              image: item['img']!,
                            ),
                          ),
                        );
                      },
                      child: EmergencyNumber(
                        title: item['title']!,
                        img: item['img']!,
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
