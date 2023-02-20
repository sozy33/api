import 'package:flutter/material.dart';

import 'icon.dart';

class MyTile extends StatelessWidget {
  final IconData icon;
  final String value;
  const MyTile({super.key, this.value = "Ttitle", this.icon = Icons.home});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Ricon(
          icon: icon,
          size: 30,
          color: Colors.black,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
