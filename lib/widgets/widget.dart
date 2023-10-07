import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
                  child: Positioned.fill(
                      child: Container(
                  color: Colors.black.withOpacity(0.4),
                  child: Center(
                      child: LoadingAnimationWidget.inkDrop(
                          color: Colors.white, size: 70)),
                )));
  }
}