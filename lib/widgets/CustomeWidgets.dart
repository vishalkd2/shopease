import 'package:flutter/material.dart';

class CustomeWidgets {
  static customeTextField({
    required String labelName,
    TextEditingController? controller,
    Widget? prefixIcon,
    Widget? sufixIcon,
    VoidCallback? onSuffixIconTap,
    TextInputType keyboardType = TextInputType.text,
    int? maxLines,
    int? minLines,
    int? maxLength,
    bool obsecureText = false,
    String? Function(String?)?
        validator, //A function that validates the input entered by the user. It can return an error message if the input is invalid, or null if it's valid. It’s optional.
    Function(String?)? onSaved,
  }) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        obscureText: obsecureText,
        decoration: InputDecoration(
            labelText: labelName,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            fillColor: Colors.white.withOpacity(0.7),
            filled: true,
            prefixIcon: prefixIcon,
            suffixIcon: sufixIcon != null
                ? GestureDetector(
                    onTap: onSuffixIconTap,
                    child: sufixIcon,
                  )
                : null),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }

  static customeButtom(
      {String? buttonName,
      Color? backgroundColor = Colors.cyan,
      double? fontSize,
      double borderRadius = 30.0,
      VoidCallback? onPressed}) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        child: Text(
          buttonName!,
          style: TextStyle(
              fontSize: fontSize,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ));
  }
}
