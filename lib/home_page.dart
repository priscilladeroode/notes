import 'package:flutter/material.dart';
import 'package:notes/widgets/custom_app_bar.dart';
import 'package:notes/widgets/note_item.dart';
import 'package:notes/widgets/primary_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>["Primeiro item"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notes',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryButton(
              label: '+ Adicionar',
              onPressed: () async {
                final description =
                    await Navigator.pushNamed(context, "/create-note");
                if (description != null) {
                  notes.add(description as String);
                  setState(() {});
                }
              },
            ),
            for (var i = 0; i < notes.length; i++)
              NoteItem(
                note: notes[i],
                onTap: () async {
                  final response = await Navigator.pushNamed(
                      context, "/create-note",
                      arguments: notes[i]);
                  if (response != null) {
                    var description = response as String;
                    if (response.isEmpty) {
                      notes.removeAt(i);
                    } else {
                      notes[i] = description;
                    }
                    setState(() {});
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
