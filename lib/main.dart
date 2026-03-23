import 'package:flutter/material.dart';
import 'mis_paginas_tab/pantalla1.dart';
import 'mis_paginas_tab/pantalla2.dart';
import 'mis_paginas_tab/pantalla3.dart';
import 'mis_paginas_tab/pantalla4.dart';
import 'mis_paginas_tab/pantalla5.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Florería Ajolote',
      theme: ThemeData(
        useMaterial3: true, // Habilita el diseño moderno de Google
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF80AB), // Rosa suave
          primary: const Color(0xFFFF80AB),
          secondary: const Color(0xFFFCE4EC),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF9FB), // Fondo casi blanco/rosado
      ),
      initialRoute: '/',
      routes: {'/': (context) => const PaginaPrincipal()},
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  int _selectedIndex = 0;

  final List<Widget> _paginas = [
    const Pantalla1(),
    const Pantalla2(),
    const Pantalla3(),
    const Pantalla4(),
    const Pantalla5(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FLORERÍA AJOLOTE',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent, // AppBar limpia y moderna
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF80AB), Color(0xFFFFB2CC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400), // Transición suave entre pantallas
        child: _paginas[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)], // Sombra suave
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFFFF4081),
          unselectedItemColor: Colors.grey.shade400,
          backgroundColor: Colors.white,
          elevation: 0,
          onTap: (index) => setState(() => _selectedIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Inicio'),
            BottomNavigationBarItem(icon: Icon(Icons.local_florist_rounded), label: 'Flores'),
            BottomNavigationBarItem(icon: Icon(Icons.auto_awesome_rounded), label: 'Ramos'),
            BottomNavigationBarItem(icon: Icon(Icons.spa_rounded), label: 'Cuidado'),
            BottomNavigationBarItem(icon: Icon(Icons.window_rounded), label: 'Macetas'),
          ],
        ),
      ),
    );
  }
}