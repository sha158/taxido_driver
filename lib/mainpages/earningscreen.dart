import 'package:flutter/material.dart';

class EarningsTabScreen extends StatefulWidget {
  const EarningsTabScreen({super.key});

  @override
  State<EarningsTabScreen> createState() => _EarningsTabScreenState();
}

class _EarningsTabScreenState extends State<EarningsTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Earnings"),
    );
  }
}