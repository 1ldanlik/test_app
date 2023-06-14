import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final Widget icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(onPressed: onPressed, icon: icon),
    );
  }
}
