import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class SpeechController extends GetxController {
  Rx<FlutterTts> flutterTts = FlutterTts().obs;

  speak(text) async {
    await flutterTts.value.setLanguage("en-US");
    await flutterTts.value.setSpeechRate(0.55);
    await flutterTts.value.setPitch(1.0);
    await flutterTts.value.speak(text);
  }
}
