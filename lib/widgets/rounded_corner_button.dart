import 'package:flutter/material.dart';
import 'package:musicalNoteBook/Resources/text_style.dart';

class RoundedCornerButton extends StatelessWidget {
  const RoundedCornerButton({
    Key? key,
    required this.onPressed,
    this.child,
    this.width,
    this.height,
    this.text,
    this.textColor,
  }) : super(key: key);

  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Widget? child;
  final String? text;
  final Color? textColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width??double.maxFinite,height: height,
      child: ElevatedButton(
          onPressed: onPressed,

          child: child??Text(text??"", style: TextStyle(color: textColor??Colors.white,letterSpacing: 1, fontSize: Dimensions.FONT_SIZE_22),textAlign: TextAlign.center,)
      ),
    );
  }
}