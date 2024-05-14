import 'dart:async';
import 'package:flutter/material.dart';
import 'package:reloj_mundial/app_data.dart';

class WorldClockPage extends StatefulWidget {
  @override
  _WorldClockPageState createState() => _WorldClockPageState();
}

class _WorldClockPageState extends State<WorldClockPage> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {}); // Actualizar el estado cada segundo
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Detener el temporizador al cerrar el widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 3, 3),
        title: Text('World Clock'),
        leading: Builder(
          // Usar Builder aquí
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Abrir el menú lateral
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0), // Eliminar el relleno interno
              child: Container(
                color: Colors.black,
                padding: EdgeInsets.only(
                    top: 16.0,
                    left: 16.0), // Ajustar el relleno superior e izquierdo
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white, // Cambiar el color del texto a blanco
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Clock'),
              onTap: () {
                Navigator.pop(context); // Cerrar el menú
                Navigator.pushNamed(context, '/clock');
              },
            ),
            ListTile(
              title: Text('Stopwatch'),
              onTap: () {
                Navigator.pop(context); // Cerrar el menú
                Navigator.pushNamed(context, '/stopwatch');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.black,
                );
              },
              itemCount: AppData.locations.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    AppData.getLocationName(AppData.locations[index]),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  trailing: FutureBuilder(
                    future: AppData.getTime(AppData.locations[index]),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        return Text(
                          snapshot.data ?? 'Error',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
