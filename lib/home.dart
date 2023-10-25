import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar( 
        elevation: 0,
        backgroundColor: Colors.deepPurple[100],
        title: const Text('Informativa'),
      ),
      body:  Stack(
        children: [
          Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          margin: const EdgeInsets.all(70),
                      alignment: AlignmentDirectional.topCenter,
                      child: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: const Image(
                      image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                    ),
                  ),           
            ),
           Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  margin: const EdgeInsets.all(100),
                  child: const Text('Lechuza', style: TextStyle(fontSize: 15, color: Colors.white),
                ),        
                          ),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 215, horizontal: 10),
                  margin: const EdgeInsets.all(50),
                  child: const Text('Lechuza', style: TextStyle(fontSize: 25, color: Colors.black),
                ),  
                        ),
                 Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 286),
                child: const ListTile(
                   title: Padding(
                   padding: EdgeInsets.all(10),
                   child: Text(
                    'Cupidatat culpa eu deserunt in in exercitation. Aliqua magna quis dolore enim duis non id irure enim esse commodo eu laboris. Consectetur veniam aliquip deserunt veniam exercitation.'
                     , style: TextStyle(fontSize: 15),),
                    ),
                  ), 
                          ),
        ],
      )
      
    );
  }
}


