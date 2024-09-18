import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/listado_screen.dart';
import 'screens/pago_screen.dart';
import 'screens/registrar_cliente_screen.dart';
import 'providers/cliente_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ClienteProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PrestoFast',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/registrar': (context) => const RegistrarClienteScreen(),
        '/pago': (context) => const PagoScreen(),
        '/listado': (context) => const ListadoScreen(),
      },
    );
  }
}
