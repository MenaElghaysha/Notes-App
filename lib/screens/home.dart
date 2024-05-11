import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../sqldb.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // SqlDb sqlDb=SqlDb();
  // bool isLoading=true;
  // List notes=[];
  // DateTime today = DateTime.now();
  //
  // // Future<List<Map>>readData()async{
  // //   List<Map>response=await sqlDb.readData("SELECT*FROMnotes");
  // //   return response;
  // // }
  //
  //
  // Future readData()async{
  //   List<Map>response=await sqlDb.read("notes");
  //   notes.addAll(response);
  //   isLoading=false;
  //   if(this.mounted){
  //     setState((){
  //
  //     });
  // //   }
  // // }
  // void initState(){
  //   readData();
  //   super.initState();
  // }


  // void _onDaySelected(DateTime day,DateTime focusDay){
  //   setState(() {
  //     today=day;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasker",style: TextStyle(fontSize: 35)),
          elevation: 0),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushNamed("addnotes");
        },
      child: Icon(Icons.add),
      ),
      body:
      // isLoading==true?Center(child:Text("Loading..."),):
      Column(
        children: [
          // TableCalendar(
          //   locale: 'en_US',
          //   rowHeight: 43,
          //   headerStyle: HeaderStyle(
          //       formatButtonVisible: false,titleCentered: true),
          //   selectedDayPredicate: (day)=>isSameDay(day,today),
          //   firstDay: DateTime.utc(2010, 10, 16),
          //   lastDay: DateTime.utc(2030, 3, 14),
          //   focusedDay: today,
          //   onDaySelected: _onDaySelected,
          // ),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.blue,
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text: 'Hello ',
                  style: TextStyle(fontSize: 22,color: Colors.white),
                  children: const <TextSpan>[
                    TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' world!'),
                  ],
                ),


              ),
              trailing: Text("bgbfgb"),
            ),
          ),


          Expanded(
            child:  FutureBuilder(
              future: SqlDb().read(table),
              builder: (context ,snapshot ){
                return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,i){
                      return Card(
                        child: RadioListTile
                          (value: 'no',
                          groupValue: 'commit',
                          onChanged: (String? value) {
                            setState(() {
                            });
                          },
                          title: Text("${notes[i]['title']}"),
                          subtitle:Text("${notes[i]['note']}"),
                          //shape:UnderlineInputBorder(borderSide: BorderSide(color: Colors.white54)) ,
                          contentPadding:EdgeInsets.only(bottom: 20) ,
                          activeColor: Colors.blue,
                          selected: false,
                          toggleable: true,
                          visualDensity: VisualDensity(vertical: 2),

                        ),
                      );
                    });
              },
            )
          )
        ],
      )
    );
  }
}