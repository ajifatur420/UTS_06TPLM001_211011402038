import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nike Shoes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Menyembunyikan debug banner
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> nikeShoes = [
    {
      'name': 'Nike SB Zoom Blazer Mid Premium',
      'type': '',
      'color': Color.fromARGB(127, 112, 88, 247), // Warna biru muda
      'price': 28795,
      'image': '1.jpg',
    },
    {
      'name': 'Nike Air Zoom Pegasus',
      'type': 'Men\'s Road Running Shoes',
      'color': Color.fromARGB(255, 18, 158, 201), // Warna biru agak lebih tua
      'price': 29995,
      'image': '2.jpg',
    },
    {
      'name': 'Nike ZoomX Vaporfly',
      'type': 'Men\'s Road Racing Shoe',
      'color': Color.fromARGB(255, 100, 122, 246), // Warna biru sedang
      'price': 219695,
      'image': '3.jpg',
    },
    {
      'name': 'Nike Air Force 1 50',
      'type': 'Older Kids\' Shoe',
      'color': Colors.blue[400], // Warna biru lebih tua
      'price': 26295,
      'image': '4.jpg',
    },
    {
      'name': 'Nike Waffle One',
      'type': 'Men\'s Shoes',
      'color': Colors.blue[500], // Warna biru tua
      'price': 28295,
      'image': '5.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Transform.scale(
              scale: 1.0, // Skala gambar diperbesar dua kali
              child: CircleAvatar(
                radius: 16,
                backgroundImage:
                    AssetImage('huhu.jpg'), // Ganti dengan path gambar Anda
              ),
            ),
            SizedBox(width: 8),
            Text('MUHAMMAD AJI FATURAHMAN'),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      ),
      body: ListView.builder(
        itemCount: nikeShoes.length,
        itemBuilder: (context, index) {
          final shoe = nikeShoes[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            color: shoe[
                'color'], // Menggunakan warna yang ditentukan di dalam data
            child: ListTile(
              key: ValueKey(shoe['name']),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              title: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(shoe['name']),
                        SizedBox(height: 4),
                        Text('\$${shoe['price']}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      shoe['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              subtitle: _buildSubtitle(shoe),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSubtitle(Map<String, dynamic> shoe) {
    String type = shoe['type'] ?? '';
    String color =
        shoe['Blue'].toString() ?? ''; // Mengubah Color menjadi String
    String subtitle = type.isNotEmpty ? '$type' : '';
    if (type.isNotEmpty && color.isNotEmpty) {
      subtitle += ' - ';
    }
    subtitle += color;
    return Text(subtitle);
  }
}
