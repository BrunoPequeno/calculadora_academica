import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Acadêmica',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController p1Controller = TextEditingController();
  TextEditingController p2Controller = TextEditingController();
  TextEditingController p3Controller = TextEditingController();
  TextEditingController p4Controller = TextEditingController();
  TextEditingController tr1Controller = TextEditingController();
  TextEditingController tr2Controller = TextEditingController();
  TextEditingController tr3Controller = TextEditingController();

  double calculateAverage() {
    List<double> grades = [];
    if (p1Controller.text.isNotEmpty) grades.add(double.parse(p1Controller.text));
    if (p2Controller.text.isNotEmpty) grades.add(double.parse(p2Controller.text));
    if (p3Controller.text.isNotEmpty) grades.add(double.parse(p3Controller.text));
    if (p4Controller.text.isNotEmpty) grades.add(double.parse(p4Controller.text));
    if (tr1Controller.text.isNotEmpty) grades.add(double.parse(tr1Controller.text));
    if (tr2Controller.text.isNotEmpty) grades.add(double.parse(tr2Controller.text));
    if (tr3Controller.text.isNotEmpty) grades.add(double.parse(tr3Controller.text));

    if (grades.isEmpty) {
      return 0.0;
    } else {
      double total = 0;
      for (double grade in grades) {
        total += grade;
      }
      return total / grades.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Acadêmica'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            Center(
              child: Text(
                'Nome: Bruno Pequeno',
                style: TextStyle(fontSize: 12, fontFamily: 'Tahoma'),
              ),
            ),
            Center(
              child: Text(
                'RA: 1431432312033',
                style: TextStyle(fontSize: 12, fontFamily: 'Tahoma'),
              ),
            ),
            SizedBox(height: 15),
            _buildSmallTextField(p1Controller, 'P1'),
            _buildSmallTextField(p2Controller, 'P2'),
            _buildSmallTextField(p3Controller, 'P3'),
            _buildSmallTextField(p4Controller, 'P4'),
            _buildSmallTextField(tr1Controller, 'TR1'),
            _buildSmallTextField(tr2Controller, 'TR2'),
            _buildSmallTextField(tr3Controller, 'TR3'),
            SizedBox(height: 15),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  double average = calculateAverage();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Resultado'),
                        content: Text('A média final é: ${average.toStringAsFixed(2)}'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Fechar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Calcular Média'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 14, fontFamily: 'Tahoma'), 
      ),
    );
  }
}