import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const DiceApp());

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hoď kockou',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      home: const AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: DiceScreen(),
      ),
    );
  }
}

// StatefulWidget uchováva aktuálnu stranu kocky medzi prekresleniami.
class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  final randomizer = Random(); // Generátor vytvoríme iba raz.
  int currentDiceRoll = 1;

  void rollDice() {
    setState(() {
      // nextInt(6) dá 0–5; +1 posunie rozsah na 1–6.
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF21183E), Color(0xFF59417D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Hoď kockou',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Ťukni na tlačidlo a skús svoje šťastie.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 36),
                  // Podľa stavu načítame jeden zo šiestich lokálnych obrázkov.
                  Image.asset(
                    'assets/images/dice-$currentDiceRoll.png',
                    width: 240,
                    height: 240,
                    semanticLabel: 'Kocka: $currentDiceRoll',
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Hodnota: $currentDiceRoll',
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: rollDice,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF3B8D5),
                      foregroundColor: const Color(0xFF21183E),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 16,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    icon: const Icon(Icons.casino_outlined),
                    label: const Text('Hodiť kockou'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
