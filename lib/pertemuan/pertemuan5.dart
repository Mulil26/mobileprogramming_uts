import 'package:flutter/material.dart';
import 'package:mobileprogramming_uts/pages/profile.dart';
import 'package:mobileprogramming_uts/pages/pertemuan_page.dart';

class ListPage extends StatefulWidget {
  ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Widget> page = [ProfilePage(), ListPage()];
  List<Pertemuan> pertemuan = [
    Pertemuan(title: 'Pertemuan 1', subtitle: 'Pengenalan Android'),
    Pertemuan(title: 'Pertemuan 2', subtitle: 'Pengenalan Android'),
    Pertemuan(title: 'Pertemuan 3', subtitle: 'Pengenalan Android'),
    Pertemuan(title: 'Pertemuan 4', subtitle: 'Pengenalan Android'),
    Pertemuan(title: 'Pertemuan 5', subtitle: 'Pengenalan Android'),
    Pertemuan(title: 'Pertemuan 6', subtitle: 'Pengenalan Android'),
    Pertemuan(title: 'Pertemuan 7', subtitle: 'Pengenalan Android'),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pertemuan 5 - List View',
      home :  Scaffold(
        backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            title: const Text(
              'List View',
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
        body: ListView.builder(
          itemCount: pertemuan.length,
          itemBuilder: (context, index) {
            final Pertemuan = pertemuan[index];
            return Card(
              child: ListTile(
                leading: Icon(Icons.list),
                title: Text(Pertemuan.title),
                subtitle: Text(Pertemuan.subtitle),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PertemuanPage(pertemuan: Pertemuan),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class Pertemuan {
  final String title;
  final String subtitle;

  Pertemuan({required this.title, required this.subtitle});
}
