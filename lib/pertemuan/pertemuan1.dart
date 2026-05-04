import 'package:flutter/material.dart';

class HelloWord extends StatelessWidget{

  int currentPage = 0;

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: 'Pertemuan 1 - Hello Word',
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Hello Word',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3,
                fontSize: 18,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: const Color(0xFF4287f5),
            foregroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            ),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF4287f5), Color(0xFF57bcf2)],
                ),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
              ),
            ),
          ),
        body: Center(
            child : Text('Hello Guys')),
      ),
    );
  }
}
