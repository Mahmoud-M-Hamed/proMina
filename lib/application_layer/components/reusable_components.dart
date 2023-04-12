import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/themes/colors.dart';

extension EmptySpace on num {
  SizedBox get ph => SizedBox(
    height: toDouble(),
  );

  SizedBox get pw => SizedBox(
    width: toDouble(),
  );
}

Widget rTextField({
  TextEditingController? textEditingController,
  FormFieldValidator<String>? validator,
  TextInputType? keyboardType = TextInputType.emailAddress,
  bool obscureText = false,
  bool filled = true,
  bool readOnly = false,
  Color fillColor = Colors.white60,
  String? hintText,
  List<TextInputFormatter>? inputFormatters,
  double contentPaddingHorizontal = 15,
  double contentPaddingVertical = 12,
  double topLeft = 20,
  double topRight = 20,
  double bottomLeft = 20,
  double bottomRight = 20,
}) =>
    TextFormField(
      inputFormatters: inputFormatters,
      controller: textEditingController,
      validator: validator,
      keyboardType: keyboardType,
      readOnly: readOnly,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: contentPaddingHorizontal,
            vertical: contentPaddingVertical),
        filled: filled,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 13,),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            topRight: Radius.circular(topRight),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight),
          ),
        ),
      ),
    );


Widget rMaterialButton({
  required VoidCallback? onPressed,
  required Widget? child,
  VoidCallback? onLongPress,
  double? height,
  Color? color,
  Color? splashColor = ColorsTheme.kAppMainColor,
  double? radius = 15,
  double? horizontal = 5,
  double? vertical = 5,
  double? elevation = 5,
}) =>
    MaterialButton(
      onPressed: onPressed,
      height: height,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius!),
      ),
      padding:
          EdgeInsets.symmetric(horizontal: horizontal!, vertical: vertical!),
      splashColor: splashColor,
      elevation: elevation,
      onLongPress: onLongPress,
      child: child,
    );
