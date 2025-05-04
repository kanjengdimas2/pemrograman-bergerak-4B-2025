import 'package:flutter/material.dart';
import 'detail_screen.dart';
import 'tambah_wisata_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> hotPlaces = [
    {
      'nama': 'National Park Yosemite',
      'lokasi': 'California',
      'gambar': 'assets/yosemite.png',
    },
    {
      'nama': 'National Park Yosemite',
      'lokasi': 'California',
      'gambar': 'assets/yosemite.png',
    },
  ];

  final List<Map<String, String>> bestHotels = [
    {
      'nama': 'National Park Yosemite',
      'deskripsi': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quis, doloribus. Eos, accusantium doloremque! Tenetur, sed.',
      'gambar': 'assets/yosemite.png',
    },
    {
      'nama': 'National Park Yosemite',
      'deskripsi': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quis, doloribus. Eos, accusantium doloremque! Tenetur, sed.',
      'gambar': 'assets/yosemite.png',
    },
    {
      'nama': 'National Park Yosemite',
      'deskripsi': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quis, doloribus. Eos, accusantium doloremque! Tenetur, sed.',
      'gambar': 'assets/yosemite.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Hi, User',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  ClipOval(
                    child: Image.asset(
                      'assets/mdl1_p.png',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Hot Places',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: hotPlaces.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final place = hotPlaces[index];
                    return Container(
                      width: 220,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              place['gambar']!,
                              height: 64,
                              width: 64,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  place['nama']!,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on, size: 12, color: Colors.grey),
                                    const SizedBox(width: 4),
                                    Text(
                                      place['lokasi']!,
                                      style: const TextStyle(color: Colors.grey, fontSize: 10),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Best Hotels',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.separated(
                  itemCount: bestHotels.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final hotel = bestHotels[index];
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailScreen(),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                hotel['gambar']!,
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    hotel['nama']!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    hotel['deskripsi']!,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF4169E1),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TambahWisata(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
