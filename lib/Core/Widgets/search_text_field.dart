import 'package:empco/Core/Resources/Constants/Font_Weights.dart';
import 'package:empco/Core/Theme/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ScrollController textFieldScrollController = ScrollController();

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    required this.screenWidth,
    required this.searchJobController,
    required this.onChanged,
    required this.onSubmitted,
  });

  final double screenWidth;
  final TextEditingController searchJobController;
  final ValueSetter<String> onChanged;
  final ValueSetter<String> onSubmitted;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return
        TextFormField(
          // maxLines: 1,
          style: const TextStyle(
            fontSize: 13,
            height: 2.75,
          ),
          // cursorHeight: 15,
          onTap: () {},
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          controller: widget.searchJobController,
          decoration: InputDecoration(
            constraints: const BoxConstraints(maxHeight: 28),
            border:  const OutlineInputBorder(
              borderSide: BorderSide(width: 1 , color: AppColors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            prefixIcon: const Icon(Icons.search_rounded),
            prefixIconColor: const Color.fromRGBO(140, 135, 135, 1),
            hintText: 'Find a job',
            hintStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                  // height: 2.75,
                  color: const Color.fromRGBO(140, 135, 135, 1),
                  fontSize: 8.91,
                  fontWeight: weightlevel7),
            ),
          ),
        );
  }
}
