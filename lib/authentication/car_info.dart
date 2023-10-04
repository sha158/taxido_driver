import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxido/constants/colors.dart';

class CarInfo extends StatefulWidget {
  const CarInfo({super.key});

  @override
  State<CarInfo> createState() => _CarInfoState();
}

class _CarInfoState extends State<CarInfo> {
  String? selectedCarModel;
  TextEditingController carnamecontroller = TextEditingController();
  TextEditingController carnumberController = TextEditingController();
  TextEditingController carcolorController = TextEditingController();

  String dropdownValue = 'Car';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kGreen,
      body: SafeArea(
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Upper Container with Rounded Top Corners
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                color: kGreen,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Car Details",
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 40),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Enter Car Details",
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 24),
                      )
                    ],
                  ),
                ),
                // Add additional content in the lower container if needed
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(46, 204, 113, 0.3),
                                  offset: Offset(0, 10),
                                  blurRadius: 20)
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200))),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Car Model",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200))),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Car Name",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200))),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Car Colour",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        DropdownButton<String>(
                          value: selectedCarModel,
                          hint: Text('Choose the car model'),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCarModel = newValue;
                            });
                          },
                          items: <String>['Uber X', 'Uber Go', 'Bike']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: ElevatedButton(
                            onPressed: () {
                              // Add your login logic here
                            },
                            style: ElevatedButton.styleFrom(
                              primary: kGreen, // Background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Rounded corners
                              ),
                            ),
                            child: Text(
                              'proceed',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              // Lower Container in Green
            ],
          ),
        ]),
      ),
    );
  }
}
