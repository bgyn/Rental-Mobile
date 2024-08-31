import 'package:flutter/material.dart';
import 'package:rentpal/core/extension/extension.dart';

class MenuOptionTiles extends StatelessWidget {
  const MenuOptionTiles({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 0.06.h(context),
          child: Row(
            children: [
              Icon(
                icon,
                size: 0.02.toRes(context),
              ),
              SizedBox(
                width: 0.07.w(context),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 0.016.toRes(context),
                ),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
