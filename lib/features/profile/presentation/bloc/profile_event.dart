// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';

@immutable
sealed class ProfileEvent {}

class ProfileUpdate extends ProfileEvent {
  final File? file;
  final String fname;
  final String lname;
  final String phone;
  final String address;
  final String? aboutYou;
  ProfileUpdate({
    this.file,
    required this.fname,
    required this.lname,
    required this.address,
    required this.phone,
    this.aboutYou,
  });
}

class ProfileFetch extends ProfileEvent {
  final int? id;
  ProfileFetch({
    this.id,
  });
}
