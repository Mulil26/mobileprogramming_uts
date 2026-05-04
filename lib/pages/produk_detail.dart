import 'package:flutter/material.dart';

class ProdukDetail extends StatefulWidget {
  final String kodeproduk;
  final String namaproduk;
  final int harga;

  ProdukDetail({
    required this.kodeproduk,
    required this.namaproduk,
    required this.harga,
  });

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Produk')),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Kode Produk : " + widget.kodeproduk),
          Text("Nama Produk : ${widget.namaproduk}"),
          Text("Harga : ${widget.harga.toString()}"),
        ],
      ),
    );
  }
}
