import 'package:flutter/material.dart';

class CustomerAction {
  const CustomerAction({
    required this.labelKey,
    required this.icon,
    required this.onTap,
    this.isPrimary = false,
  });

  final String       labelKey;
  final IconData     icon;
  final VoidCallback onTap;
  final bool         isPrimary;
}