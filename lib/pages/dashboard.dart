import 'package:flutter/material.dart';
import 'package:mobileprogramming_uts/pertemuan/pertemuan1.dart';
import 'package:mobileprogramming_uts/pertemuan/pertemuan2.dart';
import 'package:mobileprogramming_uts/pertemuan/pertemuan3.dart';
import 'package:mobileprogramming_uts/pertemuan/pertemuan4.dart';
import 'package:mobileprogramming_uts/pertemuan/pertemuan5.dart';
import 'package:mobileprogramming_uts/pertemuan/pertemuan6.dart';
import 'package:mobileprogramming_uts/pertemuan/pertemuan7.dart';

class DashboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {
      "title": "Pertemuan 1",
      "subtitle": "Hellow Word",
      "icon": Icons.auto_stories,
      "color": Colors.blue,
      "page": HelloWord(),
    },
    {
      "title": "Pertemuan 2",
      "subtitle": "Column & Row",
      "icon": Icons.auto_stories,
      "color": Colors.blue,
      "page": ColumnRow(),
    },
    {
      "title": "Pertemuan 3",
      "subtitle": "Form Produk",
      "icon": Icons.auto_stories,
      "color": Colors.blue,
      "page": Produkform(),
    },
    {
      "title": "Pertemuan 4",
      "subtitle": "Form Pekerjaan",
      "icon": Icons.auto_stories,
      "color": Colors.blue,
      "page": Alertform(
        jobs: [],
        onAddJob: (String data) {},
        onDelete: (int index) {},
        onRespond: (int index) {},
      ),
    },
    {
      "title": "Pertemuan 5",
      "subtitle": "ListView",
      "icon": Icons.auto_stories,
      "color": Colors.blue,
      "page": ListPage(),
    },
    {
      "title": "Pertemuan 6",
      "subtitle": "Form Checkbox",
      "icon": Icons.auto_stories,
      "color": Colors.blue,
      "page": CheckboxPage(),
    },
    {
      "title": "Pertemuan 7",
      "subtitle": "Form RadioButton",
      "icon": Icons.auto_stories,
      "color": Colors.blue,
      "page": RadiobuttonPage(),
    },
    // {
    //   "title": "Pertemuan 8",
    //   "icon": Icons.auto_stories,
    //   "color": Colors.red,
    //   "page": SwitchPage(),
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Mobile Programming',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.3,
            fontSize: 18,
          ),
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
      body: Column(
        children: [
          _buildInfoBanner(),

          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return _buildMenuCard(
                  context,
                  title: item['title'],
                  subtitle: item['subtitle'],
                  icon: item['icon'],
                  color: item['color'],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => item['page']),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
  Widget _buildInfoBanner() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF57bcf2), Color(0xFF4287f5)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: Row(
        children: [
          // Ikon di samping kiri
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(Icons.menu_book, color: Colors.white, size: 40),
          ),
          SizedBox(width: 20),
          // Detail Informasi
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mobile Programming",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.person, color: Colors.white70, size: 14),
                    SizedBox(width: 5),
                    Text("Dosen: Nafiah, S.Si., M.Kom", style: TextStyle(color: Colors.white70)),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.white70, size: 14),
                    SizedBox(width: 5),
                    Text("Jadwal: 11:00 - 12:40 WIB", style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(
      BuildContext context, {
        required String title,
        required subtitle,
        required IconData icon,
        required Color color,
        required VoidCallback onTap,
      }) {
    return Card(
      margin: EdgeInsets.only(right: 16,left: 16,bottom: 10),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 28, color: color),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}