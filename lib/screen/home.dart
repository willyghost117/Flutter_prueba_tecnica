import 'package:flutter/material.dart';
import 'package:flutter_taxi/screen/data.dart';
import 'package:flutter_taxi/services/service.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Taxi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
              icon: Icons.travel_explore,
              onPressed: () async {
                final viajes = await ApiService.getViajes();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: Text('Viajes'),
                      ),
                      body: CustomListView(
                        items: viajes,
                        itemBuilder: (context, viaje) {
                          return ListTile(
                            title: Text('ID: ${viaje['id']}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Origen: (${viaje['latitud_origen']}, ${viaje['longitud_origen']})'),
                                Text(
                                    'Destino: (${viaje['latitud_destino']}, ${viaje['longitud_destino']})'),
                                Text('Fecha inicio: ${viaje['fecha_hora_inicio']}'),
                                Text('Costo: \$${viaje['costo']}'),
                                Text('Método de pago: ${viaje['metodo_pago']}'),
                                Text('Estado: ${viaje['estado']}'),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              text: 'Viajes',
            ),

            Button(
              icon: Icons.gps_fixed,
              onPressed: () async {
                final conductores = await ApiService.getConductores();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: Text('Conductores'),
                      ),
                      body: CustomListView(
                        items: conductores,
                        itemBuilder: (context, conductor) {
                          return ListTile(
                            title: Text('Nombre: ${conductor['nombre']}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Correo electrónico: ${conductor['correo_electronico']}'),
                                Text('Teléfono: ${conductor['telefono']}'),
                                Text(
                                    'Vehículo: ${conductor['vehiculo']}'),
                                
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              text: 'Conductores',
            ),

            Button(
              icon: Icons.price_check_sharp,
              onPressed: () async {
                final promociones = await ApiService.getPromociones();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: Text('Promociones'),
                      ),
                      body: CustomListView(
                        items: promociones,
                        itemBuilder: (context, promocion) {
                          return ListTile(
                            title: Text('Título: ${promocion['titulo']}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Descripción: ${promocion['descripcion']}'),
                                Text(
                                    'Código de descuento: ${promocion['codigo_descuento']}'),
                                
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              text: 'Promociones',
            ),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final String text;

  const Button({
    Key? key,
    required this.icon,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(icon),
      
      // child: Column(
      //   children: [
      //     Icon(icon),
      //     Text(text),
      //   ],
      // ),
    );
  }
}
