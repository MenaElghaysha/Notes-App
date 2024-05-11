
import 'package:flutter/material.dart';

import '../sqldb.dart';
import 'home.dart';

class AddNotes extends StatefulWidget {
  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  SqlDb sqldb = SqlDb();

  GlobalKey<FormState> formstate = GlobalKey();

  TextEditingController note = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController colour = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Notes"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Form(
              key: formstate,
              child: Column(
                children: [
                  TextFormField(
                    controller: note,
                    decoration: const InputDecoration(
                      hintText: 'note',
                    ),
                  ),
                  TextFormField(
                    controller: title,
                    decoration: const InputDecoration(
                      hintText: 'title',
                    ),
                  ),
                  const SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () async {
                      int response = await sqldb.insert('notes',
                          {'note'   :  note.text,
                        'title'  :  title.text,}
                      );

                      if (response> 0) {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:( context)=>Home()), (route) => false);
                      }

                      print('response====================');
                      print(response);
                      print("notes = ${note.text}, title = ${title.text}");
                    },
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text("Add note"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
