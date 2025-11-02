// lib/models/address.dart
import 'package:flutter/material.dart';

class Address {
  final String id;
  final String type;
  final String address;
  final IconData icon;
  bool isSelected;

  Address({
    required this.id,
    required this.type,
    required this.address,
    required this.icon,
    this.isSelected = false,
  });
}