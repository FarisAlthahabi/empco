

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldToProfile2 extends StatelessWidget {
  String? labletitle;
  double width;
  double height;
  TextFormFieldToProfile2(
      {super.key, this.labletitle, required this.width, required this.height});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.top,
        // textAlign: TextAlignVertical.top,
        maxLines: null,
        expands: true,
        keyboardType: TextInputType.multiline,
        obscureText: false,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xff898181))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFF152B4B))),
            hintText: labletitle),
      ),
    );
  }
}
