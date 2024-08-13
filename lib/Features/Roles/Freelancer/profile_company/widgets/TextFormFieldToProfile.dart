import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldToProfile extends StatelessWidget {
  String? labletitle;
  double width;
  double height;

  TextFormFieldToProfile(
      {super.key,
       this.labletitle,
      required this.width,
      required this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextFormField(
        textAlign: TextAlign.start,
        maxLines: null,
        expands: true,
        keyboardType: TextInputType.multiline,
        obscureText: false,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Color(0xff898181))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Color(0xFF152B4B))),
            hintText: labletitle),
      ),
    );
  }
}
