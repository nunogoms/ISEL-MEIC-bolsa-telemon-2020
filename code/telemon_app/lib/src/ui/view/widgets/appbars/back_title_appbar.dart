import 'package:flutter/material.dart';

class BackTitleAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const BackTitleAppbar(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(),
      title: Text(this.title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize =>  Size.fromHeight(60.0);
}