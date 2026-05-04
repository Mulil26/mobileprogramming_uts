import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:simple_alert_dialog/simple_alert_dialog.dart';

class Alertform extends StatefulWidget {
  final List<String>jobs;
  final Function(int) onDelete;
  final Function(int) onRespond;
  final Function(String) onAddJob;

  const Alertform({
    super.key,
    required this.onAddJob,
    required this.jobs ,
    required this.onDelete,
    required this.onRespond,
  });

  @override
  State<Alertform> createState() => _AlertformState();
}
class _AlertformState extends State<Alertform> {

  late final posisiController = TextEditingController();
  final perusahaanController = TextEditingController();
  final masaController = TextEditingController();

  List<String> _jobs = [];

  @override
  void initState() {
    super.initState();
    // 2. Inisialisasi data lokal saat pertama kali dibuka
    _jobs = List.from(widget.jobs);
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pertemuan 4 - Form Pekerjaan',
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text(
            'Form pekerjaan',
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
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.all(16),
                  child:Column( children: [
                    TextField(
                      controller: posisiController,
                      decoration:  InputDecoration(
                        labelText: "Masukkan Posisi Anda",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: perusahaanController,
                      decoration:  InputDecoration(
                        labelText: "Masukkan Perusahaan Anda",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: masaController,
                      decoration:  InputDecoration(
                        labelText: "Masukkan Masa Jabatan Anda",
                        border: OutlineInputBorder(),
                      ),
                    ),],)
              ),

              const SizedBox(height: 20),
              // Submit Button
              InkWell(
                onTap: () {
                  if (posisiController.text.isNotEmpty &&
                      perusahaanController.text.isNotEmpty &&
                      masaController.text.isNotEmpty) {
                    SimpleAlertDialog.show(
                      context,
                      assetImagepath: AnimatedImage.confirm,
                      buttonsColor: Colors.green,
                      title: AlertTitleText("Apakah kamu yakin?"),
                      content: AlertContentText(
                          "Apakah kamu ingin menambahkan data"),
                      onConfirmButtonPressed: (ctx) {

                        String newJobData = "${posisiController.text} - ${perusahaanController.text} - ${masaController.text}";

                        widget.onAddJob(newJobData);
                        setState(() {
                          _jobs.add(newJobData);
                        });

                        // widget.onAddJob(
                        //     "${posisiController.text} - "
                        //         "${perusahaanController.text} - "
                        //         "${masaController.text}"
                        // );

                        CherryToast.success(
                          inheritThemeColors: true,
                          title: Text("Berhasil menambahkan data!"),
                          borderRadius: 0,
                        ).show(context);

                        posisiController.clear();
                        perusahaanController.clear();
                        masaController.clear();

                        Navigator.pop(context);
                      },
                    );
                  }
                },
                child: Container(
                  padding:  EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Delete Button
              InkWell(
                onTap: () {
                  SimpleAlertDialog.show(
                    context,
                    assetImagepath: AnimatedImage.warning,
                    buttonsColor: Colors.red,
                    title:  AlertTitleText("Apakah kamu yakin?"),
                    content:  AlertContentText("Apakah kamu ingin menghapus data"),
                    onConfirmButtonPressed: (ctx) {
                      CherryToast.success(
                        inheritThemeColors: true,
                        title: const Text("Berhasil menghapus data!"),
                        borderRadius: 0,
                      ).show(context);
                      Navigator.pop(context);
                    },
                  );
                },
                child: Container(
                  padding:  EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Text(
                    "Delete",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Show Dialog Button
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title:  Text("AlertDialog"),
                      contentPadding:  EdgeInsets.all(20),
                      content:  Text("Ini AlertDialog"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child:  Text("Tutup"),
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                  padding:  EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Text(
                    "Show Dialog",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Text(
                "Daftar Pekerjaan",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _jobs.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(_jobs[index]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              SimpleAlertDialog.show(
                                context,
                                assetImagepath: AnimatedImage.warning,
                                buttonsColor: Colors.red,
                                title: AlertTitleText("Apakah kamu yakin?"),
                                content: AlertContentText("Apakah kamu ingin menghapus pekerjaan ini?"),
                                onConfirmButtonPressed: (ctx) {
                                  setState(() {
                                    _jobs.removeAt(index);
                                  });
                                  CherryToast.success(
                                    inheritThemeColors: true,
                                    title: const Text("Berhasil menghapus pekerjaan!"),
                                    borderRadius: 0,
                                  ).show(context);
                                  Navigator.pop(context);
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
