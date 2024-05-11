import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const Page1());
}

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
  
}

class _Page1State extends State<Page1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;  
    

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Color.fromARGB(255, 253, 173, 1),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

 @override
Widget build(BuildContext context) {
  return MaterialApp(
    home: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: const [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.map)),
              Tab(icon: Icon(Icons.phone)),
            ],
          ),
          title: const Text('Autolote'),
        ),
        body: AnimatedBuilder(
          animation: _colorAnimation,
          builder: (context, child) {
            return TabBarView(
              children: [
                _buildPageContent(Colors.red), // Pestaña 1
                Container(                  
                  child: Image.asset(
                    'lib/imagenes/ubicacion.jpg', // Imagen para la pestaña 2
                    fit: BoxFit.cover,
                  ),
                ),
                // Pestaña 3
                AnimatedContainer(                  
                  padding: EdgeInsets.all(20.0),                  
                  duration: Duration(seconds: 1), // Duración de la animación
                  color: _colorAnimation.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contáctanos',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('+1234567890'),
                        onTap: () {
                          _launchURL('tel:+1234567890');
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text('correo@example.com'),
                        onTap: () {
                          _launchURL('mailto:correo@example.com');
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text('Calle 356, los manzanos, Honduras'),
                        onTap: () {
                            _launchURL('https://maps.google.com/maps?q=15.50547231641084,-88.03050229582634');

                        },
                      ),
                      // Agrega más elementos según sea necesario
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ),
  );
}
 Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir $url';
    }
  }

  Widget _buildPageContent(Color backgroundColor) {
    return Container(
      color: _colorAnimation.value,
      child: Column(
        children: [
          _buildCarInfoRow(false, 'Tesla', 'Tesla', 'Model S', '2022', 'Rojo'),
          _buildCarInfoRow(true, 'lamborghini', 'lamborghini', 'Murcielago', '2019', 'Negro'), 
          _buildCarInfoRow(false, 'bugatti', 'bugatti', 'Veyron SS', '2020', 'Negro'),
        ],
      ),
    );    
  } 

  Widget _buildCarInfoRow(bool reverse, String imageAsset, String marca, String modelo, String ano, String color) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: reverse
            ? [
                // Foto del vehículo
                Container(
                  width: 200, 
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage('lib/imagenes/$imageAsset.gif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 20), 
                // Información del vehículo
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Información',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('Marca: $marca'),
                      Text('Modelo: $modelo'),
                      Text('Año: $ano'),
                      Text('Color: $color'),
                    ],
                  ),
                ),
              ]
            : [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Información',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('Marca: $marca'),
                      Text('Modelo: $modelo'),
                      Text('Año: $ano'),
                      Text('Color: $color'),
                    ],
                  ),
                ),
                const SizedBox(width: 25), 
                // Foto del vehículo
                Container(
                  width: 200,
                  height: 150, 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage('lib/imagenes/$imageAsset.gif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
      ),
    );
  }
}




