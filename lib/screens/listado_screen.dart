import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cliente_provider.dart';

class ListadoScreen extends StatelessWidget {
  const ListadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listado de Clientes'),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          titleTextStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        body: Container(
          color: Colors.grey[50], // Color de fondo suave
          child: Consumer<ClienteProvider>(
            builder: (context, clienteProvider, child) {
              if (clienteProvider.clientes.isEmpty) {
                return const Center(
                  child: Text('No hay clientes registrados',
                      style: TextStyle(fontSize: 18)),
                );
              }
              return ListView.builder(
                itemCount: clienteProvider.clientes.length,
                itemBuilder: (context, index) {
                  final cliente = clienteProvider.clientes[index];
                  return Card(
                    color: Color(Colors.grey[100]!.value),
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    elevation: 5,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Text(cliente.nombre,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      subtitle: Text('Préstamo: \$${cliente.cantidadPrestada}',
                          style: const TextStyle(fontSize: 16)),
                      trailing: Text(
                          '${cliente.cuotasPagadas}/${cliente.cuotasTotales} cuotas',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.grey)),
                    ),
                  );
                },
              );
            },
          ),
        ));
  }
}
