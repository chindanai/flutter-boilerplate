import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/common/widgets/rounded_button.dart';

class RedRoundedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final bool active;

  const RedRoundedButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.active = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      onPressed: onPressed,
      title: title,
      active: active,
      activeColors: [
        Theme.of(context).primaryColor,
        Theme.of(context).highlightColor,
      ],
    );
  }
}
