import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MojaAplikacia());
}

// Hlavná aplikácia
class MojaAplikacia extends StatelessWidget {
  const MojaAplikacia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Kocka(),
    );
  }
}

// Obrazovka s kockou
class Kocka extends StatefulWidget {
  const Kocka({super.key});

  @override
  State<Kocka> createState() => _KockaState();
}

class _KockaState extends State<Kocka> {

  // Náhodné číslo od 1 do 6
  int cisloKocky = 1;

  // Funkcia na hodenie kockou
  void hodKockou() {
    setState(() {
      cisloKocky = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hod kockou'),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Obrázok kocky
            Image.asset(
              'assets/images/dice-$cisloKocky.png',
              width: 200,
            ),

            const SizedBox(height: 30),

            // Číslo, ktoré sme hodili
            Text(
              'Hodil si $cisloKocky',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Tlačidlo
            ElevatedButton(
              onPressed: hodKockou,
              child: const Text('Hodiť kockou'),
            ),
          ],
        ),
      ),
    );
  }
}