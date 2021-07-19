import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  final String note;
  final Function() onTap;
  const NoteItem({
    Key? key,
    required this.note,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(note),
        onTap: onTap,
      ),
    );
  }
}
