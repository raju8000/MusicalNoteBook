import 'package:flutter/cupertino.dart';

extension WidgetGap on num {
  Widget get height => SizedBox(height: this.toDouble());
}