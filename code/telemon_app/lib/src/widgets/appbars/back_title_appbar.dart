import 'package:flutter/material.dart';

class BackTitleAppbar extends StatelessWidget {
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
}