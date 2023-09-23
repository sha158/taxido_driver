import 'package:flutter/material.dart';



class CarInfo extends StatefulWidget {
  const CarInfo({super.key});

  @override
  State<CarInfo> createState() => _CarInfoState();
}

class _CarInfoState extends State<CarInfo> {
  TextEditingController carnamecontroller = TextEditingController();
  TextEditingController carnumberController = TextEditingController();
  TextEditingController carcolorController = TextEditingController();

  String dropdownValue = 'Car';
  @override
  Widget build(BuildContext context) {
    return Material(
      child:  Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/lojo.png')),
            Text('Register as Driver'),
            TextField(
              controller: carnamecontroller,
              decoration: InputDecoration(label: Text('name')),
            ),
            TextField(
              controller: carnumberController,
              decoration: InputDecoration(label: Text('phone')),
            ),
            TextField(
              controller: carcolorController,
              decoration: InputDecoration(label: Text('mail')),
            ),
            DropdownButton<String>(
  value: dropdownValue,
  items: <String>['Car', 'Bike', 'Bus', 'Lorry']
      .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(
        value,
        style: TextStyle(fontSize: 30),
      ),
    );
  }).toList(),
  // Step 5.
  onChanged: (String? newValue) {
    setState(() {
      dropdownValue = newValue!;
    });
  },
),

            ElevatedButton(
                onPressed: () {},
                child: Text(
                  'save now',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 61, 100, 63))),
          ],
        ),
      ),
    );
  }
}