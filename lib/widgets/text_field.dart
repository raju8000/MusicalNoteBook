import 'package:flutter/material.dart';
import 'package:musicalNoteBook/Resources/text_style.dart';

typedef OnChanged = void Function(String value);

class SimpleTextFormField extends StatefulWidget {
  SimpleTextFormField(
      {Key? key,
        @required TextEditingController? textController,
        this.hintText = "",
        this.labelStyle,
        this.style,
        this.maxLine = 1,
        this.onChanged,
        this.textInputAction = TextInputAction.done,
        this.keyboardType = TextInputType.visiblePassword,
       })
      : _textController = textController,
        super(key: key);

  final TextEditingController? _textController;
  final String? hintText;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final int maxLine;
  final OnChanged? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;


  @override
  SimpleTextFormFieldState createState() => SimpleTextFormFieldState();
}

class SimpleTextFormFieldState extends State<SimpleTextFormField> {


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      controller: widget._textController,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLine,
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      style: TextStyle(fontSize: Dimensions.FONT_SIZE_20),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
          hintText: widget.hintText??"",
          errorBorder: InputBorder.none,
      ),
    );
  }

}
