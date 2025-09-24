import 'package:empco/Core/Theme/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodeTextField extends StatelessWidget {
  const CodeTextField({
    super.key,
    required this.verificationCode,
    required this.focusNode,
    required this.onChange,
  });

  final TextEditingController verificationCode;
  final FocusNode focusNode;
  final ValueSetter<String> onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 43,
      height: 41,
      color: AppColors.textFieldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
        child: TextFormField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          onChanged: onChange,
          keyboardType: TextInputType.number,
          focusNode: focusNode,
          controller: verificationCode,
          decoration: const InputDecoration(),
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
        ),
      ),
    );
  }
}
