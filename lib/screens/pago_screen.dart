import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cliente.dart';
import '../providers/cliente_provider.dart';

class PagoScreen extends StatefulWidget {
  const PagoScreen({super.key});

  @override
  _PagoScreenState createState() => _PagoScreenState();
}

class _PagoScreenState extends State<PagoScreen> {
  Cliente? clienteSeleccionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pago de Cuota'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      body: Container(
        color: Colors.grey[50], // Color de fondo suave
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ClienteProvider>(
          builder: (context, clienteProvider, child) {
            if (clienteProvider.clientes.isEmpty) {
              return Center(
                child: Text(
                  'No hay clientes registrados.',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600]),
                ),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DropdownButton<Cliente>(
                    hint: const Text('Selecciona un cliente'),
                    isExpanded: true,
                    value: clienteSeleccionado,
                    dropdownColor: Color(Colors.grey[100]!.value),
                    onChanged: (Cliente? value) {
                      setState(() {
                        clienteSeleccionado = value;
                      });
                    },
                    items: clienteProvider.clientes.map((Cliente cliente) {
                      return DropdownMenuItem<Cliente>(
                        value: cliente,
                        child: Text(cliente.nombre),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  if (clienteSeleccionado != null) ...[
                    Card(
                      elevation: 5,
                      color: Color(Colors.grey[100]!.value),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  'Cuotas pagadas: ${clienteSeleccionado!.cuotasPagadas}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                                Text(
                                  'Cuotas restantes: ${clienteSeleccionado!.cuotasTotales - clienteSeleccionado!.cuotasPagadas}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                minimumSize: const Size(double.infinity, 50),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text('Pagar Cuota'),
                              onPressed: () {
                                setState(() {
                                  if (clienteSeleccionado!.cuotasPagadas <
                                      clienteSeleccionado!.cuotasTotales) {
                                    clienteSeleccionado!.cuotasPagadas++;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
