import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PrestoFast'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      body: Container(
        color: Colors.grey[50], // Color de fondo suave
        padding: const EdgeInsets.all(16.0),
        child: Center(
          // Centra el contenido en la pantalla
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centra horizontalmente
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 130, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Wrap(children: <Widget>[
                  Icon(Icons.add),
                  SizedBox(width: 10),
                  Text('Registrar', style: TextStyle(fontSize: 18))
                ]),
                onPressed: () {
                  Navigator.pushNamed(context, '/registrar');
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 130, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Wrap(children: [
                  Icon(Icons.attach_money),
                  SizedBox(width: 10),
                  Text('Pago', style: TextStyle(fontSize: 18))
                ]),
                onPressed: () {
                  Navigator.pushNamed(context, '/pago');
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 130, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Wrap(children: <Widget>[
                  Icon(Icons.list_alt),
                  SizedBox(width: 10),
                  Text('Listado', style: TextStyle(fontSize: 18))
                ]),
                onPressed: () {
                  Navigator.pushNamed(context, '/listado');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
