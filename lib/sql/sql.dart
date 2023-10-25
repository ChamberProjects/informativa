import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:informativa/models/models.dart';


class LoginDatabase{
  
  final batabaseName = 'logdatabase.db';
  String userTable = "create table users (usrId integer primary key autoincrement, usrName Text, usrPass Text, usrEmail Text, usrNamePerson)";
  String userData = "insert into users values(1, 'admin', '12345', 'prueba@prueba.com', 'Nombre')";

  Future<Database> initDB() async {
    
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, batabaseName); 
    return await openDatabase(path, version: 1, onCreate: (db,version)async{

      await db.execute(userTable);
      await db.execute(userData);

    });
}

Future <bool> authentication(Users users)async{
   final Database db = await initDB();
   var result = await db.rawQuery("select * from users where usrName = '${users.usrName}' and usrPass = '${users.usrPass}'");
    if(result.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }
  
  Future<int> createUsers(Users users)async{
  final db = await initDB();
  var result = db.insert('users', users.toMap());
  return result;
  }
}