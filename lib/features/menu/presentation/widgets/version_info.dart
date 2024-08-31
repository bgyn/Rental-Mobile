import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rentpal/core/extension/extension.dart';

class VersionText extends StatefulWidget {
  const VersionText({super.key});

  @override
  State<VersionText> createState() => _VersionTextState();
}

class _VersionTextState extends State<VersionText> {
  String versionInfo = '';
  String platform = Platform.isAndroid ? "Android" : "Ios";

  @override
  void initState() {
    super.initState();
    _getVersionInfo();
  }

  Future<void> _getVersionInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    log(packageInfo.toString());
    setState(() {
      versionInfo =
          'Version ${packageInfo.version}.${packageInfo.buildNumber}p - $platform';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          versionInfo.isNotEmpty ? versionInfo : 'Loading version...',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey.shade700,
          ),
        ),
        Icon(
          Icons.gps_fixed,
          size: 0.018.toRes(context),
          color: Colors.blue,
        )
      ],
    );
  }
}
