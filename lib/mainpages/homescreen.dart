import 'package:flutter/material.dart';

class HometabScreen extends StatefulWidget {
  const HometabScreen({super.key});

  @override
  State<HometabScreen> createState() => _HometabScreenState();
}

class _HometabScreenState extends State<HometabScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home screen'),
    );
  }
}