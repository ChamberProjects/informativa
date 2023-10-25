import 'package:flutter/material.dart';
import 'package:informativa/login/login.dart';
import 'package:informativa/models/models.dart';
import 'package:informativa/sql/sql.dart';

class RegistrarScreen extends StatefulWidget {
  const RegistrarScreen({super.key});

@override
State<RegistrarScreen> createState() => _RegistrarScreenState();

}


class _RegistrarScreenState extends State<RegistrarScreen> {

@override
Widget build(BuildContext context){
  return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              _FormField(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FormField extends StatefulWidget {
  const _FormField();

  @override
  State<_FormField> createState() => _FormFieldState();
}

class _FormFieldState extends State<_FormField> {

  final _key = GlobalKey<FormState>();
  final usrName = TextEditingController();
  final usrNamePerson = TextEditingController();
  final usrPass = TextEditingController();
  final usrEmail = TextEditingController();
  final db = LoginDatabase();

  createUsers() {
    final db = LoginDatabase();
    var result = db.createUsers(Users(
        usrName: usrName.text,
        usrPass: usrPass.text,
        usrEmail: usrEmail.text));
    if (result != 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    } else {
    }
  }

 @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        //logo
        const Padding(
           padding: EdgeInsets.symmetric(vertical: 23)
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('ingresar usuario', style: TextStyle(fontSize: 15)),
            ],
          ),
        ),
          SizedBox(
            width: 350,
          child: TextFormField(
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10)
                )
              ),
              errorStyle: TextStyle(
                fontSize: 10,
                ),
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.person_2_outlined, size: 15, color: Colors.black,),
                ),
              hintText: ' Usuario',
              hintStyle: TextStyle(fontSize: 15, color: Colors.black)
            ),
              controller: usrName,
               style: const TextStyle(fontSize: 15),
               validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresar Usuario';
                }
                return null;
              },
            ),
          ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('ingresar nombre usuario', style: TextStyle(fontSize: 15)),
            ],
          ),
        ),
        SizedBox(
         width: 350,
          child: TextFormField(
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10)
                )
              ),
              errorStyle: TextStyle(
                fontSize: 10,
                ),
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(Icons.person_2_outlined, size: 15, color: Colors.black,),
                ),
              hintText: ' Nombre de Usuario',
              hintStyle: TextStyle(fontSize: 15, color: Colors.black)
            ),
            controller: usrNamePerson,
            style: const TextStyle(fontSize: 15),
            validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nombre Usuario Incorrecto';
                }
                return null;
              },
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('ingresar correo', style: TextStyle(fontSize: 15)),
            ],
          ),
        ),
        SizedBox(
          width: 350,
          child: TextFormField(
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10)
                )
              ),
              errorStyle: TextStyle(
                fontSize: 10,
                ),
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(Icons.person_2_outlined, size: 15, color: Colors.black,),
                ),
              hintText: ' Correo',
              hintStyle: TextStyle(fontSize: 15, color: Colors.black)
            ),
            controller: usrEmail,
            style: const TextStyle(fontSize: 15),
            validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Correo Incorrecto';
                }
                return null;
              },
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('ingresar contraseña', style: TextStyle(fontSize: 15)),
            ],
          ),
        ),
        SizedBox(
          width: 350,
          height: 90,
          child: TextFormField(
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10)
                )
              ),
              errorStyle: TextStyle(
                fontSize: 10,
                ),
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.person_2_outlined, size: 15, color: Colors.black,),
                ),
              hintText: ' Contraseña',
              hintStyle: TextStyle(fontSize: 15, color: Colors.black)
            ),
            controller: usrPass,
            style: const TextStyle(fontSize: 15),
            validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Contraseña Incorrecto';
                }
                return null;
              },
          ),
        ),
        
        SizedBox(
          child: MaterialButton(
             minWidth: 350,
             height: 55,
              color:  Colors.black,
               shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)
                )
              ),
            onPressed: () {
                if (_key.currentState!.validate()) {
                        createUsers();       
                }
            },
            child: const Text('Registrar', style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
        )
        ],
      )
      );
  }
}
