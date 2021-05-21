import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pip_mvp_flutter/res/text_style.dart';

class ItemContactInfo extends StatelessWidget {
  final String name;
  final String info;
  final IconData icon;

  const ItemContactInfo({
    required this.name,
    required this.info,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 72,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 14),
                  Text(
                    name,
                    style: textRegular14Grey,
                  ),
                  Text(
                    info,
                    style: textRegular18,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(width: 20),
          ],
        ),
      );
}
