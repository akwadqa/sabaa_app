// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// class LocaleAdapter extends TypeAdapter<Locale> {
//   @override
//   final int typeId = 101; // Ensure this typeId is unique across your app.

//   @override
//   Locale read(BinaryReader reader) {
//     final languageCode = reader.readString();
//     final countryCode = reader.readString();
//     return Locale(languageCode, countryCode.isEmpty ? null : countryCode);
//   }

//   @override
//   void write(BinaryWriter writer, Locale obj) {
//     writer.writeString(obj.languageCode);
//     writer.writeString(obj.countryCode ?? '');
//   }
// }
