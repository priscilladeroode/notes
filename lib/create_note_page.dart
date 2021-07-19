import 'package:flutter/material.dart';
import 'package:notes/widgets/custom_app_bar.dart';
import 'package:notes/widgets/primary_button.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({Key? key}) : super(key: key);

  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  var description = "";
  var textController = TextEditingController();
  var isEdit = false;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        description = ModalRoute.of(context)!.settings.arguments as String;
        textController.text = description;
        isEdit = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: isEdit ? "Edit Note" : "Create Note",
        actions: [
          if (isEdit)
            IconButton(
              onPressed: () {
                Navigator.pop(context, "");
              },
              icon: Icon(Icons.delete),
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              maxLines: null,
              onChanged: (value) {
                description = value;
                setState(() {});
              },
              decoration: InputDecoration(
                labelText: "Descrição",
              ),
            ),
            SizedBox(height: 32),
            if (description.isNotEmpty)
              PrimaryButton(
                label: 'Salvar',
                onPressed: () {
                  Navigator.pop(context, description);
                },
              ),
          ],
        ),
      ),
    );
  }
}
