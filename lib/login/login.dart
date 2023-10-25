import 'package:flutter/material.dart';
import 'package:informativa/home.dart';
import 'package:informativa/models/models.dart';
import 'package:informativa/register/register.dart';
import 'package:informativa/sql/sql.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

@override
State<LoginScreen> createState() => _LoginScreenState();

}


class _LoginScreenState extends State<LoginScreen> {

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
final usrPass = TextEditingController();

login() async {
    final db = LoginDatabase();
    var result = await db.authentication(
        Users(usrName: usrName.text, usrPass: usrPass.text));
    if (result) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>  HomeScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Usuario y contraseña incorrecto")));
    }
  }

@override
Widget build(BuildContext context) {
  return Form(
    key: _key,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget> [
         const Padding(
          padding: EdgeInsets.symmetric(vertical: 38)
        ),
        const SizedBox(
          child:  Text('Informativa', style: TextStyle(fontSize: 45, color: Colors.black),),
        ),
         const Padding(
          padding: EdgeInsets.symmetric(vertical: 3)
        ),
        //logo
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('ingresar usuario', style: TextStyle(fontSize: 20)),
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
                fontSize: 15,
                ),
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.person_2_outlined, size: 15, color: Colors.black,),
                ),
              hintText: ' Usuario',
              hintStyle: TextStyle(fontSize: 15, color: Colors.black),
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
              Text('ingresar contraseña', style: TextStyle(fontSize: 20)),
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
                fontSize: 15,
                ),
             prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(Icons.password_outlined, size: 15, color: Colors.black,),
                ),
              hintStyle: TextStyle(fontSize: 15, color: Colors.black),
              hintText: ' Contraseña',
            ),
            controller: usrPass,
            style: const TextStyle(fontSize: 15),
            validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresar Contraseña';
                }
                return null;
              },
              obscureText: true,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10)
        ),
        SizedBox(
          child: Center(
            child: MaterialButton(
              minWidth: 350,
              height: 50,
              color:  Colors.black,
               shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)
                )
              ),
              onPressed: () {
                if (_key.currentState!.validate()) {
                        login();
                      } 
              },
              child: const Text('Ingresar', style: TextStyle(fontSize: 20, color: Colors.white),),
              ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10)
        ),
         SizedBox(
          child: Center(
            child: MaterialButton(
               minWidth: 350,
              height: 50,
              color:  Colors.black,
               shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)
                )
              ),
              onPressed: () {
                 Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegistrarScreen()) 
                );
              },
              child: const Text('Registrar', style: TextStyle(fontSize: 20, color: Colors.white),),
              ),
          ),
        ),
      ],
    )
    );
  }
}