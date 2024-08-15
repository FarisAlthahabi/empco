import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTextField extends StatefulWidget {
  const MainTextField({
    super.key,
    required this.hintText,
    required this.focusNode,
    required this.onChanged,
    required this.onSubmitted,
    this.height,
    this.width,
  });

  final String hintText;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final double? height;
  final double? width;

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              strokeAlign: BorderSide.strokeAlignInside,
              color: const Color.fromRGBO(137, 129, 129, 1),
              width: 0.35)),
      child: TextField(
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        focusNode: widget.focusNode,
        decoration: InputDecoration(
            hintText: '      ${widget.hintText}',
            border: InputBorder.none,
            fillColor: const Color.fromRGBO(237, 237, 237, 0.11),
            // constraints: BoxConstraints(
            //   maxHeight: widget.height ?? 26,
            //   maxWidth: widget.width ?? 288,
            // ),
            hintStyle: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(121, 120, 120, 0.78),
                height: 1.13,
              ),
            )),
      ),
    );
  }
}
