import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sabaa/src/core/utils/constants/dotenv_keys.dart';

class ServicesUrls {
  static String prodBaseUrl = '';
  static String devBaseUrl = '';
  static String imageUrl = '';
  // static String mapApiKey = '';
  static void init() {
    prodBaseUrl = dotenv.get(DotenvKeys.prodBaseUrl);
    devBaseUrl = dotenv.get(DotenvKeys.devBaseUrl);
    imageUrl = dotenv.get(DotenvKeys.imageUrl);
    // mapApiKey = dotenv.get(DotenvKeys.mapApiKey);
    debugPrint('mnor $prodBaseUrl');
  }

}
