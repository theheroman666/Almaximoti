import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{

  const HomeScreen({Key? key}): super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int item = 0;
  void incrementar(){
    setState(() => item++);
  }
  void restablecer(){
    setState(() => item = 0);
  }
  void decremento(){
    setState(() => item--);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextStyle fontsize = const TextStyle(fontSize: 40);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Center(
         child:  Text("AlmaximoTI"),
        ),
        elevation: 0,
      ),
      body:Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("logo.png"),
            fit: BoxFit.contain,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("El numero de clicks es:\n\n\n"
                , style: fontsize),
            Text('$item', style: const TextStyle(
              color: Color.fromRGBO(243, 33, 51, 1.0),
              fontSize: 75,
              backgroundColor: Colors.white,
            )),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BotonesFlotantes(
          incrementarFn: incrementar,
        decrementarFn: decremento,
        restablecerFn: restablecer,
      ),
    );
  }
}

class BotonesFlotantes extends StatelessWidget {

  final Function incrementarFn;
  final Function restablecerFn;
  final Function decrementarFn;

  const BotonesFlotantes({
    Key? key,
    required this.incrementarFn,
    required this.restablecerFn,
    required this.decrementarFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () => decrementarFn(),
          child: const Icon(Icons.exposure_minus_1_outlined),
        ),

        // const SizedBox(width: 20),
        FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () => restablecerFn(),
          child: const Icon(Icons.restart_alt_sharp),
        ),

        //const SizedBox(width: 20),
        FloatingActionButton(
          backgroundColor: Colors.indigo,
          onPressed: ()=>incrementarFn(),
          child: const Icon(Icons.exposure_plus_1_outlined),
        ),
      ],
    );
  }
}