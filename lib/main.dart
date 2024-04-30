import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gioco Contatore',
      home: const StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inizia il Gioco!'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImageGalleryPage(),
              ),
            );
          },
          child: const Text('Inizia il Gioco!'),
        ),
      ),
    );
  }
}

class ImageGalleryPage extends StatelessWidget {
  ImageGalleryPage({super.key});

  final List<String> _imagePaths = [
    'assets/david.jpg',
    'assets/san_giorgio.jpg',
    'assets/ubuk.jpg',
    'assets/Donatello.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scegli un\'immagine'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: _imagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CounterPage(imagePath: _imagePaths[index]),
                ),
              );
            },
            child: Image.asset(
              _imagePaths[index],
              fit: BoxFit.contain, // Adatta l'immagine per coprire tutto lo schermo
            ),
          );
        },
      ),
    );
  }
}

class CounterPage extends StatefulWidget {
  final String imagePath;

  const CounterPage({Key? key, required this.imagePath}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatore'),
      ),
      body: GestureDetector(
        onTap: _incrementCounter, // Incrementa il contatore quando si clicca sull'immagine
        child: Container(
          width: double.infinity, // Larghezza del box (tutta la larghezza dello schermo)
          height: double.infinity, // Altezza del box (tutta l'altezza dello schermo)
          color: Colors.transparent, // Colore trasparente
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                widget.imagePath, // Immagine da visualizzare
                fit: BoxFit.contain, // Adatta l'immagine per coprire tutto il box
              ),
              Text(
                '$_counter',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Colore bianco per il contatore
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

