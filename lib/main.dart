import 'package:flutter/material.dart';
import 'ContactListe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: ContactList(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
