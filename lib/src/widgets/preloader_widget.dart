import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ravi_launcher/src/constants/color_constant.dart';

class PreloaderWidget extends StatelessWidget {
const PreloaderWidget({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: LoadingAnimationWidget.dotsTriangle(
        color: primaryTextColor,
        size: 100
      ),
    );
  }
}