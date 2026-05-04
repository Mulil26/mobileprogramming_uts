import 'package:flutter/material.dart';

class ColumnRow extends StatelessWidget{


  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: 'Pertemuan 2 - Column & Row',
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Column & Row',
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 25,
            children: [
              Row(
                spacing: 25,
                children: [
                  Text('Row1'),
                  Text('Row2'),
                  Text('Row3'),
                  Text('Row4'),
                ],
              ),

                Text('Kolom1'),
                Text('Kolom2'),
                Text('Kolom3'),
                Text('Kolom4'),
            ],
          ),
        ),
      ),
    );
  }
}
