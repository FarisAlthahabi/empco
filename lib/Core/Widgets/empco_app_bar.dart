import 'package:flutter/material.dart';

class EmpcoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EmpcoAppBar({
    super.key,
    this.automaticallyImplyLeading = true,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
    this.onTap,
    this.height,
  });

  final VoidCallback? onTap;
  final bool automaticallyImplyLeading;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 3,
      shadowColor: Colors.black,
      toolbarHeight: kToolbarHeight,
      title: title,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: leading,
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize =>  Size.fromHeight(height ?? kToolbarHeight);
}
