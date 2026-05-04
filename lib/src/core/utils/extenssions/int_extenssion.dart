import 'package:flutter/material.dart';

extension SizedBoxExtensions on int {
  Widget get verticalSpace => SizedBox(height: toDouble());
  Widget get horizontalSpace => SizedBox(width: toDouble());
}
extension PriceFormatter on num {
  String formatNumbers({String suffix = ''}) {
    final parts = toString().split('.');

    // format integer part
    final integerPart = parts[0]
        .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => ',');

    // handle decimal part (optional)
    if (parts.length > 1 && int.parse(parts[1]) != 0) {
      return '$integerPart.${parts[1]}$suffix';
    }

    return '$integerPart$suffix';
  }
}
extension PriceExt on num {
  String toCurrency({bool withSymbol = true}) {
    /// keep up to 2 decimals
    String value = toStringAsFixed(2);

    /// 🔥 remove trailing zeros
    value = value.replaceAll(RegExp(r'\.?0+$'), '');

    /// split again after cleaning
    final parts = value.split('.');

    /// format integer part with commas
    final integer = parts[0].replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (_) => ',',
    );

    /// return with or without decimal
    final formatted =
        parts.length > 1 ? '$integer.${parts[1]}' : integer;

    /// 🔥 append currency
    return withSymbol ? '$formatted QAR' : formatted;  }
}