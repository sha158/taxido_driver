import 'package:flutter/material.dart';

class RatingtabScreen extends StatefulWidget {
  const RatingtabScreen({super.key});

  @override
  State<RatingtabScreen> createState() => _RatingtabScreenState();
}

class _RatingtabScreenState extends State<RatingtabScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Rating screen'),
    );
  }
}