import 'package:flutter/material.dart';

class Ricon extends StatelessWidget {
  final IconData? icon;
  final double? size;

  final Color? color;

  const Ricon({Key? key, this.icon, this.size = 22, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    
       child: Icon(
        icon,
        size: double.parse(size.toString()),
        color: color ?? Theme.of(context).iconTheme.color,
      ),
    );
  }
}
