import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb{
  static Database? _db;
  Future<Database?> get db async{
    if(_db == null){
      _db = await intialDb();
      return _db;
    }else    return _db;
  }
  intialDb() async{
    String databasepath = await getDatabasesPath();
    String path= join(databasepath,'mena.db');     // databasepath/mena.db
    Database mydb =await openDatabase(path,
        onCreate: _onCreate,version:1 ,onUpgrade: _onUpgrade);
    return mydb;

  }

  _onUpgrade(Database db , int old_version , int new_version)    {
    print("onUpgrade-------");
    // await db.execute("ALTER TABLE notes ADD COLUMN colour TEXT");
  }

  _onCreate(Database db , int version)async{
    await db.execute('''
        CREATE TABLE "notes" (
          "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          "title" TEXT NOT NULL ,
          "note" TEXT NOT NULL )
        ''');
    // await db.execute(
    //     'CREATE TABLE notes ('
    //         'id INTEGER PRIMARY KEY,'
    //         ' nate TEXT NOT NULL,'
    //         ' title TEXT NOT NULL )'
    // );
    print("onCreate************************ ");
  }
  read(String table) async{
    Database? mydb = await db;
    List<Map> response = await mydb!.query(table);
    return response;
  }

  insert(String table, Map<String,Object?> values) async{
    Database? mydb = await db;
    int response = await mydb!.insert(table,values);
    return response;
  }

  update(String table, Map<String,Object?> values ,String mywhere) async{
    Database? mydb = await db;
    int response = await mydb!.update(table,values,where: mywhere);
    return response;
  }

  delete(String table , String? mywhere) async{
    Database? mydb = await db;
    int response = await mydb!.delete(table , where:mywhere );
    return response;
  }
// mydeleteDatabase()async{
//   String databasepath = await getDatabasesPath();
//   String path = join(databasepath ,'mena.db');
//   await deleteDatabase(path);
// }

}

