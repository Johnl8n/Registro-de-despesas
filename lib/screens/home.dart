import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Teste"),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (null), 
        child: const Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.purple,
        child: IconTheme(
          data: IconThemeData(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(10.0), 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: (null),
                  icon: Icon(Icons.home)
                ),
                 IconButton(
                  onPressed: (null),
                  icon: Icon(Icons.list)
                ),
                SizedBox(width: 20,),
                IconButton(
                  onPressed: (null),
                  icon: Icon(Icons.air_rounded)
                ),
                IconButton(
                  onPressed: (null),
                  icon: Icon(Icons.air_rounded)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}