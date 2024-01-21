import 'package:flutter/material.dart';
import 'package:messenger_ui/features/chat/design_dimens.dart';

class CircleProfile extends StatelessWidget {
  final LinearGradient color;
  final String title;
  const CircleProfile({
    super.key, required this.color, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 50,
      decoration: ShapeDecoration(
        gradient: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignDimens.giantRadius),
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      ),
    );
  }
}