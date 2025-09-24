import 'package:flutter/material.dart';

class MainErrorWidget extends StatelessWidget {
  const MainErrorWidget({
    super.key,
    required this.error,
    this.onTap,
    this.height,
  });

  final String error;
  final VoidCallback? onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
            if (onTap != null)
              TextButton(
                onPressed: onTap,
                child: const Text(
                  "try_again",
                 
                ),
              ),
          ],
        ),
      ),
    );
  }
}
