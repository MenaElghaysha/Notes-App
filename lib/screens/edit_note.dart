
import 'package:flutter/material.dart';

import '../sqldb.dart';
import 'home.dart';

class EditNotes extends StatefulWidget {
  final note;
  final title;
  final id;
  // final colour;
  const EditNotes({Key ?key, this.note, this.title, this.id}):super(key: key);

  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  SqlDb sqldb = SqlDb();

  GlobalKey<FormState> formstate = GlobalKey();

  TextEditingController note = TextEditingController();
  TextEditingController title = TextEditingController();
  // TextEditingController colour = TextEditingController();

  @override
  void initState(){
    note.text=widget.note;
    title.text=widget.note;
    // colour.text=widget.note;
    super.initState();
  }


  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Notes"),
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
                    decoration: InputDecoration(
                      hintText: 'note',
                    ),
                  ),
                  TextFormField(
                    controller: title,
                    decoration: InputDecoration(
                      hintText: 'title',
                    ),
                  ),
                  SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () async {
                      int response = await sqldb.update('notes', {
                        'note'   : "${note.text}",
                        'title'  :  "${title.text}",
                      },
                        'id=${widget.id}');
                      if (response > 0) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => Home()),
                              (route) => false,
                        );
                      }

                      print('response====================');
                      print(response);
                    },
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text("Edit note"),
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
