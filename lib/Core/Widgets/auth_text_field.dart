import 'package:empco/Core/Theme/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:empco/Core/Resources/Constants/font_weights.dart';


class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    this.isPassword = false,
    required this.title,
    this.height,
    required this.prefixIcon,
    this.suffixIcon,
    this.onSubmitted,
    this.onChanged,
    this.focusNode,
  });

  final bool isPassword;
  final String title;
  final double? height;
  final Icon prefixIcon;
  final Icon? suffixIcon;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late bool isObscure = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
              color: AppColors.textFieldTitleColor,
              fontSize: 11.06,
              fontWeight: weightlevel7),
          textAlign: TextAlign.center,
        ),
        Center(
          child: Container(
            height: 39,
            decoration: const BoxDecoration(
              color: AppColors.textFieldBackgroundColor,
            ),
            child: TextField(
              focusNode: widget.focusNode,
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              obscureText: isObscure,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: widget.prefixIcon,
                prefixIconColor: AppColors.iconColor,
                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: () {
                          setState(
                            () {
                              isObscure = !isObscure;
                            },
                          );
                        },
                        icon: Icon(
                         isObscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                          ),
                      )
                    : widget.suffixIcon,
                suffixIconColor: AppColors.iconColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
