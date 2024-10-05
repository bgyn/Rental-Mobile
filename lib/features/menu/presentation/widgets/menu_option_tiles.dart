import 'package:flutter/material.dart';
import 'package:rentpal/core/extension/extension.dart';

class MenuOptionTiles extends StatelessWidget {
  const MenuOptionTiles(
      {super.key, required this.icon, required this.title, this.onTap});

  final IconData icon;
  final String title;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Column(
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
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 0.014.toRes(context),
                      ),
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
